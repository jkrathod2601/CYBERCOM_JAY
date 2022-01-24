-- Write an SQL query to report the first name, last name, city, and state of each person in the Person table. If the
 -- address of a personId is not present in the Address table, report null instead. Return the result table in any order.

CREATE TABLE IF NOT EXISTS Person_2 (
    personId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    lastname VARCHAR(32) NOT NULL,
    firstname VARCHAR(32) NOT NULL
);

CREATE TABLE IF NOT EXISTS Address (
    addressId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    personId INT NOT NULL,
    city VARCHAR(24) NOT NULL,
    state VARCHAR(24) NOT NULL
);

SELECT 
    *
FROM
    Person_2;
SELECT 
    *
FROM
    Address;

SELECT 
    e1.firstname, e1.lastname, e2.city, e2.state
FROM
    Person_2 e1
        LEFT JOIN
    Address e2 ON e1.personId = e2.personId;