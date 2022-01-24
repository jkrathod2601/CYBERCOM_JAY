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