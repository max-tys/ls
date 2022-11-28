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

