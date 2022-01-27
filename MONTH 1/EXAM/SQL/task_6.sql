-- Write an SQL query to find the prices of all products on 2019-08-16. 
-- Assume the price of all products before any change is 10.
-- Return the result table in any order.

CREATE TABLE Products (
    product_id INT NOT NULL,
    new_price INT NOT NULL,
    change_date DATE NOT NULL
);

insert into Products values(1,20,"2019-08-14"),(2,50,"2019-08-14"),(1,30,"2019-08-15"),(1,35,"2019-08-16"),(2,65,"2019-08-17"),(3,20,"2019-08-18");
SELECT 
    *
FROM
    Products;


-- =======================   QUERY   ===========----------------------

SELECT 
    e1.product_id, e1.new_price
FROM
    Products e1
WHERE
    e1.change_date = (SELECT 
            MAX(change_date)
        FROM
            Products e2
        WHERE
            e1.product_id = e2.product_id
                AND e2.change_date <= '2019-08-16') 
UNION SELECT 
    product_id, (10) AS new_price
FROM
    Products
WHERE
    change_date > '2019-08-16'
        AND product_id NOT IN (SELECT 
            product_id
        FROM
            Products
        WHERE
            change_date < '2019-08-16');