-- select t1.name , t2.name 
-- from table_1 t1   name t1 us alise as table_1
-- join table_2 t2 on t1.c1=t2.c2

create database if not exists testing;
use testing;

create table table_1(
	id int not null auto_increment primary key,
    user_name varchar(10) not null,
    user_age int not null
);

create table table_2(
  id int not null auto_increment primary key,
  match_id int not null,
  subject_name  varchar(10) not null,
  foreign key (match_id) references table_1(id) 
);

insert into table_1(user_name,user_age) 
values("jay",20),
("kripc",21),
("chintu",23),
("samay",35),
("maharshi",18);

insert into table_2(match_id,subject_name)
values (1,"maths"),
(1,"science"),
(1,"gujarati"),
(1,"maths"),
(2,"science"),
(2,"gujarati"),
(3,"maths"),
(3,"science"),
(3,"gujarati"),
(4,"maths"),
(4,"science"),
(4,"gujarati");

select * from table_2;


select t1.user_name,t2.subject_name,t1.user_age
from table_1  t1
join table_2  t2 on t1.id=t2.match_id;


select t1.user_name,t2.subject_name,t1.user_age
from table_1  t1
join table_2  t2 on t1.id=t2.match_id
order by t1.user_name;