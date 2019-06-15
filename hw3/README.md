HW 3
Описываем логику транзакций для своей модели данных

В вашем проекте базы данных опишите
транзакцию, которая будет включать в себя несколько действий
и исключать возможность взаимных блокировок и неоднозначных ситуаций

Описание должно включать в себя
- бизнес задачу
- вероятные проблемы
- SQL транзакции или возможно нескольких транзакций

Задача:
Редактирование поста
фазы:
- выбор поста
- изменение заголовка поста и тела поста

Особенности
- исключить возможность того что несколько пользователей редактируют заголовок поста и текст поста одновременно

SQL 

start transaction;

select post_title from posts where post_title='some title' limit 1 for update;

UPDATE posts SET post_title = 'new title',post_content='some new text';

commit;


Также стоит заметить, что использование FOR UPDATE лучше делать с выключенным autocommit-ом, так как вне зависимости от того, что вы залочили, после первого апдейта лок снимется.

mysql> SET autocommit=0;


На основании комментария преподователя написал транзакцию:

Добавляем комментарий + обновляем кол-во комментариев (post_comments) в таблице post_statistic
SQL 

start transaction;

INSERT into comment (comment_author, comment_content, created_at) VALUES(@AUTHOR, @COMMENT, NOW());

UPDATE post_statistic set post_comments=post_comments+1;

commit;












 
 
