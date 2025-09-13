drop table feedback;

create table feedback(FBID SERIAL primary key, feedback text NOT NULL, userID int References userID(users) on delete casacade);
Insert into feedback values(Default, 'please add more qustions')
select * from feedback;
