-- Lesson 2: Working with a Single Table
-- Write a SQL query to determine how profitable each item on the menu is based on the amount of time it takes to prepare one item. Assume that whoever is preparing the food is being paid $13 an hour. List the most profitable items first.

SELECT item, menu_price, ingredient_cost, 
       ROUND(13.00 * prep_time / 60, 2) AS labor,
       (menu_price - ingredient_cost - ROUND(13.00 * prep_time / 60, 2)) AS profit
  FROM menu_items
 ORDER BY profit DESC;

-- Lesson 2: More single table queries
-- Write a SQL query that lists each domain used in an email address in the people table and how many people in the database have an email address containing that domain. Domains should be listed with the most popular first.

SELECT TRIM('@' FROM SUBSTRING(email FROM '@.+$')) as domain, 
       COUNT(id)
  FROM people
 GROUP BY domain
 ORDER BY count DESC
 LIMIT 10;

-- Lesson 2: More single table queries
-- Write a SQL statement that will update the given_name values to be all uppercase for all users with an email address that contains teleworm.us.

UPDATE people
   SET given_name = UPPER(given_name)
 WHERE email LIKE '%teleworm.us';

 