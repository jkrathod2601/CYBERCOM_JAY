-- Write an SQL query to report the customer ids from the Customer table 
-- that bought all the products in the Product table. Return the result 
-- table in any order.

CREATE TABLE Product (
    product_key INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

SELECT 
    *
FROM
    product;

CREATE TABLE Customer (
    customer_id INT NOT NULL,
    product_key INT NOT NULL
);

SELECT 
    *
FROM
    Customer;

insert into Customer values(1,5),(2,6),(3,5),(3,6),(1,6);


-- =======================   QUERY   ===========----------------------

SELECT DISTINCT
    customer_id
FROM
    Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT 
        COUNT(*)
    FROM
        Product); 