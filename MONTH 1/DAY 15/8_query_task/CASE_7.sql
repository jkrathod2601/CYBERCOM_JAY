-- Create a database schema for student grade system. It contains 
-- student data and their grade of each subject based on the different semester.

create database if not exists studentgrade;
use studentgrade;

CREATE TABLE Student_info(
	id int(10) NOT NULL AUTO_INCREMENT,
	first_name varchar(32) NOT NULL,
	last_name varchar(32) NOT NULL,
	gender enum("male","female"),
	current_sem int NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE `sem` (
	`id` int NOT NULL AUTO_INCREMENT,
	`sem_is` int NOT NULL AUTO_INCREMENT UNIQUE,
	PRIMARY KEY (`id`)
);

CREATE TABLE `subject_info` (
	`id` int NOT NULL AUTO_INCREMENT,
	`subject_sem` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `allover_table` (
	`id` int NOT NULL AUTO_INCREMENT,
	`studentId` int NOT NULL AUTO_INCREMENT,
	`subjectIs` int NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id`)
);

CREATE TABLE `marks` (
	`id` int NOT NULL AUTO_INCREMENT,
	`marks_get` int AUTO_INCREMENT,
	`total_marks` int NOT NULL,
	`status` enum("pass","fail") NOT NULL,
	`alloverId` int NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `subject_info` ADD CONSTRAINT `subject_info_fk0` FOREIGN KEY (`subject_sem`) REFERENCES `sem`(`id`);

ALTER TABLE `allover_table` ADD CONSTRAINT `allover_table_fk0` FOREIGN KEY (`studentId`) REFERENCES `Student_info`(`id`);

ALTER TABLE `allover_table` ADD CONSTRAINT `allover_table_fk1` FOREIGN KEY (`subjectIs`) REFERENCES `subject_info`(`id`);

ALTER TABLE `marks` ADD CONSTRAINT `marks_fk0` FOREIGN KEY (`alloverId`) REFERENCES `allover_table`(`id`);





