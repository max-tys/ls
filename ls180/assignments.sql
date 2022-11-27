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

 -- Lesson 2: NOT NULL and default values
 -- Write the SQL statement to create a table called temperatures to hold the following data... Keep in mind that all rows in the table should always contain all three values.

CREATE TABLE temperatures (
     "date" date DEFAULT CURRENT_DATE NOT NULL,
     low integer DEFAULT 0 NOT NULL,
     high integer DEFAULT 0 NOT NULL
);

 -- Lesson 2: NOT NULL and default values
 -- Each day, it rains one millimeter for every degree the average temperature goes above 35. Write a SQL statement to update the data in the table temperatures to reflect this.
 -- A decision has been made to store rainfall data in inches. Write the SQL statements required to modify the rainfall column to reflect these new requirements.

UPDATE temperatures
   SET rainfall = (high + low) / 2 - 35
 WHERE (high + low) / 2 > 35;

 UPDATE temperatures
   SET rainfall = rainfall * 0.0393701;

-- Write a SQL query that determines the average duration of movies for each decade represented in the films table, rounded to the nearest minute and listed in chronological order.

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

-- Write a SQL query that will return the following data:
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

-- Relational Data and JOINs: Working with Multiple Tables
-- Write a query that determines what percentage of the customers in the database have purchased a ticket to one or more of the events.

SELECT ROUND( COUNT(DISTINCT(t.customer_id)) 
            / COUNT(DISTINCT(c.id))::decimal * 100,
            2)
AS percent
FROM tickets AS t
RIGHT JOIN customers AS c ON t.customer_id = c.id;

-- Relational Data and JOINs: Working with Multiple Tables
-- Write a query that returns the name of each event and how many tickets were sold for it, in order from most popular to least popular.

SELECT e.name, COUNT(t.event_id) AS popularity
FROM tickets AS t
RIGHT JOIN events AS e
ON t.event_id = e.id
GROUP BY e.name
ORDER BY popularity DESC;

-- Relational Data and JOINs: Working with Multiple Tables
-- Write a query that returns the user id, email address, and number of events for all customers that have purchased tickets to three events.

SELECT c.id, c.email, COUNT(DISTINCT(t.event_id))
FROM customers AS c
JOIN tickets AS t
ON c.id = t.customer_id
GROUP BY c.id
HAVING COUNT(DISTINCT(t.event_id)) = 3;

-- Relational Data and JOINs: Working with Multiple Tables
-- Write a query to print out a report of all tickets purchased by the customer with the email address 'gennaro.rath@mcdermott.co'. The report should include the event name and starts_at and the seat's section name, row, and seat number.

SELECT e.name AS event, 
       e.starts_at,
       s2.name AS section,
       s1.row,
       s1.number AS seat
FROM tickets AS t
     JOIN events    AS e  ON t.event_id = e.id
     JOIN seats     AS s1 ON t.seat_id = s1.id
     JOIN sections  AS s2 ON s1.section_id = s2.id
     JOIN customers AS c  ON t.customer_id = c.id
WHERE c.email = 'gennaro.rath@mcdermott.co';
