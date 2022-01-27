-- Write a SQL query for a report that provides the pairs (actor_id, 
-- director_id) where the actor has cooperated with the director at least 
-- three times.

CREATE TABLE ActorDirector (
    actor_id INT NOT NULL,
    director_id INT NOT NULL,
    timestamp_ INT NOT NULL PRIMARY KEY
);

SELECT 
    *
FROM
    ActorDirector;

-- =======================   QUERY   ===========----------------------

SELECT DISTINCT
    actor_id, director_id
FROM
    ActorDirector e1
WHERE
    3 <= (SELECT 
            COUNT(*)
        FROM
            ActorDirector e2
        WHERE
            e1.actor_id = e2.actor_id
                AND e1.director_id = e2.director_id);