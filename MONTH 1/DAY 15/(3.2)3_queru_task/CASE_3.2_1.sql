
CREATE TABLE IF NOT EXISTS Activity (
    player_id INT NOT NULL,
    device_id INT NOT NULL,
    event_date DATE NOT NULL,
    games_played INT NOT NULL
);

SELECT 
    *
FROM
    Activity;

-- 1) Write an SQL query to report the first login date for each player. Return the result table in any order. 
SELECT 
    player_id, event_date
FROM
    Activity
GROUP BY player_id
ORDER BY player_id ASC;

-- 2) Write an SQL query to report the device that is first logged in for each player. Return the result table in any order.
SELECT 
    player_id, device_id
FROM
    Activity
GROUP BY player_id
ORDER BY player_id ASC;

-- 3) Write an SQL query to report for each player and date, how many games played so far by the player. That is, the total number of games 
-- played by the player until that date. Check the example for clarity. Return the result table in any order. 

-- insert into Activity values(1,2,'2016-03-01',5),(1,2,'2016-05-02',6),(1,3,'2017-06-25',1),(3,1,'2016-03-02',0),(3,4,'2018-07-03',5);

SELECT 
    player_id,
    event_date,
    (SELECT 
            SUM(a2.games_played)
        FROM
            Activity a2
        WHERE
            a2.event_date <= a1.event_date
                AND a1.player_id = a2.player_id) AS games_played_so_far
FROM
    Activity a1;