
--  1 ) List out all questions with it’s answer which is having maximum vote.

SELECT 
    e1.questionId, e3.id
FROM
    poll_vote e1
        INNER JOIN
    poll_question e2 ON e1.questionId = e2.id
        INNER JOIN
    poll_answer e3 ON e3.questionId = e2.id
GROUP BY e1.questionId
HAVING COUNT(e1.id) = 2;

-- 2) List out all the categories which is having multiple poll questions under it.

SELECT 
    *
FROM
    category e1
        INNER JOIN
    poll_category e2 ON e1.id = e2.categoryId
        INNER JOIN
    poll e3 ON e3.id = e2.pollId
        INNER JOIN
    poll_question e4 ON e3.id = e4.pollId
GROUP BY e1.parentId
HAVING COUNT(e1.id) > 1;

-- 3) List out all the polls which are currently active. 
	select distinct(e1.title)
    from poll e1
    inner join poll_question e2 on e1.id=e2.pollId
    where e2.active=1;

-- 4) List out all the users who is not logged in since last week.
	SELECT 
    firstName
FROM
    user
WHERE
    DATEDIFF(CURDATE(), lastLogin) > 7;

-- 5) List out all the users whose email provider is not google.
SELECT 
    firstName, email
FROM
    user
WHERE
    email NOT LIKE '%gmail.com';
    
-- 6) List out all the polls which are published in 2021.
SELECT 
    *
FROM
    poll
WHERE
    YEAR(publishedAt) = 2021; 
    
-- 7) List out all the users who did not answer any poll yet.
SELECT 
    firstName
FROM
    user
WHERE
    id NOT IN (SELECT DISTINCT
            (userId)
        FROM
            poll_vote); 

-- 8) Create all the possible unique key and indexes for this database schema. 

