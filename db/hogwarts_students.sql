DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS houses;


CREATE TABLE houses(
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  image_url VARCHAR
);


CREATE TABLE students(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR,
  last_name VARCHAR,
  age INT,
  house_id INT REFERENCES houses(id)
);
