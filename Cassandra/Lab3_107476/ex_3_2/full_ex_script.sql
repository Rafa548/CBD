Use Video_share;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS videos;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS v_followers;
DROP TABLE IF EXISTS events_log;
DROP TABLE IF EXISTS ratings;

CREATE TABLE users(
    id int,
    uname text,
    name text,
    email text,
    timestamp timestamp,
    primary key (uname,id)
);

INSERT into users (ID,UNAME, NAME, EMAIL, TIMESTAMP) values (1,'jj1','joao1','r@gamil.com',toTimeStamp(now()));
INSERT into users (ID,UNAME, NAME, EMAIL, TIMESTAMP) values (2,'jj2','joao2','n@gmail.com', toTimeStamp(now()));
INSERT into users (ID,UNAME, NAME, EMAIL, TIMESTAMP) values (3,'jj3','joao3','c@gmail.com', toTimeStamp(now()));
INSERT into users (ID,UNAME, NAME, EMAIL, TIMESTAMP) values (4,'jj4','joao4','l@gmail.com', toTimeStamp(now()));
INSERT into users (ID,UNAME, NAME, EMAIL, TIMESTAMP) values (5,'jj5','joao5','p@gmail.com', toTimeStamp(now()));
INSERT into users (ID,UNAME, NAME, EMAIL, TIMESTAMP) values (6,'jj6','joao6','o@gmail.com', toTimeStamp(now()));
INSERT into users (ID,UNAME, NAME, EMAIL, TIMESTAMP) values (7,'jj7','joao7','i@gmail.com', toTimeStamp(now()));
INSERT into users (ID,UNAME, NAME, EMAIL, TIMESTAMP) values (8,'jj8','joao8','u@gmail.com', toTimeStamp(now()));
INSERT into users (ID,UNAME, NAME, EMAIL, TIMESTAMP) values (9,'jj9','joao9','r@gmail.com', toTimeStamp(now()));
INSERT into users (ID,UNAME, NAME, EMAIL, TIMESTAMP) values (10,'jj10','joao10','pt@gmail.com', toTimeStamp(now()));

SELECT * FROM users;
SELECT json * FROM users;

CREATE TABLE videos(
    id int ,
    auth_id int,
    v_name text,
    description text,
    tag LIST<text>,
    add_date date,
    primary key (auth_id,add_date,id)
);

CREATE INDEX ON videos (id);
CREATE INDEX ON videos (tag);

INSERT into videos (ID,AUTH_ID, V_NAME, DESCRIPTION, TAG, add_date) values (1,1,'video1','video1',['tag1'],'2023-05-01');
INSERT into videos (ID,AUTH_ID, V_NAME, DESCRIPTION, TAG, add_date) values (1,2,'video2','video2',['tag2'],'2023-01-01');
INSERT into videos (ID,AUTH_ID, V_NAME, DESCRIPTION, TAG, add_date) values (1,3,'video3','video3',['tag3'],'2023-02-01');
INSERT into videos (ID,AUTH_ID, V_NAME, DESCRIPTION, TAG, add_date) values (4,2,'video4','video4',['tag4'],'2023-01-01');
INSERT into videos (ID,AUTH_ID, V_NAME, DESCRIPTION, TAG, add_date) values (5,1,'video5','video5',['tag5'],'2023-01-01');
INSERT into videos (ID,AUTH_ID, V_NAME, DESCRIPTION, TAG, add_date) values (6,2,'video6','video6',['tag6'],'2023-01-01');
INSERT into videos (ID,AUTH_ID, V_NAME, DESCRIPTION, TAG, add_date) values (7,1,'video7','video7',['tag7'],'2023-01-01');
INSERT into videos (ID,AUTH_ID, V_NAME, DESCRIPTION, TAG, add_date) values (8,2,'video8','video8',['tag1'],'2023-01-01');
INSERT into videos (ID,AUTH_ID, V_NAME, DESCRIPTION, TAG, add_date) values (9,1,'video9','video9',['tag9'],'2023-01-01');
INSERT into videos (ID,AUTH_ID, V_NAME, DESCRIPTION, TAG, add_date) values (10,2,'video10','video10',['tag10'],'2015-01-01');

