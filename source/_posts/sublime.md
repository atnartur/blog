---
title: Мой Sublime Text
date: 2016-07-18 12:45:31
tags:
- IDE
- Sublime Text
- sync
category:
- Софт
---

Среда разработки - программа, в которой программист проводит больше всего времени. Именно поэтому ее выбор очень важен для каждого, кому приходится работать с кодом. Сегодня я расскажу о Sublime Text и о плагинах, которыми я пользуюсь.

<!-- more -->

![](/content/2016/07/sublime/logo.png)  

## Путь

За время работы я перепробовал множество IDE и текстовых редакторов. Началось все с [Notepad++](https://notepad-plus-plus.org/). Когда его возможностей стало не хватать, перешел на [Adobe Dreamviewer](http://www.adobe.com/ru/products/dreamweaver.html), который показался слишком тяжелым. [phpDesigner](http://www.mpsoftware.dk/phpdesigner.php) был очень хорош, но там не было сворачивания кода (а на больших файлах оно бывает очень необходимо). Sublime Text 2 не понравился. Философия кучи плагинов тогда меня не впечатлила потому, что не верилось, что все эти дополнения могут покрыть мои потребности. [Komodo Edit](http://komodoide.com/komodo-edit/) я использовал очень долго, пока не перешел на [PHPStorm](https://www.jetbrains.com/phpstorm/), который стабильно кушал большую часть оперативной памяти, а многие функции я просто не использовал. 

## Sublime Text 3

Для того, чтобы разобраться [Sublime Text 3](https://www.sublimetext.com/3) пришлось потратить немного времени. Как оказалось, сейчас есть множество плагинов, которые покрывают большинство потребностей современной разработки.

## Основные функции

Но сначала немного расскажу об основных функциях. Дальше по тексту я буду упоминать некоторые функции, которых нет в обычном Sublime Text, но которые есть у меня, потому что установлены некоторые плагины. О дополнениях рассках пойдет ниже.

**Проект = папка**. Так как это в первую очередь текстовый редактор, а не IDE, этот принцип вполне уместен и удобен. Сделал новое окно, перетащил папку - и все. Файлы проекта проиндексированы, автодополнение работает...

**Command Palette** вызывается по `CTRL+SHIFT+P` и представляет собой каталог со всеми командами в Sublime. Например, здесь можно сделать `git push` или выполнить gulp-задачу.

![](/content/2016/07/sublime/commandpalette.png)  

![](/content/2016/07/sublime/commandpalette2.png)

**Быстрый запуск** чем сложнее редактор/IDE, тем дольше он запускается. Sublime запускается быстро даже с кучей установленных плагинов.

[**Package Control**](http://packagecontrol.io) каталог пакетов (плагинов, тем...). Ставится отдельно [с помощью команды](https://packagecontrol.io/installation). Так же может помочь [сделать синхронизацию](https://packagecontrol.io/docs/syncing) не только настроек редактора, но и настроек всех плагинов. 

## Плагины

Полный список плагинов можно увидеть в моем [конфигурационном файле Package Control](https://gist.github.com/atnartur/911aef2a774115eb339d6a32c664d7c9).

Чтобы устанавливать большинство плагинов в Sublime Text, нужно:
1. [Поставить Package Control](https://packagecontrol.io/installation)
2. Нажать `CTRL+SHIFT+P`
3. Набрать `install package`, нажать enter
4. Набрать название плагина и установить

### Расширение функциональности

- [DocBlockr](https://packagecontrol.io/packages/DocBlockr) - генерация документации для функций. Над объявлением функции пишем `/**`, нажимаем enter, и плагин разворачивает блок документации:
![](/content/2016/07/sublime/docblockr.png)
- [Emmet](https://packagecontrol.io/packages/Emmet) - разворачивает аббревиатуры вида `div#id_test.class_test*2>h1` в 

```html
<div id="id_test" class="class_test">
    <h1></h1>
</div>
<div id="id_test" class="class_test">
    <h1></h1>
</div>
```

- [FileHeader](https://packagecontrol.io/packages/FileHeader) - в начало файла добавляет информацию об авторе, дате создания и изменения файла
- [Git](https://packagecontrol.io/packages/Git) - добавляет в Command palette команды git
- [GitGutter](https://packagecontrol.io/packages/GitGutter) - в начале строки добавляет символы, информирующие об удалении, добавлении или изменении строки. Информацию предоставляет git
![](/content/2016/07/sublime/gitgutter.png)
- [Gulp](https://packagecontrol.io/packages/Gulp) - запускает gulp-задачи прямо в Sublime Text
- [HTMLBeautify](https://packagecontrol.io/packages/HTMLBeautify) - форматирует (расставляет отступы) в HTML коде
- [Indent XML](https://packagecontrol.io/packages/Indent%20XML) - то же самое для XML
- [Javascript Beautify](https://packagecontrol.io/packages/Javascript%20Beautify) - и JS
- [Pretty JSON](https://packagecontrol.io/packages/Pretty%20JSON) - то же самое для JSON, но еще и минификация и валидация
- [JSHint](https://packagecontrol.io/packages/JSHint) - проверка синтаксиса JS
- [LiveReload](https://packagecontrol.io/packages/LiveReload) - обычно использую LiveReload через gulp, но иногда бывает нужно перезагружать страницу просто по сохранению файла. Так же он умеет вставлять тег `<script>` с подключением скрипта LiveReload и обновлять страницу по разным триггерам:
![](/content/2016/07/sublime/livereload.png)
- [SFTP](https://packagecontrol.io/packages/SFTP) - помогает редактировать файлы на удаленных серверах

### Автодополнение

- [All Autocomplete](https://packagecontrol.io/packages/All%20Autocomplete) - Сканирует файлы в проекте и на основе собранной информации реализует подсказки по коду.
- [JavaScript Completions](https://packagecontrol.io/packages/JavaScript%20Completions)
- [jQuery](https://packagecontrol.io/packages/jQuery)
- [apiDoc Autocompletion](https://packagecontrol.io/packages/apiDoc%20Autocompletion) - автодополнения для [apidoc](http://apidocjs.com/), инструмента для генерации документации по API
- [PHP Companion](https://packagecontrol.io/packages/PHP%20Companion)
- [TodoReview](https://packagecontrol.io/packages/TodoReview) - собирает информацию обо всех блоках `@TODO`
- [WakaTime](https://packagecontrol.io/packages/WakaTime) - "фитнес-трекер" для программиста. Подробнее

### Поддержка синтаксиса 

- [Babel](https://packagecontrol.io/packages/Babel) (JavaScript ES6, React JSX)-
- [Handlebars](https://packagecontrol.io/packages/Handlebars)
- [LESS](https://packagecontrol.io/packages/LESS)
- [Python 3](https://packagecontrol.io/packages/Python%203)
- [MarkdownEditing](https://packagecontrol.io/packages/MarkdownEditing) - очень удобный плагин для редактирования markdown-файлов с оригинальным дизайном:
![](/content/2016/07/sublime/md.png)

### Темы

- [Material Theme](https://packagecontrol.io/packages/Material%20Theme) - использую цветовую схему Material Theme Dark из этой темы
- [Numix Theme](https://packagecontrol.io/packages/Numix%20Theme) - использую тему Numix Theme Dark
- [Materialize](https://packagecontrol.io/packages/Materialize)
- [Predawn](https://packagecontrol.io/packages/Predawn)
- [Theme - Asphalt](https://packagecontrol.io/packages/Theme%20-%20Asphalt)
- [Theme - Brogrammer](https://packagecontrol.io/packages/Theme%20-%20Brogrammer)
- [Theme - Flatland](https://packagecontrol.io/packages/Theme%20-%20Flatland)
- [Theme - Glacier](https://packagecontrol.io/packages/Theme%20-%20Glacier)
- [Theme - Piatto](https://packagecontrol.io/packages/Theme%20-%20Piatto)
- [Theme - Soda](https://packagecontrol.io/packages/Theme%20-%20Soda)
- [Theme - Spacegray](https://packagecontrol.io/packages/Theme%20-%20Spacegray)

