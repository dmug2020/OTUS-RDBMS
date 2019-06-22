HW5

Стартап:
Блог : EPICROMANS.RU посвящен молодым литераторам которые пишут адово длинные романы
Аналог: proza.ru

Предполагаемая посещаемость:50000 хостов в сутки
Просмотры: 4 000 000 в сутки

Романы большие по 1 000 000 знаков
Итого:1 000 000 +4 байта =1 000 004 байтов= 0.95мб размер романа (LONGTEXT)
LONGTEXT=L+4 байт

В базе размещено около 9000 романов
0.95*9000=8550 мб = 8.35Гб


Выдержка:
В плане количества знаков, то в романе "Война и мир" Льва Толстого два миллиона девятьсот тысяч, почти три миллиона. Так что, сказать однозначно, сколько должно быть знаков - каждый автор решает сам. 


- рекомендации к использованию репликации

https://ruhighload.com/%D0%9A%D0%B0%D0%BA+%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B8%D1%82%D1%8C+mysql+master-slave+%D1%80%D0%B5%D0%BF%D0%BB%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8E%3F

Так как у меня блог то читаем со слейва а пишем и меняем через мастер
MASTER-MASTER репликацию считаю избыточной так как операции по изменению данных не являются привалирующеими


- рекомендации к резервному копированию

http://lagman.su/2010/01/mysql-zfs-backup/

Бэкапим MySQL на ZFS
Кстати, бэкапиться с ZFS на слейвах очень и очень просто:

view sourceprint?
1
#!/bin/sh
2
user='mysqlbackup';
3
pass='superpass';
4
/usr/local/bin/mysql -u $user -p$pass -e 'STOP SLAVE; FLUSH LOGS; FLUSH TABLES WITH READ LOCK; \
5
SYSTEM zfs destroy -r data/mysql@yesterday; \
6
SYSTEM zfs rename -r data/mysql@today @yesterday; \
7
SYSTEM zfs snapshot -r data/mysql@today; \
8
UNLOCK TABLES; START SLAVE;'


