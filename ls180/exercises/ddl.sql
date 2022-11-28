-- 1) CREATE AN EXTRASOLAR PLANETARY DATABASE
-- create two tables in the database as follows:
-- stars table, planet table

CREATE TABLE stars (
  id serial PRIMARY KEY,
  name varchar(25) UNIQUE NOT NULL,
  distance integer NOT NULL,
  spectral_type char(1),
  companions integer NOT NULL,
  CHECK (distance > 0),
  CHECK (companions >= 0)
);

CREATE TABLE planets(
  id serial PRIMARY KEY,
  designation char(1) UNIQUE,
  mass integer
);

-- 2) RELATING STARS AND PLANETS
-- add a star_id column to the planets table; 
-- this column will be used to relate each planet in the planets table 
    -- to its home star in the stars table

ALTER TABLE planets
ADD COLUMN star_id integer NOT NULL REFERENCES stars(id);

-- 3) INCREASE STAR NAME LENGTH
ALTER TABLE stars
ALTER COLUMN name TYPE varchar(50);

-- 4) STELLAR DISTANCE PRECISION
-- Modify the distance column in the stars table so that it allows fractional light years to any degree of precision required.

ALTER TABLE stars
ALTER COLUMN distance TYPE float;

-- 5) CHECK VALUES IN LIST
-- Spectral_type column in the stars table should contain one of the following 7 values: 'O', 'B', 'A', 'F', 'G', 'K', and 'M'. 
-- Also, make sure that a value is required for this column.

ALTER TABLE stars
ALTER COLUMN spectral_type SET NOT NULL;

ALTER TABLE stars
ADD CONSTRAINT spectral_type_value CHECK (spectral_type = ANY ('{"O", "B", "A", "F", "G", "K", "M"}'));
  -- ADD CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M'));
  -- CHECK (spectral_type SIMILAR TO '(O|A|B|F|G|K|M)')

-- 6) ENUMERATED TYPES
-- Modify the stars table to remove the CHECK constraint on the spectral_type column, 
-- and then modify the spectral_type column so it becomes an enumerated type that restricts it to one of the following 7 values: 
-- 'O', 'B', 'A', 'F', 'G', 'K', and 'M'.

ALTER TABLE stars
DROP CONSTRAINT stars_spectral_type_check;

CREATE TYPE spectral_type AS ENUM ('O', 'B', 'A', 'F', 'G', 'K', 'M');

ALTER TABLE stars
ALTER COLUMN spectral_type TYPE spectral_type USING spectral_type::spectral_type;

-- 7) PLANETARY MASS PRECISION
-- Modify the mass column in the planets table so that it allows fractional masses to any degree of precision required. 
-- In addition, make sure the mass is required and positive.
-- While we're at it, also make the designation column required.

ALTER TABLE planets
ALTER COLUMN mass TYPE numeric,
ALTER COLUMN mass SET NOT NULL
ADD CONSTRAINT positive_mass CHECK (mass > 0),
ALTER COLUMN designation SET NOT NULL;

-- 8) SEMI-MAJOR AXIS COLUMN
-- Add a semi_major_axis column for the semi-major axis of each planet's orbit; the semi-major axis is the average distance from the planet's star as measured in astronomical units (1 AU is the average distance of the Earth from the Sun). Use a data type of numeric, and require that each planet have a value for the semi_major_axis.

ALTER TABLE planets
ADD COLUMN semi_major_axis numeric NOT NULL;

-- 9) ADD A MOONS TABLE
-- Someday in the future, technology will allow us to start observing the moons of extrasolar planets. At that point, we're going to need a moons table in our extrasolar database. For this exercise, your task is to add that table to the database. The table should include the following data:

CREATE TABLE moons (
  id serial PRIMARY KEY,
  designation integer NOT NULL CHECK (designation > 0),
  semi_major_axis numeric CHECK (semi_major_axis > 0),
  mass numeric CHECK (mass > 0),
  planet_id integer NOT NUll REFERENCES planets(id)
);

-- 10) DELETE THE DATABASE
DROP DATABASE extrasolar;