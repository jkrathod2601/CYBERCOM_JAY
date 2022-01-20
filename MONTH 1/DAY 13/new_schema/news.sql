create database if not exists news;
use news;

CREATE TABLE IF NOT EXISTS user (
    id BIGINT NOT NULL AUTO_INCREMENT,
    firstName VARCHAR(50) NULL DEFAULT NULL,
    middleName VARCHAR(50) NULL DEFAULT NULL,
    lastName VARCHAR(50) NULL DEFAULT NULL,
    mobile VARCHAR(15) NOT NULL,
    email VARCHAR(50) NOT NULL,
    passwordHash VARCHAR(32) NOT NULL,
    admin TINYINT(1) NOT NULL DEFAULT 0,
    customer TINYINT(1) NOT NULL DEFAULT 0,
    registeredAt DATETIME NOT NULL,
    lastLogin DATETIME DEFAULT NULL,
    intro TINYTEXT DEFAULT NULL,
    profile TEXT DEFAULT NULL,
    PRIMARY KEY (`id`)
);



CREATE TABLE IF NOT EXISTS subscriber (
    id BIGINT NOT NULL AUTO_INCREMENT,
    customerId BIGINT DEFAULT NULL,
    firstName VARCHAR(100) NOT NULL,
    middleName VARCHAR(100) DEFAULT NULL,
    lastName VARCHAR(100) DEFAULT NULL,
    email VARCHAR(100) NOT NULL,
    mobile VARCHAR(50) DEFAULT NULL,
    phone VARCHAR(50) DEFAULT NULL,
    active TINYINT(1) NOT NULL DEFAULT 1,
    createdAt DATETIME NOT NULL,
    updatedAt DATETIME DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (customerId)
        REFERENCES user (id)
);

CREATE TABLE IF NOT EXISTS newsletter (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userId` BIGINT NOT NULL,
    `title` VARCHAR(75) NOT NULL,
    `descritpion` VARCHAR(2048) DEFAULT NULL,
    `type` SMALLINT(6) NOT NULL DEFAULT 0,
    `multiple` TINYINT(1) NOT NULL DEFAULT 0,
    `global` TINYINT(1) NOT NULL DEFAULT 0,
    `status` SMALLINT(6) NOT NULL DEFAULT 0,
    `createdAt` DATETIME NOT NULL,
    `updatedAt` DATETIME DEFAULT NULL,
    `publishedAt` DATETIME DEFAULT NULL,
    `content` TEXT DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (userid)
        REFERENCES user (id)
);

CREATE TABLE IF NOT EXISTS edition (
    id BIGINT NOT NULL AUTO_INCREMENT,
    newsletterId BIGINT NOT NULL,
    title VARCHAR(100) NOT NULL,
    description VARCHAR(2048) DEFAULT NULL,
    status SMALLINT(6) NOT NULL DEFAULT 0,
    createdAt DATETIME NOT NULL,
    updatedAt DATETIME DEFAULT NULL,
    publishedAt DATETIME DEFAULT NULL,
    content TEXT DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (newsletterId)
        REFERENCES newsletter (id)
);

CREATE TABLE IF NOT EXISTS newsletter_trigger (
    id BIGINT NOT NULL AUTO_INCREMENT,
    newsletterId BIGINT NOT NULL,
    editionId BIGINT DEFAULT NULL,
    subscriberId BIGINT NOT NULL,
    sent TINYINT(1) NOT NULL DEFAULT 1,
    delivered TINYINT(1) NOT NULL DEFAULT 1,
    mode SMALLINT(6) NOT NULL DEFAULT 0,
    createdAt DATETIME NOT NULL,
    updatedAt DATETIME DEFAULT NULL,
    sentAt DATETIME DEFAULT NULL,
    deliveredAt DATETIME DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (newsletterId)
        REFERENCES newsletter (id),
    FOREIGN KEY (editionId)
        REFERENCES edition (id),
    FOREIGN KEY (subscriberId)
        REFERENCES subscriber (id)
);

CREATE TABLE IF NOT EXISTS newsletter_meta (
    id BIGINT NOT NULL AUTO_INCREMENT,
    newsletterId BIGINT NOT NULL,
    type VARCHAR(50) NOT NULL,
    key_ VARCHAR(160) NOT NULL,
    content TEXT DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (newsletterId)
        REFERENCES newsletter (id)
);

CREATE TABLE IF NOT EXISTS mailing_list (
    id BIGINT NOT NULL AUTO_INCREMENT,
    newsletterId BIGINT NOT NULL,
    subscriberId BIGINT NOT NULL,
    active TINYINT(1) NOT NULL DEFAULT 1,
    createdAt DATETIME NOT NULL,
    updatedAt DATETIME DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (newsletterId)
        REFERENCES newsletter (id),
    FOREIGN KEY (subscriberId)
        REFERENCES subscriber (id)
);


CREATE TABLE IF NOT EXISTS address (
    id BIGINT NOT NULL AUTO_INCREMENT,
    userId BIGINT DEFAULT NULL,
    subscriberId BIGINT DEFAULT NULL,
    firstName VARCHAR(50) DEFAULT NULL,
    middleName VARCHAR(50) DEFAULT NULL,
    lastName VARCHAR(50) DEFAULT NULL,
    mobile VARCHAR(15) DEFAULT NULL,
    email VARCHAR(50) DEFAULT NULL,
    line1 VARCHAR(50) DEFAULT NULL,
    line2 VARCHAR(50) DEFAULT NULL,
    city VARCHAR(50) DEFAULT NULL,
    province VARCHAR(50) DEFAULT NULL,
    country VARCHAR(50) DEFAULT NULL,
    areaCode VARCHAR(50) DEFAULT NULL,
    createdAt DATETIME NOT NULL,
    updatedAt DATETIME DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (userId)
        REFERENCES user (id),
    FOREIGN KEY (subscriberId)
        REFERENCES subscriber (id)
);