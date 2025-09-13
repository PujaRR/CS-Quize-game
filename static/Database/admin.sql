drop table admin;

create table admin(adminID int primary key, adminname varchar(20) unique NOT NULL, password  varchar(20) NOT NULL);
insert into admin values(1, 'admin1', 'password1');
select * from admin;
