-- ##########################
-- ## Medium: Many to Many ##
-- ##########################

-- 1. Set Up Database
-- Enter some data in the join table that shows which services each customer uses

CREATE TABLE customers (
  id serial PRIMARY KEY,
  name text NOT NULL,
  payment_token char(8) UNIQUE NOT NULL,
  CHECK (payment_token ~ '^[A-Z]{8}$')
);

CREATE TABLE services(
  id serial PRIMARY KEY,
  description text NOT NULL,
  price numeric(10, 2) NOT NULL,
  CHECK (price >= 0.00)
);

INSERT INTO customers
(name, payment_token) VALUES
('Pat Johnson', 'XHGOAHEQ'),
('Nancy Monreal', 'JKWQPJKL'),
('Lynn Blake', 'KLZXWEEE'),
('Chen Ke-Hua', 'KWETYCVX'),
('Scott Lakso', 'UUEAPQPS'),
('Jim Pornot', 'XKJEYAZA');

INSERT INTO services
(description, price) VALUES
('Unix Hosting', 5.95),
('DNS', 4.95),
('Whois Registration', 1.95),
('High Bandwidth', 15.00),
('Business Support', 250.00),
('Dedicated Hosting', 50.00),
('Bulk Email', 250.00),
('One-to-one Training', 999.00);

CREATE TABLE customers_services (
  id serial PRIMARY KEY,
  customer_id integer REFERENCES customers(id) ON DELETE CASCADE NOT NULL,
  service_id integer REFERENCES services(id) NOT NULL,
  UNIQUE (customer_id, service_id)
);

INSERT INTO customers_services
(customer_id, service_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(4, 1),
(4, 4),
(5, 1),
(5, 2),
(5, 6),
(6, 1),
(6, 6),
(6, 7);

-- 2. Write a query to retrieve the customer data for every customer who currently subscribes to at least one service.

SELECT DISTINCT c.*
FROM customers AS c
JOIN customers_services AS cs ON c.id = cs.customer_id;

-- 3. Write a query to retrieve the customer data for every customer who does not currently subscribe to any services.

SELECT c.*
FROM customers AS c
  LEFT OUTER JOIN customers_services AS cs ON c.id = cs.customer_id
WHERE customer_id IS NULL;

-- 3. Further Exploration
-- Can you write a query that displays all customers with no services and all services that currently don't have any customers? The output should look like this:

SELECT c.*, s.*
FROM customers AS c
  FULL JOIN customers_services AS cs ON c.id = cs.customer_id
  FULL JOIN services AS s ON s.id = cs.service_id
WHERE cs.service_id IS NULL OR
      cs.customer_id IS NULL;

-- 4. Get Services With No Customers
-- Using RIGHT OUTER JOIN, write a query to display a list of all services that are not currently in use. Your output should look like this:

SELECT s.description
FROM customers_services AS cs
  RIGHT OUTER JOIN services AS s ON cs.service_id = s.id
WHERE cs.service_id IS NULL;

-- 5. Services for each Customer
-- Write a query to display a list of all customer names together with a comma-separated list of the services they use. Your output should look like this:

SELECT c.name, STRING_AGG(s.description, ', ') AS services
FROM customers AS c
  LEFT OUTER JOIN customers_services AS cs ON c.id = cs.customer_id
  LEFT OUTER JOIN services AS s ON s.id = cs.service_id
GROUP BY c.id
ORDER BY c.id;

-- 5. Further Exploration
-- Can you modify the above command so the output looks like this?

SELECT CASE LAG(c.name) OVER (ORDER BY c.name)
            WHEN c.name THEN ''
            ELSE c.name
       END,
       s.description
FROM customers AS c
LEFT OUTER JOIN customers_services
             ON customer_id = c.id
LEFT OUTER JOIN services AS s
             ON s.id = service_id;

-- 6) Services with at least 3 customers
-- Write a query that displays the description for every service that is subscribed to by at least 3 customers. Include the customer count for each description in the report. The report should look like this:

SELECT s.description, COUNT(cs.customer_id)
  FROM customers_services AS cs 
  JOIN services AS s ON cs.service_id = s.id
 GROUP BY s.description
HAVING COUNT(cs.customer_id) >= 3;

-- 7) Total gross income
-- Assuming that everybody in our database has a bill coming due, and that all of them will pay on time, write a query to compute the total gross income we expect to receive.

SELECT SUM(subtotal) AS gross FROM (
       SELECT COUNT(cs.service_id) * s.price AS subtotal
         FROM customers_services AS cs
         JOIN services AS s ON cs.service_id = s.id
        GROUP BY s.price) X;

-- 8) Add new customer
-- A new customer, 'John Doe', has signed up with our company. His payment token is 'EYODHLCN'. Initially, he has signed up for UNIX hosting, DNS, and Whois Registration. Create any SQL statement(s) needed to add this record to the database.

INSERT INTO customers
(name, payment_token) VALUES
('John Doe', 'EYODHLCN');

INSERT INTO customers_services
(customer_id, service_id) VALUES
(7, 1),
(7, 2),
(7, 3);

-- 9) Hypothetically
-- The company president is looking to increase revenue. As a prelude to his decision making, he asks for two numbers: the amount of expected income from "big ticket" services (those services that cost more than $100) and the maximum income the company could achieve if it managed to convince all of its customers to select all of the company's big ticket items.

SELECT SUM(price) 
  FROM customers_services AS cs
  JOIN services AS s ON cs.service_id = s.id
 WHERE price > 100;

SELECT price
FROM customers
CROSS JOIN services
WHERE price > 100;

-- 10) Deleting Rows
-- Write the necessary SQL statements to delete the "Bulk Email" service and customer "Chen Ke-Hua" from the database.

DELETE FROM customers_services
 WHERE service_id = (
       SELECT id
         FROM services
        WHERE description = 'Bulk Email'
 );

DELETE FROM services 
 WHERE description = 'Bulk Email';

DELETE FROM customers_services
 WHERE customer_id = (
       SELECT id
         FROM customers
        WHERE name = 'Chen Ke-Hua'
 );

DELETE FROM customers
 WHERE name = 'Chen Ke-Hua';
