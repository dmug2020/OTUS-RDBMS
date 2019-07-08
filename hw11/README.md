hw11
Схема AERO в докер-образе:

scriptaero.sql

Dockerfile: https://github.com/ugaidmitry/RDBMS/blob/master/hw11/Dockerfile

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


1.Скрипт наполнения базы https://github.com/ugaidmitry/RDBMS/blob/master/hw11/scriptaero.sql
2.Скрипт выборки https://github.com/ugaidmitry/RDBMS/blob/master/hw11/select.sql и скриншот https://github.com/ugaidmitry/RDBMS/blob/master/hw11/select.PNG

Также столкнулся с проблемой this is incompatible with sql_mode=only_full_group_by
Решаеться: https://ixnfo.com/reshenie-mysql-error-1055-42000.html
