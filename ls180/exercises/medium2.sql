-- #################################
-- ## Medium: Subqueries and more ##
-- #################################

-- 1. Set Up Database
-- After creating the database, set up the 3 tables using the following specifications:

createdb auction

CREATE TABLE bidders (
  id serial PRIMARY KEY,
  name text NOT NULL
);

CREATE TABLE items (
  id serial PRIMARY KEY,
  name text NOT NULL,
  initial_price numeric(6,2) NOT NULL,
  sales_price numeric(6,2)
);

ALTER TABLE items
ADD CONSTRAINT check_initial_price CHECK (initial_price BETWEEN 0.01 AND 1000.00),
ADD CONSTRAINT check_sales_price CHECK (sales_price BETWEEN 0.01 AND 1000.00);

CREATE TABLE bids (
  id serial PRIMARY KEY,
  bidder_id integer NOT NULL REFERENCES bidders(id) ON DELETE CASCADE,
  item_id integer NOT NULL REFERENCES items(id) ON DELETE CASCADE,
  amount numeric(6,2) NOT NULL
);

ALTER TABLE bids
ADD CONSTRAINT check_amount CHECK (amount BETWEEN 0.01 AND 1000.00);

CREATE INDEX ON bids (bidder_id, item_id);

\copy bidders FROM './csv/bidders.csv' csv header;
\copy items FROM './csv/items.csv' csv header;
\copy bids FROM './csv/bids.csv' csv header;

-- 2) Conditional Subqueries: IN
-- Write a SQL query that shows all items that have had bids put on them. Use the logical operator IN for this exercise, as well as a subquery.

SELECT DISTINCT i.name AS "Bid on Items"
FROM items AS i
JOIN bids AS b ON i.id = b.item_id;

SELECT name AS "Bid on Items"
  FROM items
 WHERE id IN (
       SELECT DISTINCT item_id 
       FROM bids
 );

-- 3) Conditional Subqueries: NOT IN
-- Write a SQL query that shows all items that have not had bids put on them. Use the logical operator NOT IN for this exercise, as well as a subquery.

SELECT name AS "Not Bid On"
  FROM items
 WHERE id NOT IN (
       SELECT DISTINCT item_id 
       FROM bids
 );

-- 4) Conditional Subqueries: EXISTS
-- Write a SELECT query that returns a list of names of everyone who has bid in the auction. While it is possible (and perhaps easier) to do this with a JOIN clause, we're going to do things differently: use a subquery with the EXISTS clause instead. Here is the expected output:

SELECT name
  FROM bidders
 WHERE EXISTS
       (SELECT 1 
          FROM bids
         WHERE bids.bidder_id = bidders.id
       );

SELECT DISTINCT bidders.name
  FROM bidders
  JOIN bids ON bids.bidder_id = bidders.id;

-- 5) Query From a Transient Table
-- Write an SQL query that finds the largest number of bids from an individual bidder.

SELECT MAX(bid_counts.count) FROM (
       SELECT COUNT(bids.id)
         FROM bidders
         JOIN bids ON bids.bidder_id = bidders.id
        GROUP BY bidders.name) AS bid_counts;

-- 6) Scalar Subqueries
-- For this exercise, use a scalar subquery to determine the number of bids on each item. 
-- The entire query should return a table that has the name of each item along with the number of bids on an item.

SELECT items.name, COUNT(bids.id)
  FROM items
  LEFT JOIN bids ON bids.item_id = items.id
 GROUP BY items.name;

SELECT items.name, 
       (SELECT COUNT(bids.item_id) 
          FROM bids
         WHERE items.id = bids.item_id)
FROM items;

-- 7) Row Comparison
-- We want to check that a given item is in our database. There is one problem though: we have all of the data for the item, but we don't know the id number. Write an SQL query that will display the id for the item that matches all of the data that we know, but does not use the AND keyword. Here is the data we know:

SELECT id FROM items
 WHERE name = 'Painting';

SELECT id 
  FROM items
 WHERE ('Painting', 100.00, 250.00) = (name, initial_price, sales_price);

-- 8) Explain
-- For this exercise, let's explore the EXPLAIN PostgreSQL statement. It's a very useful SQL statement that lets us analyze the efficiency of our SQL statements. More specifically, use EXPLAIN to check the efficiency of the query statement we used in the exercise on EXISTS:

EXPLAIN SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);

EXPLAIN ANALYZE SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);

-- 9) Comparing SQL statements
-- In this exercise, we'll use EXPLAIN ANALYZE to compare the efficiency of two SQL statements. These two statements are actually from the "Query From a Virtual Table" exercise in this set. 

EXPLAIN ANALYZE SELECT MAX(bid_counts.count) FROM
  (SELECT COUNT(bidder_id) FROM bids GROUP BY bidder_id) AS bid_counts;

EXPLAIN ANALYZE
  SELECT COUNT(bidder_id) AS max_bid FROM bids
  GROUP BY bidder_id
  ORDER BY max_bid DESC
  LIMIT 1;

EXPLAIN ANALYZE SELECT name,
(SELECT COUNT(item_id) FROM bids WHERE item_id = items.id)
FROM items;

EXPLAIN ANALYZE SELECT items.name, COUNT(bids.id)
  FROM items
  LEFT JOIN bids ON bids.item_id = items.id
 GROUP BY items.name;