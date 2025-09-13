drop table users;

create table users(userID SERIAL primary key, username varchar(20) unique NOT NULL, password  varchar(20) NOT NULL, security_ans varchar(20) NOT NULL);
insert into users values(DEFAULT, 'user1', 'password1', 'answer');
select * from users;
