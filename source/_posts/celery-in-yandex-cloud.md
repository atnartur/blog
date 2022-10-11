---
title: Развертывание Django+Celery приложения в Яндекс.Облаке с использованием Serverless технологий
date: 2022-09-02 13:52:22
tags:
    - Яндекс.Облако
    - Django
category: О разработке
---

В Яндекс.Облаке есть сервисы, позволяющее запустить обработку задач из очереди сообщений. Celery из коробки умеет работать с аналогичными сервисами в Amazon Web Services, а для работы с Яндекс.Облаком нужно лишь немного поправить конфигурацию. Именно об этом и будет эта статья.

Заодно мы развернем приложение в [Serverless Containers](https://cloud.yandex.ru/docs/serverless-containers/) - сервисе Яндекс.Облака, который запускает Docker-контейнер только в тот момент, когда происходит обращение к нему. И уместимся в [Serverless Free Tier](https://cloud.yandex.ru/docs/billing/concepts/serverless-free-tier), чтобы приложение работало почти бесплатно.

<!--more-->

## Запуск контейнера
Для того, чтобы приложение корректно запустилось в Serverless Containers, нужно добавить переменную окружения `PORT`, которая будет устанавливать порт для запуска приложения. Итоговый Dockerfile для Django может выглядеть вот так:




```dockerfile
FROM python:3.10

ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

# указываем переменную окружения
ENV PORT 8000

COPY . .

RUN python manage.py collectstatic --no-input

# gunicorn должен быть указан в requirements.txt
# projectname нужно заменить на пакет с Django-проектом
CMD gunicorn --chdir src --bind 0.0.0.0:$PORT projectname.wsgi
```

Далее собираем контейнер:

- `docker build -t myproject .` - собираем образ
- `docker run -ti --rm -p 8000:8000 myproject` - запускаем контейнер
- открываем в браузере http://localhost:8000 и проверяем, кто приложение работает правильно.

Далее по [инструкции Яндекс.Облака](https://cloud.yandex.ru/docs/serverless-containers/quickstart) запускаем контейнер.

## Подключение к очереди сообщений
[Celery](https://docs.celeryq.dev/en/stable/) - инструмент для работы с очередями сообщений на Python. Он хорошо интегрируется с Django, но также может использоваться и без него.

Celery [поддерживает несколько брокеров сообщений](https://docs.celeryq.dev/en/stable/getting-started/backends-and-brokers/index.html), но нас интересует Amazon SQS в первую очередь, так как Yandex Message Queue имеет поддержку Amazon SQS API.

Первым делом создаем Message Queue по [официальной инструкции](https://cloud.yandex.ru/docs/message-queue/quickstart).

По умолчанию Celery настроен на работу с Amazon SQS. Чтобы настроить Celery для работы с Yandex Message Queue, немного поменяем `settings.py`:

```python
# по умолчанию указан Redis, но позже мы установим подключение к Yandex Message Queue
CELERY_BROKER_URL = os.environ.get("CELERY_BROKER_URL", "redis://localhost:6379/0")

# указываем дополнительные опции для передачи сообщений, если устанавливается подключение к SQS
SQS_QUEUE = os.environ.get("SQS_QUEUE")
if SQS_QUEUE:
    CELERY_BROKER_TRANSPORT_OPTIONS = {
        'is_secure': True,
        'predefined_queues': {
            'default': {
                'url': SQS_QUEUE,
                'access_key_id': os.environ.get("SQS_ACCESS_KEY_ID"),
                'secret_access_key': os.environ.get("SQS_SECRET_ACCESS_KEY"),
            }
        },
        'region': os.environ.get("SQS_REGION")
    }
```

Указываем переменные окружения c заменой `{ПЕРЕМЕННЫХ}` на значения, полученные при создании очереди:

```
CELERY_BROKER_URL=sqs://{ACCESS_KEY}:{SECRET_KEY}@message-queue.api.cloud.yandex.net
SQS_ACCESS_KEY_ID={ACCESS_KEY}
SQS_SECRET_ACCESS_KEY={SECRET_KEY}
SQS_REGION={REGION}  # например, ru-central1
```

*Для указания переменных окружения можно использовать модуль [dotenv](https://pypi.org/project/python-dotenv/) и  файл `.env` . Если вы тестируете работу сразу в Яндекс.Облаке, то переменные окружения можно указать [при создании новой версии контейнера](https://cloud.yandex.ru/docs/serverless-containers/operations/manage-revision#revision-env).*

Устанавливаем дополнение Celery для работы с SQS:
- pip: `pip install celery[sqs]`
- poetry: `poetry add 'celery[sqs]'`

После этого запускаем проект и пробуем добавить задачу в очередь (например, вызываем какой-нибудь URL, в котором происходит `task.delay()`).

## Запуск воркеров через POST-запрос
Организовать обработку сообщений, поступающих в очередь, можно несколькими способами
1. запустить celery worker, который будет сам забирать сообщения и обрабатывать их
2. настроить триггер в Yandex Message Queue, который будет вызывать [Cloud Function](https://cloud.yandex.ru/services/functions) или делать HTTP-запрос куда-либо при появлении нового сообщения.

Мы воспользуемся вторым способом и настроим HTTP-вызов при появлении сообщения в очередь. Чтобы этот вызов обрабатывался, добавим новый view в Django.

***TLDR: ниже есть код готового обработчика запросов для Django***

Тело HTTP-запроса с сообщением от Celery выглядит примерно так (некоторые данные скрыты):

```json
{
    "messages":
    [
        {
            "event_metadata":
            {
                "event_id": "...",
                "event_type": "yandex.cloud.events.messagequeue.QueueMessage",
                "created_at": "2022-09-02T05:38:46.026Z",
                "tracing_context": null,
                "cloud_id": "...",
                "folder_id": "..."
            },
            "details":
            {
                "queue_id": "...",
                "message":
                {
                    "message_id": "...",
                    "md5_of_body": "...",
                    "body": "BODY",
                    "attributes":
                    {
                        "ApproximateFirstReceiveTimestamp": "1662097126149",
                        "ApproximateReceiveCount": "1",
                        "SentTimestamp": "1662097126026"
                    },
                    "message_attributes":
                    {},
                    "md5_of_message_attributes": ""
                }
            }
        }
    ]
}
```

В этом сообщении нас интересует `BODY` - в нем содержится json, который отправил Celery, закодированный в base64. Если его раскодировать, мы увидим примерно следующее:

```json
{
    "body": "BODY2",
    "content-encoding": "utf-8",
    "content-type": "application/json",
    "headers":
    {
        "lang": "py",
        "task": "TASK",
        "id": "...",
        "shadow": null,
        "eta": null,
        "expires": null,
        "group": null,
        "group_index": null,
        "retries": 0,
        "timelimit":
        [
            null,
            null
        ],
        "root_id": "...",
        "parent_id": null,
        "argsrepr": "...",
        "kwargsrepr": "{}",
        "origin": "gen83@yc-serverless",
        "ignore_result": false,
        "headers": {}
    },
    "properties":
    {
        "correlation_id": "...",
        "reply_to": "...",
        "delivery_mode": 2,
        "delivery_info":
        {
            "exchange": "",
            "routing_key": "default"
        },
        "priority": 0,
        "body_encoding": "base64",
        "delivery_tag": "..."
    }
}
```

Вместо `TASK` выше будет что-то типа `appname.tasks.function_name` (т. е. путь до функции-обработчика задачи). `BODY2` - это опять json в base64 с аргументами команды:

```json
[
    ["value1", "value2"], 
    {}, 
    {"callbacks": null, "errbacks": null, "chain": null, "chord": null}
]
```

В нем - tuple с тремя аргументами: `args, kwargs, options`. Эта информация должна быть передана в таск для того, чтобы вызвать его с правильными параметрами.

**В итоге код обработчика запросов выглядит так:**

```python
@api_view(["POST"])  # декоратор из django rest framework
def worker_view(request):
    # request.data - JSON из тела запроса
    for message in request.data['messages']:
        # декодируем сообщение
        data_json = base64.b64decode(message['details']['message']['body']).decode()
        data = app.backend.decode(data_json)

        # находим функцию с таском
        module_path = data['headers']['task'].split('.')
        package_path = ".".join(module_path[:-1])
        function_name = module_path[-1]
        module = importlib.import_module(package_path)
        function = getattr(module, function_name)

        # делаем принудительное сохранение результатов (об этом ниже)
        store_result_original_value = app.conf.task_store_eager_result
        app.conf.task_store_eager_result = True

        # достаем аргументы
        args, kwargs, options = json.loads(base64.b64decode(data['body']))

        # вызываем таск
        result = function.apply(
            args=args, 
            kwargs=kwargs, 
            task_id=data['headers']['id'], 
            headers=data['headers']['headers'], 
            **options
        )

        # возвращаем настройки в исходное положение
        app.conf.task_store_eager_result = store_result_original_value

        # возвращаем ответ в зависимости  от успешности обработки задачи
        if not result.successful():
            capture_exception(result.info)
            return JsonResponse({"status": "error", "info": str(result.info)})

    return JsonResponse({"status": "ok"}, status=200)
```

*Такая обработка задач поддерживает не все возможности Celery, но позволяет запустить простейшую обработку в Serverless Containers*

Подключаем его в `urls.py`:

```python
    path("worker/", worker, name='worker')
```

## Создание триггера
Конкретные шаги по созданию триггера для вызова контейнера при получении сообщения в очереди [описаны в официальной инструкции](https://cloud.yandex.ru/docs/functions/operations/trigger/ymq-trigger-create). 

Подскажу некоторые параметры, которые нужно указывать при создании триггера, на примере команды для консоли:

```bash
yc serverless trigger create message-queue \
      --name=NAME \
      --queue QUEUE \
      --queue-service-account-id SERVICE_ACCOUNT_ID \
      --invoke-container-service-account-id SERVICE_ACCOUNT_ID \
      --invoke-container-id CONTAINER_ID \
      --invoke-container-path CONTAINER_PATH
```

замените параметры:
- `NAME` - название триггера
- `QUEUE` - arn очереди (строка вида `yrn:yc:ymq:REGION:FOLDER_ID:QUEUE_NAME`, можно скопировать на странице очереди в консоли Яндекс.Облака)
- `SERVICE_ACCOUNT_ID` - ID сервисного аккаунта
- `CONTAINER_ID` - ID контейнера
- `CONTAINER_PATH` - URL-адрес в контейнере, который занимается обработкой сообщений из очереди (в нашем случае - это `/worker/`)

Можете снова запустить создание задачи в Celery, через некоторое время она должна обработаться. Информацию об обработке можно посмотреть в логах контейнера и в мониторинге очереди в консоли Яндекс.Облака.

## Сохранение результатов обработки задач
Бывают задачи, когда важно получить информацию об итогах обработки задачи в Celery. 
Поэтому Celery может сохранять все данные, которые функции с задачами возвращают после своей работы. Если для вашего проекта это не применимо, можете пропустить этот раздел.

Механизм сохранения работает на базе celery result backends. Нас сейчас интересует [AWS DynamoDB backend](https://docs.celeryq.dev/en/stable/internals/reference/celery.backends.dynamodb.html), так как в Яндексе есть Yandex Database Serverless, [поддерживающая DynamoDB API](https://cloud.yandex.ru/docs/ydb/docapi/tools/aws-setup).

Создаем Yandex DB Serverless [по официальной инструкции](https://cloud.yandex.ru/docs/ydb/quickstart#serverless). Serverless-режим тарифицируется по использованию и бесплатные квоты.

Устанавливаем дополнение Celery для работы с DynamoDB:
- pip: `pip install celery[sqs,dynamodb]`
- poetry:  `poetry add 'celery[sqs,dynamodb]'`

Добавляем новую константу в `settings.py`:

```python
CELERY_DYNAMODB_ENDPOINT_URL = os.environ.get("CELERY_DYNAMODB_ENDPOINT_URL")
```

Устанавливаем значение этой переменной из параметра Document API Endpoint (доступен на странице Yandex DB в консоли Яндекс.Облака).

Поясню про принудительное сохранение результатов в коде обработчика задачи. Дело в том, что принудительный вызов Celery-задач с помощью `apply()` возвращает `EagerResult`, который по умолчанию [не должен сохраняться](https://docs.celeryq.dev/en/stable/userguide/configuration.html#std-setting-task_store_eager_result). В нашей ситуации, наоборот, нужно сохранять такие результаты, поэтому мы сначала устанавливаем настройку в нужное нам положение, а потом возвращаем все как было, чтобы не мешать другим процессам, происходящим в приложении.

В целом, настройка связи с result backend завершена, можете попробовать запустить задачу с возвращением результатов и проверить, что эти результаты действительно возвращаются.

## Настройка домена
В Яндекс.Облаке есть [API Gateway](https://cloud.yandex.ru/docs/api-gateway/) для соединения нескольких сервисов под один хост. У нас по факту лишь один сервис, который предназначен для общения с внешним миром (это наш serverless container, развернутый в самом начале). 

С API Gateway, кроме всего прочего, удобно подсоединять домены к развернутым в облаке приложениям.

Создадим API Gateway по [официальной инструкции](https://cloud.yandex.ru/docs/api-gateway/quickstart/), но в конфигурации укажем примерно следующее:

```yml
openapi: "3.0.0"
info:
  version: 1.0.0
  title: PROJECT NAME
paths:
  /{url+}:
    x-yc-apigateway-any-method:
      summary: Execute container
      operationId: container
      parameters:
      - explode: false
        in: path
        name: url
        required: false
        style: simple
      x-yc-apigateway-integration:
        type: serverless_containers
        container_id: CONTAINER_ID
        service_account_id: SERVICE_ACCOUNT_ID
```

Здесь указано, что все запросы, приходящие на API Gateway, будут переадресовываться на serverless container. Нужно заменить некоторые параметры:
- `PROJECT NAME` - название проекта
- `CONTAINER_ID` - ID контейнера
- `SERVICE_ACCOUNT_ID` - ID сервисного аккаунта

После создания появится адрес API Gateway, по которому можно будет обращаться к нашему приложению извне.

Теперь можно [подключить свой домен и настроить HTTPS сертификат с помощью Let's Encrypt](https://cloud.yandex.ru/docs/api-gateway/operations/api-gw-domains) прямо в консоли Яндекс.Облака.

## Free Tier
В начале я сказал, что почти всё использование сервисов, описанных в этой статье, будет бесплатным благодаря [Free Tier](https://cloud.yandex.ru/docs/billing/concepts/serverless-free-tier).

Действительно, Serverless Containers, Message Queue, YDB Serverless, API Gateway имеют определенный объем услуг, который не тарифицируется. 

Yandex Database может работать на выделенных серверах, и тарифицироваться это будет значительно дороже. Мы использовали Serverless-вариант, входящий в Free Tier.

Используемый нами [Yandex Container Registry](https://cloud.yandex.ru/docs/container-registry/pricing/) тарифицируется. На момент написания статьи 3 руб/месяц за 1ГБ хранения. Чтобы сэкономить и здесь, можно настроить [автоудаление образов](https://cloud.yandex.ru/docs/container-registry/operations/lifecycle-policy/lifecycle-policy-create), так как после деплоя контейнера они больше будут не нужны.

В статье не рассматривалось подключение к PostgreSQL/MySQL. Можете ознакомиться с их стоимостью на [сайте Яндекс.Облака](https://cloud.yandex.ru/prices) и принять решение об использовании их в своем проекте.

## Автоматизация
Автоматизировать этот процесс можно, например, с помощью [Terraform](https://www.terraform.io/). У Яндекс.Облака [есть провайдер](https://registry.terraform.io/providers/yandex-cloud/yandex/latest), позволяющий настроить большинство сервисов.

На момент написания статьи не было возможности заставить Message Queue trigger запускать serverless container, поэтому мне пришлось вызывать консольную команду через `yc` для этого.

[Посмотреть конфигурационный файл Terraform](https://gist.github.com/atnartur/1dfce86d4999796d8d6b9949c60e8d12)
