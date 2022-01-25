-- Write an SQL query to report all customers who never order 
-- anything. Return the result table in any order.


CREATE TABLE IF NOT EXISTS Customers (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(64) NOT NULL
);

CREATE TABLE IF NOT EXISTS Orders (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customerId INT NOT NULL,
    FOREIGN KEY (customerId)
        REFERENCES Customers (id)
);

SELECT 
    *
FROM
    Customers;
SELECT 
    *
FROM
    Orders;


-- ------------------------------------------

SELECT 
    name
FROM
    Customers
WHERE
    id NOT IN (SELECT 
            distinct(customerId)
        FROM
            Orders
        GROUP BY customerId);