
-- 1) Total income of Restaurant till now.

SELECT 
    SUM(grandTotal)
FROM
    Hotel.order;

-- 2)Customer who visited the restaurant more than twice.

SELECT 
    firstName
FROM
    user
WHERE
    id IN (SELECT 
            userId
        FROM
            Hotel.order
        GROUP BY userId
        HAVING COUNT(id) > 1);

-- 3) List of all menus with its menu items.
SELECT 
    *
FROM
    menu m1
        INNER JOIN
    menu_item m2 ON m1.id = m2.menuId
        INNER JOIN
    item m3 ON m2.itemId = m3.id;
    
-- 4) List out all the unique ids and possible indexes for this DB schema.
    -- unique keys  1) mobile (user)
                -- 2) email (user)
                -- 3) slug (in every table)
    --  indexing  1)email and mobile (user)
                --   2) userId (ingredient) 
                --  3)  userId (item)
                --  4)  itemId (recipe)
-- 5) List out total order placed by each User

SELECT 
    e1.firstName, COUNT(e2.id) AS total_order_place
FROM
    user e1
        INNER JOIN
    Hotel.order e2 ON e1.id = e2.userId
GROUP BY userId;
 
-- 6)Make a list of each user and the highest-priced menu item he or she ordered.
SELECT 
    e1.firstName, MAX(e3.price) AS max_item_price
FROM
    user e1
        INNER JOIN
    Hotel.order e2 ON e1.id = e2.userId
        INNER JOIN
    order_item e3 ON e2.id = e3.orderId
GROUP BY e2.userId; 

-- 7) Retrieve the name of a chef who prepares more recipes than any other chef.
	
    SELECT 
    e1.firstName
FROM
    user e1
        INNER JOIN
    item_chef e2 ON e1.id = e2.chefId
GROUP BY e2.chefId
HAVING MAX(e2.id);


-- 8) Retrieve the amount of subtotal for all day on 9th November 2021. (It does not include the total, formula: item price * ordered qty). 

SELECT 
    SUM(subTotal)
FROM
    Hotel.order
WHERE
    createdAt = '2021-11-09';
    
-- 9) List out user along with the average amount spend at the restaurant.

SELECT 
    e1.firstName, AVG(e2.total)
FROM
    user e1
        INNER JOIN
    Hotel.order e2 ON e1.id = e2.userid
GROUP BY e2.userId; 

select * from order_item;
-- 10) List out the menu items which are preferred by the customer at dinner time. 
SELECT 
    e2.title
FROM
    order_item e1
        INNER JOIN
    item e2 ON e1.orderId = e2.id
WHERE
    HOUR(e1.createdAt) >= 20; 
