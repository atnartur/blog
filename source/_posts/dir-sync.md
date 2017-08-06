---
title: Программы для синхронизации директорий без подключения к интернету
date: 2016-05-10 21:53:10
tags:
- GIT
- windows
- sync
- Яндекс Диск
category:
- Софт
---

Хотя сейчас присутствуют множество сервисов для хранения и синхронизации файлов в облаке (например, [Яндекс.Диск](http://atnartur.ru/r/ydisk) или [Dropbox](http://atnartur.ru/r/drop)), случаются ситуации, когда данные решения для синхронизации не подходят. <!--more-->

Не буду рассказывать о моей ситуации, потому что это не так уж и интересно, на самом деле. Просто представим, что в каком-то конкретном месте нет нормального подключения к интернету для работы облачных служб. В таком случае приходит необходимость использовать синхронизацию файлов через флешку.

## GIT

GIT может быть неплохим решением для синхронизации файлов и папок небольшого размера. Дома при наличии интернета закомитили на компе, скачали на флешке, и все ОК. Однако, нет возможности производить синхронизацию в месте назначения, где подключение к интернету (согласно нашей ситуации) отсутствует.

## Meld

[Meld](http://meldmerge.org/) - программа для сравнения файлов и папок. Подробно показывает различия версий между разными сущностями и дает возможность синхронизировать данные в полуручном режиме.

![](/content/2016/05/dir-sync/meld.png)

На скриншоте видно, что в левой папке отсутсвует директория из правой. Кликаем по папке в правой области, нажимаем на "Copy left", и точно такая же директория появляется в левой области. Все просто. 

Программа устанавливается и работает без подключения к интернету, поэтому она является идеальным решением для данной проблемы.

## Мой случай

Ну теперь, когда вся основная информация сказана, расскажу про мой случай. Как многие уже догадались, речь идет о школе, где стабильное подключение к интернету отсутсвует. Поэтому я, закончив работу с файлами дома, синхронизирую данные с флешкой, а затем через флешку синхронизирую файлы с компьютером в школе. В папке текущего мероприятия может быть больше 2 гигабайт файлов, поэтому GIT такое не выдержит, а облака будут синхронизироваться очень долго.