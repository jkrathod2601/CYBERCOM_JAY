-- You are the restaurant owner and you want to analyze a possible expansion 
-- (there will be at least one customer every day).
-- Write an SQL query to compute the moving average of how much the customer 
-- paid in a seven days window (i.e., current day + 6 days before). 
-- average_amount should be rounded to two decimal places.
-- Return result table ordered by visited_on in ascending order.

CREATE TABLE Customer_task (
    customer_id INT NOT NULL,
    name VARCHAR(24) NOT NULL,
    visited_on DATE NOT NULL,
    amount INT NOT NULL
);

insert into Customer_task values 
 (1 , "Jhon" , "2019-01-01" , 100)
, (2 , "Daniel" , "2019-01-02" , 110 )
, (3 , "Jade" , "2019-01-03" , 120)
, (4 , "Khaled" , "2019-01-04" , 130)
, (5 , "Winston" , "2019-01-05" , 110) 
, (6 , "Elvis" , "2019-01-06", 140) 
, (7 , "Anna" , "2019-01-07" , 150)
, (8 , "Maria" , "2019-01-08" , 80)
, (9 , "Jaze" , "2019-01-09" , 110) 
, (1 , "Jhon" , "2019-01-10" , 130) 
, (3 , "Jade" , "2019-01-10" , 150);

SELECT 
    *
FROM
    Customer_task;

-- =======================   QUERY   ===========----------------------


SELECT DISTINCT
    e1.visited_on,
    (SELECT 
            SUM(amount)
        FROM
            Customer_task e2
        WHERE
            (DATEDIFF(e1.visited_on, e2.visited_on)) <= 6
                AND (DATEDIFF(e1.visited_on, e2.visited_on) >= 0)) AS amount,
    (SELECT 
            AVG(amount)
        FROM
            Customer_task e2
        WHERE
            (DATEDIFF(e1.visited_on, e2.visited_on)) <= 6
                AND (DATEDIFF(e1.visited_on, e2.visited_on) >= 0)) AS average_amount
FROM
    Customer_task e1
WHERE
    6 <= (SELECT 
            COUNT(distinct e3.visited_on)
        FROM
            Customer_task e3
        WHERE
            e1.visited_on >= e3.visited_on
		);