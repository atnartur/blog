---
title: Как изменить фон окна приветствия в Windows 7
tags:
  - windows
id: 295
categories:
  - Другое
date: 2013-06-27 17:00:00
alias: /kak-izmenity-fon-okna-privetstviya-v-windows-7/
---

Окно приветствия - окно, которое появляется перед тем, как включился Windows (окна "Добро пожаловать" и "Завершение работы" и окно блокировки).<!--more-->

К примеру, на Windows 7 Максимальная это окно выглядит вот так: 

[![](/content/2013/06/20-300x207.jpg)](/content/2013/06/20.jpg)

Если вам эта картинка уже надоела, то вы можете её поменять следующим образом.

Первым делом идем в **реестр** (чтобы запустить его, зайдите в Пуск, потом Выполнить и наберите "regedit").

В реестре находим путь 
[![путь в реестре](/content/2013/06/Image-002-300x24.png)](/content/2013/06/Image-002.png) 
и изеняем значение параметра "OEMBackground" на 1.

[![Изменяем значение реестра](/content/2013/06/Image-004-300x161.png)](/content/2013/06/Image-004.png)

Если в реестре нет такого параметра, создаем.

**ВНИМАНИЕ! Любые неосторожные действия в системном реестре могут привести к отказе в работе Windows!**

Затем идем в папку "%windir%\system32\oobe\info\backgrounds" (просто вставьте это значение без кавычек в адресную строку проводника)

[![Адресная строка проводника](/content/2013/06/Image-005-300x59.png)](/content/2013/06/Image-005.png)

Там будет лежать несколько картинок. Создаем для них специальную папку и перемещаем их туда. Затем ищем любимую картинку (желательно, чтобы она имела такое же разрешение, как и монитор) и копируем в эту папку.

**Размер картинки должен быть не более 256 КБ!**

Затем изменяем название картинки на "backgroundDefault.jpg" и ВСЕ! 

[![Папка](/content/2013/06/Image-006-300x173.png)](/content/2013/06/Image-006.png)

Проверить, установилась ли картинка, можно нажатием на Windows+L.

Теперь мой экран блокировки выглядит так:)

[![Мой экран блокировки](/content/2013/06/xwjh1ii7QYA-300x195.jpg)](/content/2013/06/xwjh1ii7QYA.jpg)
(ну не работает там Print Screen!)

Если вам что-то тут не понятно, пишите в комментарии! Все получилось и вы поменяли фоновую картинку - делись с друзьями!