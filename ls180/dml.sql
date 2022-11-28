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

-- 3) INNER JOIN
-- Write an SQL query to display all devices along with all the parts that make them up. We only want to display the name of the devices. Its parts should only display the part_number.

SELECT name, part_number
FROM devices
JOIN parts ON parts.device_id = devices.id;

-- 4) SELECT PART_NUMBER
-- We want to grab all parts that have a part_number that starts with 3. Write a SELECT query to get this information. This table may show all attributes of the parts table.

SELECT * FROM parts WHERE CAST(part_number AS TEXT) LIKE '3%';

-- 5) AGGREGATE FUNCTIONS
-- Write an SQL query that returns a result table with the name of each device in our database together with the number of parts for that device.

SELECT devices.name, COUNT(parts.id) FROM devices 
JOIN parts ON devices.id = parts.device_id
GROUP BY devices.name;

-- 6) ORDER BY
-- we want to guarantee that the devices and the count of their parts are listed in descending alphabetical order

SELECT devices.name AS name, COUNT(parts.id) FROM devices
  JOIN parts ON devices.id = parts.device_id
 GROUP BY name
 ORDER BY name DESC;

-- 7) IS NULL AND IS NOT NULL
-- Write two SQL queries:
  -- One that generates a listing of parts that currently belong to a device.
  -- One that generates a listing of parts that don't belong to a device.
SELECT part_number, device_id
  FROM parts
 WHERE device_id IS NOT NULL;

SELECT part_number, device_id
  FROM parts
 WHERE device_id IS NULL;

-- 8) OLDEST DEVICE
-- Insert one more device into the devices table.
-- Assuming nothing about the existing order of the records in the database, write an SQL statement that will return the name of the oldest device from our devices table.

INSERT INTO devices (name) VALUES ('Magnetometer');
INSERT INTO parts VALUES (DEFAULT, TRUNC(RANDOM() * 9999 + 1), 3);

SELECT name AS oldest_device
  FROM devices
 ORDER BY created_at ASC
 LIMIT 1;

-- 9) UPDATE DEVICE_ID
-- We've realized that the last two parts we're using for device number 2, "Gyroscope", actually belong to an "Accelerometer". 
-- Write an SQL statement that will associate the last two parts from our parts table with an "Accelerometer" instead of a "Gyroscope".
-- What if we wanted to set the part with the smallest part_number to be associated with "Gyroscope"? How would we go about doing that?

UPDATE parts
   SET device_id = 1
 WHERE id = 7 OR id = 8;

UPDATE parts
   SET device_id = (
       SELECT id
         FROM devices
        WHERE name = 'Gyroscope'
   )
 WHERE part_number = (
       SELECT part_number 
         FROM parts
        ORDER BY part_number
        LIMIT 1
  );

-- 10) DELETE ACCELEROMETER
-- Our workshop has decided to not make an Accelerometer after all. 
-- Delete any data related to "Accelerometer", this includes the parts associated with an Accelerometer.

DELETE FROM parts
 WHERE device_id = (
       SELECT id
         FROM devices
        WHERE name = 'Accelerometer'
 );

DELETE FROM devices
 WHERE name = 'Accelerometer';