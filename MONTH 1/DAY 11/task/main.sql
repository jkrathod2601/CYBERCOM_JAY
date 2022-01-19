create database if not exists esite;
use esite;

CREATE TABLE IF NOT EXISTS user (
    id BIGINT NOT NULL AUTO_INCREMENT,
    firstName VARCHAR(50) DEFAULT NULL,
    middleName VARCHAR(50) DEFAULT NULL,
    lastname VARCHAR(50) DEFAULT NULL,
    mobile VARCHAR(15) NOT NULL,
    email VARCHAR(50) NOT NULL,
    passwordHash VARCHAR(32) NOT NULL,
    admin TINYINT NOT NULL DEFAULT 0,
    vendor TINYINT NOT NULL DEFAULT 1,
    registeredAt DATETIME NOT NULL,
    lastlogin DATETIME DEFAULT NULL,
    intro TINYTEXT DEFAULT NULL,
    profile TEXT DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (mobile , email)
);

select * from user;

CREATE TABLE IF NOT EXISTS tag (
    id BIGINT NOT NULL AUTO_INCREMENT,
    title VARCHAR(75) NOT NULL DEFAULT 'N/A',
    metaTitle VARCHAR(100) DEFAULT NULL,
    slug VARCHAR(100) NOT NULL DEFAULT 'N/A',
    content TEXT DEFAULT NULL,
    PRIMARY KEY (id)
);



CREATE TABLE IF NOT EXISTS product_tag (
    productId BIGINT NOT NULL AUTO_INCREMENT,
    tagId BIGINT NOT NULL,
    PRIMARY KEY (productId),
    FOREIGN KEY (tagId)
        REFERENCES tag (id),
    FOREIGN KEY (productId)
        REFERENCES product (id)
);

CREATE TABLE IF NOT EXISTS category (
    id BIGINT NOT NULL AUTO_INCREMENT,
    parentId BIGINT NULL DEFAULT NULL,
    title VARCHAR(75) NOT NULL,
    metaTitle VARCHAR(100) DEFAULT NULL,
    slug VARCHAR(100) NOT NULL,
    content TEXT DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (parentId)
        REFERENCES category (id)
);

select * from category;
select title from category
where id in (select parentId from category);
  
CREATE TABLE IF NOT EXISTS product_category (
    productId BIGINT NOT NULL AUTO_INCREMENT,
    categoryId BIGINT NOT NULL,
    PRIMARY KEY (productId),
    FOREIGN KEY (categoryId)
        REFERENCES category (id),
    FOREIGN KEY (productid)
        REFERENCES product (id)
);

select * from product_category;

CREATE TABLE IF NOT EXISTS product (
    id BIGINT NOT NULL AUTO_INCREMENT,
    title VARCHAR(75) NOT NULL,
    metaTitle VARCHAR(100) NULL,
    slug VARCHAR(100) NOT NULL,
    summary TINYTEXT,
    type SMALLINT NOT NULL DEFAULT 0,
    sku VARCHAR(100) NOT NULL,
    price FLOAT NOT NULL DEFAULT 0,
    discount FLOAT NOT NULL DEFAULT 0,
    quantity SMALLINT NOT NULL DEFAULT 0,
    shop TINYINT NOT NULL DEFAULT 0,
    createdAt DATETIME NOT NULL,
    updatedAt DATETIME DEFAULT NULL,
    publishedAt DATETIME DEFAULT NULL,
    startsAt DATETIME DEFAULT NULL,
    endsAt DATETIME DEFAULT NULL,
    content TEXT DEFAULT NULL,
    PRIMARY KEY (`id`)
);
select * from product;
select * from product
order by createdAt;

select title from product where timediff(updatedAt,"2022-01-19 13:00:00")<'0:02:00';

select title from product
where quantity between 5 and 30;

select * from product 
where price between 50 and 101;

CREATE TABLE IF NOT EXISTS product_meta (
    id BIGINT NOT NULL AUTO_INCREMENT,
    productId BIGINT NOT NULL,
    key_is VARCHAR(50) NOT NULL,
    content TEXT DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (productId)
        REFERENCES product (id)
);

CREATE TABLE IF NOT EXISTS product_review (
    id BIGINT NOT NULL AUTO_INCREMENT,
    productId BIGINT NOT NULL,
    parentId BIGINT DEFAULT NULL,
    title VARCHAR(100) NOT NULL,
    rating SMALLINT NOT NULL DEFAULT 0,
    published TINYINT NOT NULL DEFAULT 0,
    createdAt DATETIME NOT NULL,
    publishedAt DATETIME DEFAULT NULL,
    content TEXT NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (productId)
        REFERENCES product (id),
    FOREIGN KEY (parentId)
        REFERENCES product_review (id)
);

select * from product_review;

select t2.title,t1.productid,count(t1.productid)
from product_review t1
join product t2
on t1.productId=t2.id
group by(t1.productId)
having count(t1.productId)>2;

