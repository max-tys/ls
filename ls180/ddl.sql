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

