HW9

Схема BLOG в докер-образе:

script.sql

Dockerfile

Установите докер на свою систему и запустите:

docker image build -t <image_name> .

docker run -p <your_free_port>:3306 --name <container_name> -d <image_name>

CONNECTION

auth data user: root

password: otus

ip: 0.0.0.0

port: 3306

Измените порт

command line: mysql -uroot -p -h 0.0.0.0 -P <your_free_port>


Сделано:

* для учебной базы сделать скрипт для партиционирования таблицы CDR по месяцам (на выходе SQL  скрипт на модерацию + дамп измененной структуры)
https://github.com/ugaidmitry/RDBMS/blob/master/hw9/partitioning.PNG
https://github.com/ugaidmitry/RDBMS/blob/master/hw9/partitioning_1.PNG
https://github.com/ugaidmitry/RDBMS/blob/master/hw9/part.sql
