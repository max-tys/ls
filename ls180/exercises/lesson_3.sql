-- #########################################
-- ## Lesson 3: Relational Data and JOINs ##
-- #########################################

-- Assignment 6: Working with Multiple Tables
-- Question 4: Write a query that determines what percentage of the customers in the database have purchased a ticket to one or more of the events.

SELECT ROUND( COUNT(DISTINCT(t.customer_id)) 
            / COUNT(DISTINCT(c.id))::decimal * 100,
            2)
AS percent
FROM tickets AS t
RIGHT JOIN customers AS c ON t.customer_id = c.id;

-- Assignment 6: Working with Multiple Tables
-- Question 5: Write a query that returns the name of each event and how many tickets were sold for it, in order from most popular to least popular.

SELECT e.name, COUNT(t.event_id) AS popularity
FROM tickets AS t
RIGHT JOIN events AS e
ON t.event_id = e.id
GROUP BY e.name
ORDER BY popularity DESC;

-- Assignment 6: Working with Multiple Tables
-- Question 6: Write a query that returns the user id, email address, and number of events for all customers that have purchased tickets to three events.

SELECT c.id, c.email, COUNT(DISTINCT(t.event_id))
FROM customers AS c
JOIN tickets AS t
ON c.id = t.customer_id
GROUP BY c.id
HAVING COUNT(DISTINCT(t.event_id)) = 3;

-- Assignment 6: Working with Multiple Tables
-- Question 7: Write a query to print out a report of all tickets purchased by the customer with the email address 'gennaro.rath@mcdermott.co'. The report should include the event name and starts_at and the seat's section name, row, and seat number.

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

-- Assignment 12: Many-to-Many Relationships
-- Question 1: The books_categories table from this database was created with foreign keys that don't have the NOT NULL and ON DELETE CASCADE constraints. Go ahead and add them now.

ALTER TABLE books_categories
ALTER COLUMN book_id SET NOT NULL,
ALTER COLUMN category_id SET NOT NULL;

ALTER TABLE books_categories
DROP CONSTRAINT books_categories_book_id_fkey,
ADD CONSTRAINT books_categories_book_id_fkey
FOREIGN KEY (book_id) REFERENCES books(id)
ON DELETE CASCADE;

ALTER TABLE books_categories
DROP CONSTRAINT books_categories_category_id_fkey,
ADD CONSTRAINT books_categories_category_id_fkey
FOREIGN KEY (category_id) REFERENCES categories(id)
ON DELETE CASCADE;

-- Assignment 12: Many-to-Many Relationships
-- Question 2: Write a SQL statement that will return the following result:

SELECT b.id, b.author, STRING_AGG(c.name, ', ') AS categories
  FROM books AS b
       JOIN books_categories AS bc ON b.id = bc.book_id
       JOIN categories AS c ON c.id = bc.category_id
 GROUP BY b.id
 ORDER BY id;

-- Assignment 12: Many-to-Many Relationships
-- Question 3: Write SQL statements to insert the following new books into the database. 
-- What do you need to do to ensure this data fits in the database?

ALTER TABLE books
ALTER COLUMN title TYPE varchar(80);

INSERT INTO books
(author, title) VALUES 
('Lynn Sherr', 'Sally Ride: America''s First Woman in Space'),
('Charlotte Brontë', 'Jane Eyre'),
('Meeru Dhalwala and Vikram Vij', 'Vij''s: Elegant and Inspired Indian Cuisine');

INSERT INTO categories
(name) VALUES
('Space Exploration'),
('Cookbook'),
('South Asia');

INSERT INTO books_categories VALUES
(4, 5), (4, 1), (4, 7),
(5, 2), (5, 4),
(6, 8), (6, 1), (6, 9);

-- Assignment 12: Many-to-Many Relationships
-- Question 4: Write a SQL statement to add a uniqueness constraint on the combination of columns book_id and category_id of the books_categories table. 
-- This constraint should be a table constraint; so, it should check for uniqueness on the combination of book_id and category_id across all rows of the books_categories table.

ALTER TABLE books_categories
ADD UNIQUE (book_id, category_id);

-- Assignment 12: Many-to-Many Relationships
-- Question 5: Write a SQL statement that will return the following result:

SELECT c.name, COUNT(b.id) AS book_count, STRING_AGG(b.title, ', ') AS book_titles
  FROM books AS b
       JOIN books_categories AS bc ON b.id = bc.book_id
       JOIN categories AS c ON c.id = bc.category_id
 GROUP BY c.name
 ORDER BY c.name;

-- Assignment 13: Many-to-Many Relationships
-- Question 2: Write the SQL statement needed to create a join table that will allow a film to have multiple directors, and directors to have multiple films. Include an id column in this table, and add foreign key constraints to the other columns.

CREATE TABLE directors_films (
  id serial PRIMARY KEY,
  director_id integer REFERENCES directors(id) ON DELETE CASCADE,
  film_id integer REFERENCES films(id) ON DELETE CASCADE
);

-- Assignment 13: Many-to-Many Relationships
-- Question 3: Write the SQL statements needed to insert data into the new join table to represent the existing one-to-many relationships.

INSERT INTO directors_films
(film_id, director_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 3), (8, 7), (9, 8), (10, 4);

-- Assignment 13: Many-to-Many Relationships
-- Question 4: Write a SQL statement to remove any unneeded columns from films.

ALTER TABLE films
DROP COLUMN director_id;

-- Assignment 13: Many-to-Many Relationships
-- Question 5: Write a SQL statement that will return the following result:

SELECT films.title, directors.name
FROM directors
  JOIN directors_films ON directors.id = directors_films.director_id
  JOIN films ON directors_films.film_id = films.id
ORDER BY films.title;

-- Assignment 13: Many-to-Many Relationships
-- Question 6: Write SQL statements to insert data for the following films into the database

INSERT INTO films
(title, year, genre, duration) VALUES
('Fargo', 1996, 'comedy', 98),
('No Country for Old Men', 2007, 'western', 122),
('Sin City', 2005, 'crime', 124),
('Spy Kids', 2001, 'scifi', 88);

INSERT INTO directors
(name) VALUES
('Joel Coen'),
('Ethan Coen'),
('Frank Miller'),
('Robert Rodriguez');

INSERT INTO directors_films
(film_id, director_id) VALUES
(11, 9),
(12, 9),
(12, 10),
(13, 11),
(13, 12),
(14, 12);

-- Assignment 13: Many-to-Many Relationships
-- Question 7: Write a SQL statement that determines how many films each director in the database has directed. Sort the results by number of films (greatest first) and then name (in alphabetical order).

SELECT d.name AS director, COUNT(df.film_id) AS films
FROM directors AS d
  JOIN directors_films AS df ON d.id = df.director_id
GROUP BY d.name
ORDER BY films DESC, director;