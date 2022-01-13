-- use database sales
use sales;

-- first of all create a table that's primary key is an foreign key of other table
create table Companies(
company_id int not null auto_increment,
company_name varchar(30) not null,
headquater_phone_number int(10) not null,
primary key(company_id)
);

-- creating a table Items
create table Items(
item_code int not null auto_increment,
item varchar(30) not null ,
unit_price int,
company_id int,
primary key (item_code),
foreign key (company_id) references Companies(company_id) on delete cascade
);

-- creating a table customers
create table Customers(
	customer_id int not null auto_increment,
    first_name varchar(30) not null,
    last_name varchar(30) not null,
    email_address varchar(30) not null,
    number_of_complaints int,
    primary key(customer_id),
    unique key(email_address)
);

-- creating a table sales
create table Sales(
purchase_of_number INT NOT NULL AUTO_INCREMENT,
date_of_purchase date NOT null,
customer_id int,
item_code int,
primary key(purchase_of_number),
foreign key(customer_id) references Customers(customer_id) on delete cascade,
foreign key(item_code) references Items(item_code) on delete cascade
);




