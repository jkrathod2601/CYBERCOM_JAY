-- insert query

insert into product(product_name, product_about,product_price,product_category_id)
values ("fan","this is most beautiful fan in the world",2000.20,1),
("redmi note 5 pro","8 gb ram 512 gb storage",15000.00,5),
("dell latitude e7440","8 gb ram 512 gb ssd",100000.00,6);

-- for copy data of one table to onether table

create database if not exists demo;
use demo;

create table t1(
 id int not null,
 t1_name varchar(5) not null
);

insert into t1(id,t1_name) 
values(1,"jay"),
(2,"kripc"),
(3,"chint"),
(4,"mahi");

create table t2(
 id int not null ,
 t2_name varchar(5) not null
);

insert into t2(id,t2_name)
select id,t1_name 
from t1;

select * from t2;
