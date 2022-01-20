create database if not exists emanagment;
use emanagment;

CREATE TABLE IF NOT EXISTS role (
    id BIGINT NOT NULL AUTO_INCREMENT,
    title VARCHAR(72) NOT NULL,
    slug VARCHAR(96) NOT NULL,
    description TINYTEXT NULL,
    type SMALLINT NOT NULL DEFAULT 0,
    active TINYINT NOT NULL DEFAULT 0,
    createdAt DATETIME NOT NULL,
    updatedAt DATETIME DEFAULT NULL,
    content TEXT DEFAULT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS permission (
    id BIGINT NOT NULL AUTO_INCREMENT,
    title VARCHAR(72) NOT NULL,
    slug VARCHAR(96) NOT NULL,
    description TINYTEXT NULL,
    type SMALLINT NOT NULL DEFAULT 0,
    active TINYINT NOT NULL DEFAULT 0,
    createdAt DATETIME NOT NULL,
    updatedAt DATETIME NULL DEFAULT NULL,
    content TEXT  DEFAULT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS role_permission (
    roleId BIGINT NOT NULL,
    permissionId BIGINT NOT NULL,
    createdAt DATETIME NOT NULL,
    updatedAt DATETIME NULL,
    FOREIGN KEY (roleId)
        REFERENCES role (id),
    FOREIGN KEY (permissionId)
        REFERENCES permission (id)
);

CREATE TABLE IF NOT EXISTS user (
    id BIGINT NOT NULL AUTO_INCREMENT,
    roleId BIGINT NOT NULL,
    firstName VARCHAR(50) DEFAULT NULL,
    middleName VARCHAR(50) DEFAULT NULL,
    lastName VARCHAR(50) DEFAULT NULL,
    username VARCHAR(50) DEFAULT NULL,
    mobile VARCHAR(15) NOT NULL,
    email VARCHAR(50) NOT NULL,
    passwordHash VARCHAR(32) NOT NULL,
    registeredAt DATETIME NOT NULL,
    lastLogin DATETIME NULL DEFAULT NULL,
    intro TINYTEXT DEFAULT NULL,
    profile TEXT DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (roleId)
        REFERENCES role (id)
);

CREATE TABLE IF NOT EXISTS organization (
    id BIGINT NOT NULL AUTO_INCREMENT,
    createdBy BIGINT NOT NULL,
    updatedBy BIGINT NOT NULL,
    title VARCHAR(75) NOT NULL,
    metaTitle VARCHAR(100) DEFAULT NULL,
    slug VARCHAR(100) NOT NULL,
    summary TINYTEXT DEFAULT NULL,
    status SMALLINT NOT NULL DEFAULT 0,
    createdAt DATETIME NOT NULL,
    updatedAt DATETIME NULL DEFAULT NULL,
    profile TEXT DEFAULT NULL,
    content TEXT DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (createdBy)
        REFERENCES user (id),
    FOREIGN KEY (updatedBy)
        REFERENCES user (id)
);

CREATE TABLE IF NOT EXISTS organization_meta (
    id BIGINT NOT NULL AUTO_INCREMENT,
    organizationId BIGINT NOT NULL,
    key_ VARCHAR(50) NOT NULL,
    content TEXT NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (organizationId)
        REFERENCES organization (id)
);


CREATE TABLE IF NOT EXISTS employee (
    id BIGINT NOT NULL AUTO_INCREMENT,
    organizationId BIGINT NOT NULL,
    userId BIGINT NOT NULL,
    roleId BIGINT NOT NULL,
    createdBy BIGINT NOT NULL,
    updatedBy BIGINT NOT NULL,
    code VARCHAR(100) NOT NULL,
    status SMALLINT NOT NULL DEFAULT 0,
    createdAt DATETIME NOT NULL,
    updatedAt DATETIME DEFAULT NULL,
    startsAt DATETIME DEFAULT NULL,
    endsAt DATETIME DEFAULT NULL,
    notes TEXT DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (userId)
        REFERENCES user (id),
    FOREIGN KEY (organizationId)
        REFERENCES organization (id),
    FOREIGN KEY (roleId)
        REFERENCES role (id),
    FOREIGN KEY (createdBy)
        REFERENCES user (id),
    FOREIGN KEY (updatedBy)
        REFERENCES user (id)
);


