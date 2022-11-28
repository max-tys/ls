-- 1) SET UP DATABASE
-- Create a database to store information and tables related to this workshop.

CREATE TABLE devices (
  id serial PRIMARY KEY,
  name text NOT NULL,
  created_at timestamp DEFAULT NOW()
);

CREATE TABLE parts (
  id serial PRIMARY KEY,
  part_number integer UNIQUE NOT NULL,
  device_id integer NOT NULL REFERENCES devices(id) 
);

-- 2) INSERT DATA FOR PARTS AND DEVICES
-- Now that we have the infrastructure for our workshop set up, let's start adding in some data. Add in two different devices. One should be named, "Accelerometer". The other should be named, "Gyroscope".

INSERT INTO devices
VALUES
(DEFAULT, 'Accelerometer', DEFAULT),
(DEFAULT, 'Gyroscope', DEFAULT);

INSERT INTO parts
VALUES
(DEFAULT, TRUNC(RANDOM() * 9999 + 1), 1),
(DEFAULT, TRUNC(RANDOM() * 9999 + 1), 1),
(DEFAULT, TRUNC(RANDOM() * 9999 + 1), 1);

INSERT INTO parts
VALUES
(DEFAULT, TRUNC(RANDOM() * 9999 + 1), 2),
(DEFAULT, TRUNC(RANDOM() * 9999 + 1), 2),
(DEFAULT, TRUNC(RANDOM() * 9999 + 1), 2),
(DEFAULT, TRUNC(RANDOM() * 9999 + 1), 2),
(DEFAULT, TRUNC(RANDOM() * 9999 + 1), 2);

INSERT INTO parts
(part_number)
VALUES
(TRUNC(RANDOM() * 9999 + 1)),
(TRUNC(RANDOM() * 9999 + 1)),
(TRUNC(RANDOM() * 9999 + 1));
