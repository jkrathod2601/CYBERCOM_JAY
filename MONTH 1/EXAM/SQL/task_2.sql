-- Write an SQL query to find the customer_number for the customer who has 
-- placed the largest number of orders.

CREATE TABLE Orders_is (
    order_number INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_number INT NOT NULL
);

SELECT 
    *
FROM
    Orders_is;

-- =======================   QUERY   ===========----------------------

SELECT 
    Customer_number
FROM
    Orders_is
GROUP BY Customer_number
ORDER BY COUNT(*) DESC
LIMIT 1;