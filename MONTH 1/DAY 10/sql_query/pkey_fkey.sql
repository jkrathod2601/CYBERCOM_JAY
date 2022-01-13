create database if not exists sample;
use sample;

create table address(
	city_id int not null primary key auto_increment,
    city_name varchar(10) not null
);
create table user(
 c_id int not null auto_increment primary key,
 c_name varchar(30) not null,
 c_city int not null,
 foreign key (c_city) references address(city_id)
);

insert into address(city_name) 
values
("ahemdabad"),
("bhavnagar"),
("rajkot"),
("surat");

insert into user(c_name,c_city) 
values
("jay",1),
("raj",2),
("kripc",1),
("samay",3),
("chintan",4);

select  user.c_id,user.c_name,address.city_name
from user
inner join address on user.c_city=address.city_id; 


