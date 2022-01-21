-- Newsletter Database
-- ===================

-- 1)Get all the users who created in the last 15 days.
    SELECT 
    *
    FROM
        user
    WHERE
        (DATEDIFF(CURDATE(), registeredAt) < 15)
            AND (DATEDIFF(CURDATE(), registeredAt) > 0);
-- 2)Get all the users with their addresses who are active subscribers.
        select * from
            user e1
        inner join address e2 on e1.id=e2.userid
        where e1.id in (select customerId from subscriber where active=1);
-- 3)Get all the users who subscribed in the last 30 days and are active currently.
        SELECT 
            *
        FROM
            user
        WHERE
            id IN (SELECT 
                    customerId
                        FROM
                    subscriber
        WHERE
            (DATEDIFF(CURDATE(), createdAt) < 30)
                AND (DATEDIFF(CURDATE(), createdAt) > 0)
                AND active = 1);
-- 4)Get all the users email who are currently in the active mailing list.
            SELECT 
                email   
            FROM
                user
            WHERE
                id IN (SELECT 
                        customerId
                        FROM
                        subscriber
                        WHERE
                            id IN (SELECT 
                                    subscriberId
                                    FROM
                                    mailing_list
                                    WHERE
                                    active = 1));
-- 5)Get all the users email and newsletter title for which newsletter triggered today.
    SELECT 
    e1.email, e2.title
FROM
    user e1
        INNER JOIN
    newsletter e2 ON e1.id = e2.userId
        INNER JOIN
    newsletter_trigger e3 ON e2.id = e3.newsletterId
WHERE
    DATEDIFF(CURDATE(), e3.sentAt) = 0; 

-- Employee Database

-- 6)Get the users which are having permission id assigned as 2.
    SELECT 
    e1.id, e1.firstname
FROM
    user e1
        INNER JOIN
    role e2 ON e1.roleId = e2.id
        INNER JOIN
    role_permission e3 ON e2.id = e3.roleId
WHERE
    e3.permissionId = 2;
-- 7)Get a list of users who are working in organization id 1 along with organization title..
SELECT 
    e1.firstname, e3.title
FROM
    user e1
        INNER JOIN
    employee e2 ON e1.id = e2.userid
        INNER JOIN
    organization e3 ON e2.organizationid = e3.id
WHERE
    e3.id = 1;
-- 8)Get all the employee emails who are created in the last two dates and have permission id 1.
SELECT 
    e1.email
FROM
    user e1
        INNER JOIN
    employee e2 ON e1.id = e2.userid
        INNER JOIN
    role e3 ON e2.roleid = e3.id
        INNER JOIN
    role_permission e4 ON e4.roleId = e3.id
WHERE
    e4.permissionId = 1
        AND DATEDIFF(CURDATE(), e2.createdAt) < 2
        AND DATEDIFF(CURDATE(), e2.createdAt) > 0;
-- 9)Get the active count of employees working in organization id 1.
SELECT 
    COUNT(e1.id)
FROM
    employee e1
        INNER JOIN
    organization e2 ON e1.organizationid = e2.id
WHERE
    e2.id = 1;
-- 10)Get all the employee emails who were working last year.
SELECT 
    email
FROM
    user
WHERE
    id IN (SELECT 
            userid
        FROM
            employee
        WHERE
            DATEDIFF(CURDATE(), startsAt) > 365);
