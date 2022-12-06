CREATE TABLE lists (
  id    serial  PRIMARY KEY,
  name  text    NOT NULL UNIQUE
);

CREATE TABLE todos (
  id        serial  PRIMARY KEY,
  name      text    NOT NULL,
  completed boolean NOT NULL DEFAULT 'false',
  list_id   integer NOT NULL REFERENCES lists(id)
);

INSERT INTO lists (name)
VALUES ('Homework'), ('Groceries');

INSERT INTO todos (name, list_id)
VALUES ('Math', 1), ('Science', 1);

INSERT INTO todos (name, list_id, completed)
VALUES ('Chinese', 1, 't');

INSERT INTO todos (name, list_id)
VALUES ('Chicken', 2), ('Tomatoes', 2);