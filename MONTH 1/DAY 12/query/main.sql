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
values (1,"maths");