--7
SELECT * FROM videos WHERE auth_id = 1;

CREATE TABLE comments(
    id int ,
    auth_id int,
    v_name text,
    comment text,
    timestamp timestamp,
    primary key (auth_id,timestamp,id))
    WITH CLUSTERING ORDER BY (timestamp DESC);

CREATE INDEX ON comments (v_name);

INSERT into comments (ID,AUTH_ID, V_NAME, COMMENT, TIMESTAMP) values (1,1,'video1','comment1',toTimeStamp(now()));
INSERT into comments (ID,AUTH_ID, V_NAME, COMMENT, TIMESTAMP) values (2,2,'video1','comment2',toTimeStamp(now()));
INSERT into comments (ID,AUTH_ID, V_NAME, COMMENT, TIMESTAMP) values (3,1,'video2','comment3',toTimeStamp(now()));
INSERT into comments (ID,AUTH_ID, V_NAME, COMMENT, TIMESTAMP) values (4,6,'video7','comment4',toTimeStamp(now()));
INSERT into comments (ID,AUTH_ID, V_NAME, COMMENT, TIMESTAMP) values (5,3,'video3','comment5',toTimeStamp(now()));
INSERT into comments (ID,AUTH_ID, V_NAME, COMMENT, TIMESTAMP) values (6,3,'video3','comment6',toTimeStamp(now()));
INSERT into comments (ID,AUTH_ID, V_NAME, COMMENT, TIMESTAMP) values (7,7,'video1','comment7',toTimeStamp(now()));
INSERT into comments (ID,AUTH_ID, V_NAME, COMMENT, TIMESTAMP) values (8,1,'video1','comment8',toTimeStamp(now()));
INSERT into comments (ID,AUTH_ID, V_NAME, COMMENT, TIMESTAMP) values (9,4,'video5','comment9',toTimeStamp(now()));
INSERT into comments (ID,AUTH_ID, V_NAME, COMMENT, TIMESTAMP) values (10,7,'video1','comment10',toTimeStamp(now()));

--8
SELECT * FROM comments WHERE auth_id = 1;
--9
SELECT * FROM comments WHERE auth_id = 1 and v_name = 'video1';

CREATE TABLE v_followers(
    id int primary key,
    auth_id int,
    v_id int,
    timestamp timestamp
);

CREATE INDEX ON v_followers (v_id);

INSERT into v_followers (ID,AUTH_ID, V_ID, TIMESTAMP) values (1,1,1,toTimeStamp(now()));
INSERT into v_followers (ID,AUTH_ID, V_ID, TIMESTAMP) values (2,1,2,toTimeStamp(now()));
INSERT into v_followers (ID,AUTH_ID, V_ID, TIMESTAMP) values (3,1,3,toTimeStamp(now()));
INSERT into v_followers (ID,AUTH_ID, V_ID, TIMESTAMP) values (4,1,4,toTimeStamp(now()));
INSERT into v_followers (ID,AUTH_ID, V_ID, TIMESTAMP) values (5,1,5,toTimeStamp(now()));
INSERT into v_followers (ID,AUTH_ID, V_ID, TIMESTAMP) values (6,1,6,toTimeStamp(now()));
INSERT into v_followers (ID,AUTH_ID, V_ID, TIMESTAMP) values (7,1,7,toTimeStamp(now()));
INSERT into v_followers (ID,AUTH_ID, V_ID, TIMESTAMP) values (8,1,8,toTimeStamp(now()));
INSERT into v_followers (ID,AUTH_ID, V_ID, TIMESTAMP) values (9,1,9,toTimeStamp(now()));
INSERT into v_followers (ID,AUTH_ID, V_ID, TIMESTAMP) values (10,1,10,toTimeStamp(now()));

CREATE TABLE events_log(
    id int,
    auth_id int,
    v_id int,
    event text,
    timestamp timestamp,
    primary key (auth_id,v_id)
);


