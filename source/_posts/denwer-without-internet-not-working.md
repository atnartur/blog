---
title: Не работает Денвер при отключенном интернете
tags:
  - windows
  - браузеры
  - Денвер
id: 134
categories:
  - О разработке
date: 2013-05-03 07:00:00
alias: /ne-rabotaet-denver-pri-otklyutchennom-internete/
---

Здравствуйте. Недавно у меня появилась такая проблема: при отсутствии подключения к интернету, Денвер запускался, но сайты не открывались ни в одном браузере.

Сегодня, убив целый час на поиск проблемы, я все же её нашел. Подробнее здесь <!--more-->

[![Денвер](/content/2013/05/11.gif)](/content/2013/05/11.gif)

**Подробнее о проблеме** Когда интернет включен, локальные сайты открываются. Когда интернета нет, локальные сайты не открываются. Все просто:)

Сначала я копал в настройки брандмауэра, сетевых подключений и прочего... После всего этого пришла в голову мысль создать подключение **Loopback** (петля), которое подключается к этому же компьютеру. Способ создания петли искал долго, но не нашел... 

Затем пробовал создавать **сетевой мост** среди нескольких подключений. Это тоже не дало никаких результатов... 

У меня стоит еще один локальный сервер - Open Server. Попробовал запустить его. И ОН ОТКРЫЛСЯ! У меня было просто изумление... Значит дело в Денвере...

**Начал сравнивать конфигурации Apache** двух комплектов. Мучал директиву Listen. 

После этого решил взглянуть на **окно отчета Apache** (честно говоря не знаю как оно правильно называется, но выглядит оно так). Вызывается оно по клику на иконку Apache в трее (![Image 001](/content/2013/05/Image-001.png)).

[![Image 000](/content/2013/05/Image-000-300x170.png)](/content/2013/05/Image-000.png)

На этом скриншоте - все хорошо. Интернет включен и все нормально работает. 

А вот так оно выглядело, когда проблема еще не была решена:

[![Image 003](/content/2013/05/Image-003-300x173.png)](/content/2013/05/Image-003.png)

У него не получается разрешить адрес 192.168.0.**:80\. Когда интернета нет, WiFi тоже не работает, значит и этого IP адреса нет. Как раз на это Apache и ругается.

У меня один из сайтов Денвера открыт в локальную сеть. В связи с этим в .htaccess этого сайта написано: 

[![Image 002](/content/2013/05/Image-002.png)](/content/2013/05/Image-002.png)

После того, как я убрал эту строку из .htaccess и перезапустил Денвер, все заработало!

**Вывод**

Прежде чем гуглить, посмотрите на окно отчета Apache. Там пишется много всего интересного.

Если уж начали искать, поищите сначала на [на сайте проекта](http://denwer.ru "Официальный сайт Денвера") в разделе FAQ. Возможно найдете ответ там.

Если уж не нашли, тогда гуглите.