use blog;

-- вставка данных
insert into posts (post_title, post_content)
  values ('роман о молоке', 'длинный при длинный текст о молоке');
insert into posts (post_title, post_content)
  values ('роман о пиве ', 'длинный при длинный текст о пиве');
insert into posts (post_title, post_content)
  values ('роман о водке ', 'длинный при длинный текст о водке');

-- вставка с использованием select (во временную таблицу вставл¤ем статистику по лайкам,прочтениям,репостам,комментари¤м
где статистика по лайкам > 100)

INSERT INTO
    `temp_statistic` (`post_likes`,`post_reads`,`post_repost`,`post_comments`)
SELECT
    `src`.`post_likes`,
    `src`.`post_reads`,
    `src`.`post_repost` ,
	`src`.`post_comments`
FROM
    `posts`  AS `src`
WHERE
    `src`.`post_likes`  > 100;
	

-- обновление данных
update posts set post_title='роман о лимонаде' where post_comments=1;

-- обновляем таблицу POSTS,значение записи Post_likes присваеваем всем постам = 1000 где никнейм автора = supernikname
update `posts` as p
  join users u on p.user_id = u.user_id 
  set p.post_likes=1000
  where u.display_name=(select display_name from users where display_name'supernikname');

 
  
-- удаление
delete from photos where created_at BETWEEN '2019-03-02|09:02:20' AND '2019-03-02|09:02:40'

-- вставка и обновление
insert into posts (post_title, post_contents)
  values ('это загловок', 'длинный текст') on duplicate key update post_id=post_id+1;


-- очистка данных

delete from posts;
delete from photos;
delete from temp_statistic;
