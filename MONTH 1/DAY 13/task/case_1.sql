create database if not exists testting_day13;
use testting_day13;

create table Person(
 id int auto_increment not null primary key,
 email varchar(20) not null
);

insert into person(email)
values ("a@b.com"),
("c&d.com"),
("A@B.com"),
("c&d.com"),
("d&c.com");

select * from person;

select email
from person
group by lower(email)
having count(email)>1;