CREATE TABLE IF NOT EXISTS order_item (
    id BIGINT NOT NULL AUTO_INCREMENT,
    productId BIGINT NOT NULL,
    orderId BIGINT NOT NULL,
    sku VARCHAR(100) NOT NULL,
    price FLOAT NOT NULL DEFAULT 0,
    discount FLOAT NOT NULL DEFAULT 0,
    quantity SMALLINT NOT NULL DEFAULT 0,
    createdAt DATETIME NOT NULL,
    updatedAt DATETIME DEFAULT NULL,
    content TEXT NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (productId)
        REFERENCES product (id),
    FOREIGN KEY (orderId)
        REFERENCES order_final (id)
);

select * from order_item;

CREATE TABLE IF NOT EXISTS order_final (
    id BIGINT NOT NULL AUTO_INCREMENT,
    userId BIGINT NULL DEFAULT NULL,
    sessionId VARCHAR(100) NOT NULL,
    token VARCHAR(100) NOT NULL,
    status SMALLINT NOT NULL DEFAULT 0,
    subTotal FLOAT NOT NULL DEFAULT 0,
    itemDiscount FLOAT NOT NULL DEFAULT 0,
    tax FLOAT NOT NULL DEFAULT 0,
    shipping FLOAT NOT NULL DEFAULT 0,
    total FLOAT NOT NULL DEFAULT 0,
    promo VARCHAR(50) NULL DEFAULT NULL,
    discount FLOAT NOT NULL DEFAULT 0,
    grandTotal FLOAT NOT NULL DEFAULT 0,
    firstName VARCHAR(50) NULL DEFAULT NULL,
    middleName VARCHAR(50) NULL DEFAULT NULL,
    lastName VARCHAR(50) NULL DEFAULT NULL,
    mobile VARCHAR(15) NULL,
    email VARCHAR(50) NULL,
    line1 VARCHAR(50) NULL DEFAULT NULL,
    line2 VARCHAR(50) NULL DEFAULT NULL,
    city VARCHAR(50) NULL DEFAULT NULL,
    province VARCHAR(50) NULL DEFAULT NULL,
    country VARCHAR(50) NULL DEFAULT NULL,
    createdAt DATETIME NOT NULL,
    updatedAt DATETIME NULL DEFAULT NULL,
    content TEXT NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (userId)
        REFERENCES user (id)
);

select id from order_final where promo is not null;

select * from order_final;

select sum(subTotal) from order_final;

select sum(itemDiscount) as a1 from order_final;

select t1.firstname,count(t2.id)
from user t1
inner join order_final t2 on t1.id=t2.userId
group by(t1.firstname); 

CREATE TABLE IF NOT EXISTS cart (
    id BIGINT NOT NULL AUTO_INCREMENT,
    userId BIGINT NULL DEFAULT NULL,
    sessionId VARCHAR(100) NOT NULL,
    token VARCHAR(100) NOT NULL,
    status SMALLINT NOT NULL DEFAULT 0,
    firstName VARCHAR(50) NULL DEFAULT NULL,
    middleName VARCHAR(50) NULL DEFAULT NULL,
    lastName VARCHAR(50) NULL DEFAULT NULL,
    mobile VARCHAR(15) DEFAULT NULL,
    email VARCHAR(50) DEFAULT NULL,
    line1 VARCHAR(50) DEFAULT NULL,
    line2 VARCHAR(50) DEFAULT NULL,
    city VARCHAR(50) DEFAULT NULL,
    province VARCHAR(50) DEFAULT NULL,
    country VARCHAR(50) DEFAULT NULL,
    createdAt DATETIME NOT NULL,
    updatedAt DATETIME DEFAULT NULL,
    content TEXT NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (userId)
        REFERENCES user (id)
);

select * from cart;

CREATE TABLE IF NOT EXISTS cart_item (
    id BIGINT NOT NULL AUTO_INCREMENT,
    productId BIGINT NOT NULL,
    cartId BIGINT NOT NULL,
    sku VARCHAR(100) NOT NULL,
    price FLOAT NOT NULL DEFAULT 0,
    discount FLOAT NOT NULL DEFAULT 0,
    quantity SMALLINT NOT NULL DEFAULT 0,
    active TINYINT NOT NULL DEFAULT 0,
    createdAt DATETIME NOT NULL,
    updatedAt DATETIME DEFAULT NULL,
    content TEXT NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (productId)
        REFERENCES product (id),
    FOREIGN KEY (cartId)
        REFERENCES cart (id)
);

select * from cart_item;

CREATE TABLE IF NOT EXISTS transaction (
    id BIGINT NOT NULL AUTO_INCREMENT,
    userId BIGINT NOT NULL,
    orderId BIGINT NOT NULL,
    code VARCHAR(100) NOT NULL,
    type SMALLINT NOT NULL DEFAULT 0,
    mode SMALLINT NOT NULL DEFAULT 0,
    status SMALLINT NOT NULL DEFAULT 0,
    createdAt DATETIME NOT NULL,
    updatedAt DATETIME DEFAULT NULL,
    content TEXT NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (userId)
        REFERENCES user (id),
    FOREIGN KEY (orderId)
        REFERENCES order_final (id)
);