INSERT into events_log (ID,AUTH_ID, V_ID, EVENT, TIMESTAMP) values (1,1,1,'event1',toTimeStamp(now()));
INSERT into events_log (ID,AUTH_ID, V_ID, EVENT, TIMESTAMP) values (2,1,2,'event2',toTimeStamp(now()));
INSERT into events_log (ID,AUTH_ID, V_ID, EVENT, TIMESTAMP) values (3,1,3,'event3',toTimeStamp(now()));
INSERT into events_log (ID,AUTH_ID, V_ID, EVENT, TIMESTAMP) values (4,1,4,'event4',toTimeStamp(now()));
INSERT into events_log (ID,AUTH_ID, V_ID, EVENT, TIMESTAMP) values (5,1,5,'event5',toTimeStamp(now()));
INSERT into events_log (ID,AUTH_ID, V_ID, EVENT, TIMESTAMP) values (6,1,6,'event6',toTimeStamp(now()));
INSERT into events_log (ID,AUTH_ID, V_ID, EVENT, TIMESTAMP) values (7,1,7,'event7',toTimeStamp(now()));
INSERT into events_log (ID,AUTH_ID, V_ID, EVENT, TIMESTAMP) values (8,1,8,'event8',toTimeStamp(now()));
INSERT into events_log (ID,AUTH_ID, V_ID, EVENT, TIMESTAMP) values (9,1,9,'event9',toTimeStamp(now()));
INSERT into events_log (ID,AUTH_ID, V_ID, EVENT, TIMESTAMP) values (10,1,10,'event10',toTimeStamp(now()));

CREATE TABLE ratings(
    id int ,
    v_id int,
    rating int,
    timestamp timestamp,
    primary key (id,rating)
) WITH CLUSTERING ORDER BY (rating DESC);

CREATE INDEX ON ratings (v_id);

INSERT into ratings (ID,V_ID, RATING, TIMESTAMP) values (1,1,5,toTimeStamp(now()));
INSERT into ratings (ID,V_ID, RATING, TIMESTAMP) values (2,1,4,toTimeStamp(now()));
INSERT into ratings (ID,V_ID, RATING, TIMESTAMP) values (3,2,3,toTimeStamp(now()));
INSERT into ratings (ID,V_ID, RATING, TIMESTAMP) values (4,1,2,toTimeStamp(now()));
INSERT into ratings (ID,V_ID, RATING, TIMESTAMP) values (5,3,1,toTimeStamp(now()));
INSERT into ratings (ID,V_ID, RATING, TIMESTAMP) values (6,3,5,toTimeStamp(now()));
INSERT into ratings (ID,V_ID, RATING, TIMESTAMP) values (7,4,4,toTimeStamp(now()));
INSERT into ratings (ID,V_ID, RATING, TIMESTAMP) values (8,1,3,toTimeStamp(now()));
INSERT into ratings (ID,V_ID, RATING, TIMESTAMP) values (9,5,2,toTimeStamp(now()));
INSERT into ratings (ID,V_ID, RATING, TIMESTAMP) values (10,5,1,toTimeStamp(now()));

--10
SELECT AVG(rating) AS rating_medio,COUNT(*) as n_ratings FROM ratings WHERE v_id = 1;


--exercicios anteriores feitos acima

--d)

--1
SELECT * FROM comments WHERE v_name = 'video1' LIMIT 3;

--2
SELECT tag FROM videos WHERE auth_id = 1 and id = 1;

--3
--inves de aveiro
SELECT * FROM videos WHERE auth_id = 1 and tag CONTAINS 'tag1';

--4
SELECT * FROM events_log WHERE auth_id = 1 and v_id = 1 LIMIT 5;


--5
SELECT * From videos WHERE auth_id = 1; --normal
SELECT * FROM videos WHERE auth_id = 1 and add_date > '2023-04-30' and add_date < '2023-05-31';

--6
--nao da porque para fazer o order by é necessario apontar para um node especifico neste caso a ordem nao iria entrar em efeito

--7
SELECT * FROM v_followers WHERE v_id = 1;

--8
--nao é possivel relaçao muito complexa

--9
--nao é possivel porque nao é fornecido o id do video (mesma razao que a 6)
--SELECT * FROM ratings WHERE v_id = 1 LIMIT 5;

--10
--igual ao 6 e 9 ordem nao entra em efeito porque nao é possivel apontar para um node especifico

--11
--igual ao 8



