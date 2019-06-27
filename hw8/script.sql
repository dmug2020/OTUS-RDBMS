use blog;

-- ������� ������
insert into posts (post_title, post_content)
  values ('����� � ������', '������� ��� ������� ����� � ������');
insert into posts (post_title, post_content)
  values ('����� � ���� ', '������� ��� ������� ����� � ����');
insert into posts (post_title, post_content)
  values ('����� � ����� ', '������� ��� ������� ����� � �����');

-- ������� � �������������� select (�� ��������� ������� ��������� ���������� �� ������,����������,��������,������������ ��� ���������� �� ������ > 100)

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
	

-- ���������� ������
update posts set post_title='����� � ��������' where post_comments=1;

-- ��������� ������� POSTS,�������� ������ Post_likes ����������� ���� ������ = 1000 ��� ������� ������ = supernikname
update `posts` as p
  join users u on p.user_id = u.user_id 
  set p.post_likes=1000
  where u.display_name=(select display_name from users where display_name'supernikname');

 
  
-- ��������
delete from photos where created_at BETWEEN '2019-03-02|09:02:20' AND '2019-03-02|09:02:40'

-- ������� � ����������
insert into posts (post_title, post_contents)
  values ('��� ��������', '������� �����') on duplicate key update post_id=post_id+1;


-- ������� ������

delete from posts;
delete from photos;
delete from temp_statistic;
