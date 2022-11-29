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

-- Conditional Subqueries: IN
-- Write a SQL query that shows all items that have had bids put on them. Use the logical operator IN for this exercise, as well as a subquery.
-- Continue from here...
