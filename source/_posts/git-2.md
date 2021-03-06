---
title: 'GIT - часть вторая: регистрация и установка'
tags:
  - GIT
id: 321
categories:
  - О разработке
date: 2013-07-02 14:00:00
alias: /git-tchasty-vtoraya-registratsiya-i-ustanovka/
---

В статье показано, как работать с GIT на практике, используя [BitBucket](http://bitbucket.org) и GIT Bash. <!--more-->

Перед прочтением этой статьи рекомендуется прочитать её [первую часть](http://atnartur.ru/git-tchasty-pervaya-osnov/ "GIT — часть первая: основы").

[BitBucket - регистрация](#reg) 
[BitBucket - создание репозитория](#repo_create) 
[Установка GIT на Windows 7](#git_setup)

<a name="reg"></a>

### BitBucket - регистрация

[![BitBucket](/content/2013/07/Image-000-300x139.png)](/content/2013/07/Image-000.png)

BitBucket  - бесплатный хостинг GIT репозиториев. Имеет неплохую документацию.

Приступим к регистрации. Переходим [сюда](https://bitbucket.org/account/signup/ "Регистрация")

И заполняем форму регистрации: 

[![Форма регистрации](/content/2013/07/Image-001-300x271.png)](/content/2013/07/Image-001.png)

После этого на ваш почтовый ящик приходит письмо. Там нажимаем на единственную кнопку.

[![Письмо](/content/2013/07/Image-002-300x69.png)](/content/2013/07/Image-002.png)

После регистрации попадаем сюда. 

[![Личный кабинет](/content/2013/07/Image-003-300x154.png)](/content/2013/07/Image-003.png)

Русская версия находится на стадии тестирования, но включить русский язык все же можно. Нажимаем на аватар, затем Manage account

[![Manage account](/content/2013/07/Image-004-300x254.png)](/content/2013/07/Image-004.png)

На открывшейся странице выбираем русский язык и нажимаем на кнопку:

[![Настройки языка](/content/2013/07/Image-006-300x147.png)](/content/2013/07/Image-006.png)

После этого BitBucket становится русским. 

Как я уже говорил, русская версия находится на стадии тестирования и в ней иногда попадаются ошибки:D

> Я ТАЩУУУСЬ:DD [@Cafe4me_tweet](https://twitter.com/Cafe4me_tweet) [@lektor116](https://twitter.com/lektor116) [pic.twitter.com/a2FF0aWYoB](http://t.co/a2FF0aWYoB)
> &mdash; atnartur (@atnartur) [June 28, 2013](https://twitter.com/atnartur/statuses/350698119689801730)
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

<a name="repo_create"></a>

### BitBucket - создание репозитория

После регистрации в сервисе, нужно создать наш первый GIT репозиторий. Нажимаем на кнопку "Создать":

[![Image 008](/content/2013/07/Image-008.png)](/content/2013/07/Image-008.png)

На открывшейся странице вводим имя, описание (есть хотите). Остальное можно так оставить:)

[![](/content/2013/07/Image-009-300x227.png)](/content/2013/07/Image-009.png)

Открывается такая страница. Временно оставим её нетронутой и пойдем устанавливать GIT.

[![](/content/2013/07/Image-010-300x165.png)](/content/2013/07/Image-010.png)

<a name="git_setup"></a>

### Установка GIT на Windows 7

Для начала [скачиваем установщик GIT](http://yadi.sk/d/3oyS0Ecb7AylD "GIT Installer").

После скачивания, запускаем. Далее, принимаем лицензионное соглашение, еще раз далее, потом кликаем сюда:

[![Установка](/content/2013/07/Image-011-300x233.png)](/content/2013/07/Image-011.png)

и опять далее, далее, и, наконец, установка... Ждем. Нажимаем finish и выходим из установщика.

После этого ищем на рабочем столе такой значок и кликаем по нему.

[![](/content/2013/07/Image-012.png)](/content/2013/07/Image-012.png)

Открывается консоль:

[![](/content/2013/07/Image-013-300x82.png)](/content/2013/07/Image-013.png)

Чтобы установить связь с нашим аккаунтов в BitBucket нужно создать SSH-ключ. Для этого наберем:

`cd ~/.ssh
ssh-keygen -t rsa -C "mail@example.com"`

[![](/content/2013/07/Image-014-300x101.png)](/content/2013/07/Image-014.png)

Вместо mail@example.com наберите свой email, который вы указывали при регистрации на BitBucket.

Нажимаем enter

[![](/content/2013/07/Image-015-300x27.png)](/content/2013/07/Image-015.png)

Набираем пароль в подчеркнутых местах. Пароль не будет показываться в консоли.

[![](/content/2013/07/Image-016-300x15.png)](/content/2013/07/Image-016.png)

Ключ сгенерирован! Чтобы скопировать его, переходим в эту папку:

`%USERNAME%/.ssh`

[![](/content/2013/07/Image-017-300x61.png)](/content/2013/07/Image-017.png)

И ищем там `id_rsa.pub`

[![Image 018](/content/2013/07/Image-018-300x101.png)](/content/2013/07/Image-018.png)

Открываем его через блокнот и копируем оттуда все содержимое (нажимаем сначала `CTRL+A` потом `CTRL+C`)

[![](/content/2013/07/Image-019.png)](/content/2013/07/Image-019.png)

Теперь переходим в Настройки/SSH ключи и добавляем ключ.
[![Добавление ключа](/content/2013/07/Image-020-300x187.png)](/content/2013/07/Image-020.png)

Ключ добавлен и репозиторий готов к работе! 

GIT на практике - продолжение следует...

Что-то не понятно? Напишите в комментарии! Статья помогла вам? Поделитесь!