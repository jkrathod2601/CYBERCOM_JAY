create database if not exists Onlineshopping ;
use Onlineshopping;

create table if not exists Customer(
 user_id int not null auto_increment primary key,
 username varchar(30) not null unique,
 user_password varchar(20) not null,
 user_email varchar(30) not null unique,
 user_first_name varchar(20) not null,
 user_last_name varchar(20) not null
);

create table if not exists category(
category_id int not null auto_increment primary key,
category_name varchar(20) not null
);

CREATE TABLE if not exists product (
    product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    product_about VARCHAR(200) NOT NULL,
    product_price DECIMAL(10 , 2 ) NOT NULL,
    product_category_id INT NOT NULL,
    FOREIGN KEY (product_category_id)
        REFERENCES category (category_id)
);

create table if not exists address (
 address_id int not null auto_increment,
 customer_id int not null,
 address_1 varchar(100) default null,
 address_2 varchar(100) default null,
 city_name varchar(20) default null,
 pin_code int(6) default null,
 primary key (address_id),
 foreign key (customer_id) references Customer(user_id)
);


create table if not exists user_order(
order_id int not null primary key auto_increment,
customer_id int not null,
product_id int not null,
user_date date default "2022-02-12",
order_delivery int not null,
foreign key (customer_id) references Customer(user_id),
foreign key (product_id) references product(product_id),
foreign key (order_delivery) references address(address_id)
);


insert into Customer(username,user_email,user_first_name,user_last_name,user_password)
values ("rj2601","jkrathod2601@gamail.com","jay","rathod","sdmagbdjassg"),
("kripc","kripc@gamil.com","kripc","sarvaiya","sdmagbdjassg");

insert into address (customer_id,address_1,city_name,pin_code)
values (1,"near patel factory, navapara, nari","bhavnagar",364004),
(2,"chitra","bhavnagar",364001);

insert into category (category_name)
values ("electronic"),
("cloth"),
("kitchen_items"),
("home_applience"),
("mobile"),
("laptop"),
("fresh_food");

insert into product(product_name, product_about,product_price,product_category_id)
values ("fan","this is most beautiful fan in the world",2000.20,1),
("redmi note 5 pro","8 gb ram 512 gb storage",15000.00,5),
("dell latitude e7440","8 gb ram 512 gb ssd",100000.00,6);

insert into user_order(customer_id,product_id,order_delivery)
values (1,1,1),
(2,3,2);

select * from user_order;

