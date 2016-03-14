---
title: Веб-программирование в Байтике
tags:
  - cafe4me
  - ClienD
  - GIT
  - Google
  - Байтик
  - Проекты
  - Школа
id: 591
categories:
  - Жизнь
date: 2013-10-13 11:00:00
---

Сегодня я приехал со смены "Веб-программирование при поддержке Google". Эта смена, как и все остальные смены IT-Jump, проходила в Байтике, но была и особенность: перед нами выступали специалисты из Google. Все подробности далее. <!--more-->

> Стартовала программа &quot;Вперед вместе с Google!&quot;&#10;Наши IT-Jump&#39;еры уже здесь! [pic.twitter.com/4PLZGt2kax](http://t.co/4PLZGt2kax)
> &mdash; Лагерь Байтик (@Baytik_Kazan) [October 7, 2013](https://twitter.com/Baytik_Kazan/statuses/387157908213207040)

На каждой смене в Байтике собирается команда и эта команда создает свой проект. Мы приехали в этот раз впятером: [Костя](http://www.keeplinks.org/) - главный программист и руководитель, [Данил](http://live-notes.ru) - серверная часть, я - клиентская часть, Яков - аудиовизуальное оформление и Ксения - художник.

Проект тоже был придуман и маленько продуман до смены. Это браузерная платформа для многопользовательских игр на реакцию. Ну и для демонтрации платформы нужно было конечно же написать какую-нибудь игру. Идей было много, но остановились мы на музыкальных стульях (музыка кончается, игроки садятся на стулья, один игрок не успевает сесть и проигрывает).

Сложность проекта была в том, что нужно очень быстро обмениваться информацией с сервером и другими клиентами. Поэтому для реализации мы выбрали Nginx (быстрый веб-сервер, аналог Apache), Node.JS (серверный JavaScript, выступил аналогом PHP), Redis (система базы данных NoSQL). Дизайн, чтобы не мучаться, сделали на Twitter Bootstrap.

Приехали, начали думать над названием. Точно не помню, сколько часов мы над ним думали, но в результате не выдержали и пошли к главному эксперту смены [Алмазу Мубинову](http://mubinov.com). Он предложил название: Oh my Granny. "В таких случаях называют проекты так, чтобы просто привлечь внимание." На презентации проектов он скажет: "Я им сказал первое попавшееся. Не думал, то это дойдет до сегодняшнего дня".

[![](http://atnartur.ru/wp-content/uploads/2013/10/gzYZzbAccNA-210x300.jpg)](http://atnartur.ru/wp-content/uploads/2013/10/gzYZzbAccNA.jpg)

Затем пошла реализация. Я писал преимущественно клиентскую часть, а Костя с Данилом - серверную. Не помню уже, сколько раз мы обсуждали архитектуру...

Затем мы поехали в IT-парк. Там была [программа для старшеклассников и студентов](http://vpered.withgoogle.com/education/students) от Google (в рамках проекта "Вперед вместе с Google"). Там выступили сотрудники Google, а также прошли презентации мировых иновационных интернет-проектов. А затем презентации проектов IT-Jump, среди которых [Cafe4me](http://cafe4me.ru), [i Visual info](http://ivisual.info/), [KeepLinks](http://keeplinks.org) (руководителем которого является Костя) и другие.

[![](http://atnartur.ru/wp-content/uploads/2013/10/E6HsliRAhXc-300x199.jpg)](http://atnartur.ru/wp-content/uploads/2013/10/E6HsliRAhXc.jpg)

После этого уже началась настоящая работа. На моем ноутбуке была поставлена виртуальная машина с Debian 7 на борту. На неё поставили Nginx, Node.js, Redis, Git... Это был наш production-сервер (для показа) и мой - для тестирования, т. к. на Windows не возможно было все это развернуть нормально.

За неделю мы сделали 347 коммитов. А ветвление стало похожим на карту Московского метро.

[![](http://atnartur.ru/wp-content/uploads/2013/10/Image-000-150x123.png)](http://atnartur.ru/wp-content/uploads/2013/10/Image-000.png)[![](http://atnartur.ru/wp-content/uploads/2013/10/Image-004-150x150.png)](http://atnartur.ru/wp-content/uploads/2013/10/Image-004.png)

На моем ноутбуке была проблема: если я его закрывал и потом открывал, то он не мог подключиться к wifi нормально... В Байтике это вообще дошло до того, что на виртуальной машине интернет был, а на самом ноутбуке - нет. Пришлось переустанавливать драйверы. Обновление драйверов wifi через wifi (:D) не привело к исправлению проблемы, т. к. обновления сам Windows не нашел. С 5 (!) раза переустановки драйверов вроде бы стало все нормально. Как видим, рядом открыт ноут с сайтом поддержки Samsung.

[![](http://atnartur.ru/wp-content/uploads/2013/10/QcsD0oAvrWw-300x200.jpg)](http://atnartur.ru/wp-content/uploads/2013/10/QcsD0oAvrWw.jpg)

Плюс JavaScript на клиенте и сложность JavaScript на сервере - это события. На клиенте особых проблем нету, а вот на сервере получается 13 уровень вложенности... 

[![](http://atnartur.ru/wp-content/uploads/2013/10/Image-001-250x300.png)](http://atnartur.ru/wp-content/uploads/2013/10/Image-001.png)

Мой экран блокировки делал чудеса. Не было ни дня, чтобы меня не спросили про какой-нибудь из проектов. И это было приятно:) Даже сфоткал кто-то!
Как поставить свою картинку на экран блокировки, можно прочитать [здесь](http://atnartur.ru/kak-izmenity-fon-okna-privetstviya-v-windows-7/ "Как изменить фон окна приветствия в Windows 7").

[![](http://atnartur.ru/wp-content/uploads/2013/10/DSC_0223-300x200.jpg)](http://atnartur.ru/wp-content/uploads/2013/10/DSC_0223.jpg)

У Данила нетбук ICL. ICL поставляет компьютерную технику преимущественно для государственных учреждений. Но каким-то загадочным способом он попал к Данилу. На самом деле, ноутбуки данной компании очень тормозят. Один из ноутбуков, которых я чинил, вообще не мог сам выключаться. Он застывал на табличке "Завершение работы" и все... 

Но сейчас не об этом. Аппарат Данила вообще интересное явление: вроде бы ICL, вроде бы фигня, вроде бы тормозит, но с сенсорным и крутящимся экраном, который может превратить нетбук в планшет, с прикольной клавиатурой. Также есть ручка для переноски и стилус. И сенсор работает даже на линуксе. В общем, у меня осталось противоречивое впечатление.

[![_Al_i4Sla-c](http://atnartur.ru/wp-content/uploads/2013/10/Al_i4Sla-c-150x150.jpg)](http://atnartur.ru/wp-content/uploads/2013/10/Al_i4Sla-c.jpg)[![9pVrFcutHow](http://atnartur.ru/wp-content/uploads/2013/10/9pVrFcutHow-150x150.jpg)](http://atnartur.ru/wp-content/uploads/2013/10/9pVrFcutHow.jpg)[![fwTfpNj_A1g](http://atnartur.ru/wp-content/uploads/2013/10/fwTfpNj_A1g-150x150.jpg)](http://atnartur.ru/wp-content/uploads/2013/10/fwTfpNj_A1g.jpg)[![iW5Xt0Zohx8](http://atnartur.ru/wp-content/uploads/2013/10/iW5Xt0Zohx8-150x150.jpg)](http://atnartur.ru/wp-content/uploads/2013/10/iW5Xt0Zohx8.jpg)

А это мы:)

> Приезжала [#Байтик](https://twitter.com/search?q=%23%D0%91%D0%B0%D0%B9%D1%82%D0%B8%D0%BA&amp;src=hash), было весело)))) Спасибо вам, ребята))) [pic.twitter.com/yukIQwtnWO](http://t.co/yukIQwtnWO)
> &mdash; Записки сумасшедшего (@Woundless) [October 12, 2013](https://twitter.com/Woundless/statuses/388911518919962624)
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Еще несколько курьезов:

> А это было утром [#Байтик](https://twitter.com/search?q=%23%D0%91%D0%B0%D0%B9%D1%82%D0%B8%D0%BA&amp;src=hash) [pic.twitter.com/twyGBNAr6w](http://t.co/twyGBNAr6w)
> &mdash; atnartur (@atnartur) [October 11, 2013](https://twitter.com/atnartur/statuses/388667687015960576)

> Лекция по маркетингу&#10;Яша: Сейчас будет iPhone...&#10;Лектор: Ну давайте.... ну раз уж мы начали... Давайте это будет.... iPhone&#10;[#Байтик](https://twitter.com/search?q=%23%D0%91%D0%B0%D0%B9%D1%82%D0%B8%D0%BA&amp;src=hash)
> &mdash; atnartur (@atnartur) [October 10, 2013](https://twitter.com/atnartur/statuses/388297769703587840)

> :D [#Байтик](https://twitter.com/search?q=%23%D0%91%D0%B0%D0%B9%D1%82%D0%B8%D0%BA&amp;src=hash) [#vk](https://twitter.com/search?q=%23vk&amp;src=hash) [pic.twitter.com/oi2NvlBeRi](http://t.co/oi2NvlBeRi)
> &mdash; atnartur (@atnartur) [October 9, 2013](https://twitter.com/atnartur/statuses/387861369485148161)

> Какая-то ностальгия была по лекциям Алмаза [@Mubinov](https://twitter.com/mubinov)... Все-то же самое, но как-то приятно еще раз прослушать то же самое... [#Байтик](https://twitter.com/search?q=%23%D0%91%D0%B0%D0%B9%D1%82%D0%B8%D0%BA&amp;src=hash)
> &mdash; atnartur (@atnartur) [October 9, 2013](https://twitter.com/atnartur/statuses/387850903660687361)

<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Кстати, эта смена была первой, на которой были лекции не только по HTML, CSS, JavaScript, JQuery, но и по AJAX, PHP и MySQL. Уровень разработки веб-сайтов в IT-Jump понемногу растет.

Ну и в результате, первое место!:) Неделя мучения, веселья, старания, спешки и просто позитива позади! Спасибо всем!

> Фоточка с награждения:) [#Байтик](https://twitter.com/search?q=%23%D0%91%D0%B0%D0%B9%D1%82%D0%B8%D0%BA&amp;src=hash) [pic.twitter.com/GTnOdbiJKs](http://t.co/GTnOdbiJKs)
> &mdash; atnartur (@atnartur) [October 12, 2013](https://twitter.com/atnartur/statuses/389095080331472896)
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Ну а кто испытал все это на себе и был на этой смене - с вас лайки и репосты!:)

Также подписывайтесь на [официальную группу IT-Jump ВКонтакте](http://vk.com/itjump)!