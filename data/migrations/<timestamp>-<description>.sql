-- create a second table in the database named authors
CREATE TABLE AUTHORS (id SERIAL PRIMARY KEY, name VARCHAR(255));

--  subquery to retrieve unique author values from the books table and insert each one into the authors table in the name
INSERT INTO authors(name) SELECT DISTINCT author FROM books;

-- Try this and you will see The number should be greater than zero.
SELECT COUNT(*) FROM authors;

--  add a column in the books table named author_id
ALTER TABLE books ADD COLUMN author_id INT;

-- prepare a connection between the two tables
UPDATE books SET author_id=author.id FROM (SELECT * FROM authors) AS author WHERE books.author = author.name;

-- try this and the result should display a column containing the unique ids for the authors
SELECT author_id FROM books;

-- modify the books table by removing the column named author
ALTER TABLE books DROP COLUMN author;

-- modify the data type of the author_id in the books table, setting it as a foreign key which references the primary key in the authors table.
ALTER TABLE books ADD CONSTRAINT fk_authors FOREIGN KEY (author_id) REFERENCES authors(id);