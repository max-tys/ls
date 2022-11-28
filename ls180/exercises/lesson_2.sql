-- #####################################
-- ## Lesson 2: Schema, Data, and SQL ##
-- #####################################

-- Assignment 6: Working with a Single Table
-- Write a SQL query to determine how profitable each item on the menu is based on the amount of time it takes to prepare one item. Assume that whoever is preparing the food is being paid $13 an hour. List the most profitable items first.

SELECT item, menu_price, ingredient_cost, 
       ROUND(13.00 * prep_time / 60, 2) AS labor,
       (menu_price - ingredient_cost - ROUND(13.00 * prep_time / 60, 2)) AS profit
  FROM menu_items
 ORDER BY profit DESC;

-- Assignment 8: More Single Table Queries
-- Question 4: Write a SQL query that lists each domain used in an email address in the people table and how many people in the database have an email address containing that domain. Domains should be listed with the most popular first.

SELECT TRIM('@' FROM SUBSTRING(email FROM '@.+$')) as domain, 
       COUNT(id)
  FROM people
 GROUP BY domain
 ORDER BY count DESC
 LIMIT 10;

-- Assignment 8: More Single Table Queries
-- Question 7: Write a SQL statement that will update the given_name values to be all uppercase for all users with an email address that contains teleworm.us.

UPDATE people
   SET given_name = UPPER(given_name)
 WHERE email LIKE '%teleworm.us';

-- Assignment 9: NOT NULL and Default Values
-- Question 3: Write the SQL statement to create a table called temperatures to hold the following data... Keep in mind that all rows in the table should always contain all three values.

CREATE TABLE temperatures (
     "date" date DEFAULT CURRENT_DATE NOT NULL,
     low integer DEFAULT 0 NOT NULL,
     high integer DEFAULT 0 NOT NULL
);

-- Assignment 9: NOT NULL and Default Values
-- Question 7: Each day, it rains one millimeter for every degree the average temperature goes above 35. Write a SQL statement to update the data in the table temperatures to reflect this.
-- A decision has been made to store rainfall data in inches. Write the SQL statements required to modify the rainfall column to reflect these new requirements.

UPDATE temperatures
   SET rainfall = (high + low) / 2 - 35
 WHERE (high + low) / 2 > 35;

 UPDATE temperatures
   SET rainfall = rainfall * 0.0393701;

-- Assignment 12: GROUP BY and Aggregate Functions
-- Question 7: Write a SQL query that determines the average duration of movies for each decade represented in the films table, rounded to the nearest minute and listed in chronological order.

SELECT
     CASE WHEN year < 1950 then '1940'
          WHEN year < 1960 then '1950'
          WHEN year < 1970 then '1960'
          WHEN year < 1980 then '1970'
          WHEN year < 1990 then '1980'
          WHEN year < 2000 then '1990'
          WHEN year < 2010 then '2000'
     ELSE '2010'
     END AS decade,
     ROUND(AVG(duration)) AS average_duration
FROM films
GROUP BY decade
ORDER BY decade;

-- Assignment 12: GROUP BY and Aggregate Functions
-- Question 10: Write a SQL query that will return the following data:
--  decade |   genre   |                  films
-- --------+-----------+------------------------------------------
--    1940 | drama     | Casablanca

SELECT 
     year / 10 * 10 AS decade, 
     genre,
     STRING_AGG(title, ', ') AS films
FROM films
GROUP BY decade, genre
ORDER BY decade;
