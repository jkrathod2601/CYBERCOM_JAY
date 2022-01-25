create database if not exists poll;
use poll;
CREATE TABLE `poll`.`user` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(50) NULL DEFAULT NULL,
  `middleName` VARCHAR(50) NULL DEFAULT NULL,
  `lastName` VARCHAR(50) NULL DEFAULT NULL,
  `mobile` VARCHAR(15) NULL,
  `email` VARCHAR(50) NULL,
  `passwordHash` VARCHAR(32) NOT NULL,
  `host` TINYINT(1) NOT NULL DEFAULT 0,
  `registeredAt` DATETIME NOT NULL,
  `lastLogin` DATETIME NULL DEFAULT NULL,
  `intro` TINYTEXT NULL DEFAULT NULL,
  `profile` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uq_mobile` (`mobile` ASC),
  UNIQUE INDEX `uq_email` (`email` ASC) );
  
select * from user;
  
  
  CREATE TABLE `poll`.`poll` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `hostId` BIGINT NOT NULL,
  `title` VARCHAR(75) NOT NULL,
  `metaTitle` VARCHAR(100) NULL,
  `slug` VARCHAR(100) NOT NULL,
  `summary` TINYTEXT NULL,
  `type` SMALLINT(6) NOT NULL DEFAULT 0,
  `published` TINYINT(1) NOT NULL DEFAULT 0,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NULL DEFAULT NULL,
  `publishedAt` DATETIME NULL DEFAULT NULL,
  `startsAt` DATETIME NULL DEFAULT NULL,
  `endsAt` DATETIME NULL DEFAULT NULL,
  `content` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uq_slug` (`slug` ASC),
  INDEX `idx_poll_host` (`hostId` ASC),
  CONSTRAINT `fk_poll_host`
    FOREIGN KEY (`hostId`)
    REFERENCES `poll`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
select * from poll;
    
CREATE TABLE `poll`.`poll_meta` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `pollId` BIGINT NOT NULL,
  `key` VARCHAR(50) NOT NULL,
  `content` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `idx_meta_poll` (`pollId` ASC),
  UNIQUE INDEX `uq_poll_meta` (`pollId` ASC, `key` ASC),
  CONSTRAINT `fk_meta_poll`
    FOREIGN KEY (`pollId`)
    REFERENCES `poll`.`poll` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

select * from poll_meta;

CREATE TABLE `poll`.`poll_question` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `pollId` BIGINT NOT NULL,
  `type` VARCHAR(50) NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 0,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NULL DEFAULT NULL,
  `content` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `idx_question_poll` (`pollId` ASC),
  CONSTRAINT `fk_question_poll`
    FOREIGN KEY (`pollId`)
    REFERENCES `poll`.`poll` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

select * from poll_question;

CREATE TABLE `poll`.`poll_answer` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `pollId` BIGINT NOT NULL,
  `questionId` BIGINT NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 0,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NULL DEFAULT NULL,
  `content` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `idx_answer_poll` (`pollId` ASC),
  CONSTRAINT `fk_answer_poll`
    FOREIGN KEY (`pollId`)
    REFERENCES `poll`.`poll` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

ALTER TABLE `poll`.`poll_answer` 
ADD INDEX `idx_answer_question` (`questionId` ASC);
ALTER TABLE `poll`.`poll_answer` 
ADD CONSTRAINT `fk_answer_question`
  FOREIGN KEY (`questionId`)
  REFERENCES `poll`.`poll_question` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
select * from poll_answer;
  
  CREATE TABLE `poll`.`category` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `parentId` BIGINT NULL DEFAULT NULL,
  `title` VARCHAR(75) NOT NULL,
  `metaTitle` VARCHAR(100) NULL DEFAULT NULL,
  `slug` VARCHAR(100) NOT NULL,
  `content` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`));

ALTER TABLE `poll`.`category` 
ADD INDEX `idx_category_parent` (`parentId` ASC);
ALTER TABLE `poll`.`category` 
ADD CONSTRAINT `fk_category_parent`
  FOREIGN KEY (`parentId`)
  REFERENCES `poll`.`category` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
select * from category;

  CREATE TABLE `poll`.`poll_category` (
  `pollId` BIGINT NOT NULL,
  `categoryId` BIGINT NOT NULL,
  PRIMARY KEY (`pollId`, `categoryId`),
  INDEX `idx_pc_category` (`categoryId` ASC),
  INDEX `idx_pc_poll` (`pollId` ASC),
  CONSTRAINT `fk_pc_poll`
    FOREIGN KEY (`pollId`)
    REFERENCES `poll`.`poll` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pc_category`
    FOREIGN KEY (`categoryId`)
    REFERENCES `poll`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
select * from poll_category;

CREATE TABLE poll_vote (
id BIGINT(20) AUTO_INCREMENT PRIMARY KEY,
pollId BIGINT(20) NOT NULL,
questionId BIGINT(20) NOT NULL,
answerId BIGINT(20) NOT NULL,
userId BIGINT(20) NOT NULL,
createdAt DATETIME,
updatedAt DATETIME,
content TEXT,
foreign key (pollId) references poll.poll(id),
foreign key (questionId) references poll.poll_question(id),
foreign key (answerId) references poll.poll_answer(id),
foreign key (userId) references poll.user(id)
);

select * from poll_vote;

CREATE TABLE tag(
id bigint not null  primary key,
title varchar(75),
metaTitle varchar(100),
slug VARCHAR(100),
content TEXT
);


 CREATE TABLE poll_tag(
 pollId int(20) not null,
 tagId int(20) not null,
 foreign key (pollId) references poll(id),
 foreign key (tagId) references tag(id)
 );
 
 -- /////////////////////////////////// --
 

 

    
