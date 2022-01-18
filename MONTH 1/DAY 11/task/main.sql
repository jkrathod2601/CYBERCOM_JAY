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
    admin TINYINT NOT NULL default 0,
    vendor TINYINT NOT NULL default 1,
    registeredAt DATETIME NOT NULL,
    lastlogin DATETIME DEFAULT NULL,
    intro TINYTEXT DEFAULT NULL,
    profile TEXT DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (mobile , email)
);

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
        REFERENCES tag (id)
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
  
  CREATE TABLE IF NOT EXISTS product_category (
    productId BIGINT NOT NULL AUTO_INCREMENT,
    categoryId BIGINT NOT NULL,
    PRIMARY KEY (productId),
    FOREIGN KEY (categoryId)
        REFERENCES category (id)
);

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
    updatedAt DATETIME  DEFAULT NULL,
    publishedAt DATETIME  DEFAULT NULL,
    startsAt DATETIME  DEFAULT NULL,
    endsAt DATETIME  DEFAULT NULL,
    content TEXT  DEFAULT NULL,
    PRIMARY KEY (`id`)
);

create table if not exists product_meta(
	id BIGINT NOT NULL AUTO_INCREMENT,
	productId BIGINT NOT NULL,
	key_is VARCHAR(50) NOT NULL,
	content TEXT  DEFAULT NULL,
	PRIMARY KEY (`id`),
    foreign key(productId) references product(id)
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
        REFERENCES product (id)
);

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
        REFERENCES product (id)
);

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

create table if not exists cart(
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
	line1 VARCHAR(50)  DEFAULT NULL,
	line2 VARCHAR(50)  DEFAULT NULL,
	city VARCHAR(50)  DEFAULT NULL,
	province VARCHAR(50)  DEFAULT NULL,
	country VARCHAR(50)  DEFAULT NULL,
	createdAt DATETIME NOT NULL,
  updatedAt DATETIME  DEFAULT NULL,
  content TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  foreign key(userId) references user(id)
);

create table if not exists cart_item(
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
  foreign key(productId) references product(id)
);

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