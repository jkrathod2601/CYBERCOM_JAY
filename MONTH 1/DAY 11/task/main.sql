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
    id BIGINT NOT NULL auto_increment,
    title varchar(75) not null default "N/A",
    metaTitle varchar(100) default null,
    slug varchar(100) not null default "N/A",
    content text default null,
    primary key (id)
);
