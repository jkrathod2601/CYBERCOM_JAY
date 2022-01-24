create database if not exists leavemanagment;
use leavemanagment;

CREATE TABLE employee (
	`id` int NOT NULL AUTO_INCREMENT,
	`first_name` varchar(64) NOT NULL,
	`last_name` varchar(64) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `about-leave` (
	`id` int NOT NULL AUTO_INCREMENT,
	`role_id` int NOT NULL,
	`total_leave` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `role_leave` (
	`id` int NOT NULL AUTO_INCREMENT,
	`title` varchar(255) NOT NULL UNIQUE,
	PRIMARY KEY (`id`)
);

CREATE TABLE `leave` (
	`id` int NOT NULL AUTO_INCREMENT,
	`from_date` DATETIME NOT NULL,
	`to_date` DATETIME NOT NULL,
	`approveBy or rejectBy` int(64) NOT NULL,
	`total_days` int(64) NOT NULL,
	`status` BOOLEAN NOT NULL,
	`active` BOOLEAN NOT NULL,
	`userId` int NOT NULL,
	`reason_for_leave` varchar(255) NOT NULL,
	`type_of_leave` varchar(255) NOT NULL,
	`check_for_leaveID` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `aproveBy` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name_of_authority` int NOT NULL UNIQUE,
	PRIMARY KEY (`id`)
);

CREATE TABLE `cheak_for_leave` (
	`id` int NOT NULL AUTO_INCREMENT,
	`taken_leave` int NOT NULL,
	`employeeId` int NOT NULL,
	`roleId` int NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `about-leave` ADD CONSTRAINT `about-leave_fk0` FOREIGN KEY (`role_id`) REFERENCES `role_leave`(`id`);

ALTER TABLE `leave` ADD CONSTRAINT `leave_fk0` FOREIGN KEY (`approveBy or rejectBy`) REFERENCES `aproveBy`(`id`);

ALTER TABLE `leave` ADD CONSTRAINT `leave_fk1` FOREIGN KEY (`userId`) REFERENCES `employee`(`id`);

ALTER TABLE `leave` ADD CONSTRAINT `leave_fk2` FOREIGN KEY (`check_for_leaveID`) REFERENCES `cheak_for_leave`(`id`);

ALTER TABLE `cheak_for_leave` ADD CONSTRAINT `cheak_for_leave_fk0` FOREIGN KEY (`employeeId`) REFERENCES `employee`(`id`);

ALTER TABLE `cheak_for_leave` ADD CONSTRAINT `cheak_for_leave_fk1` FOREIGN KEY (`roleId`) REFERENCES `role_leave`(`id`);






