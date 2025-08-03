-- SYED ALI SULTAN
-- B23110106065

-- Task 1 CREATE A Database named library_db
CREATE DATABASE library_db;

-- Task 2 Create a Table Of Books
CREATE TABLE books(
book_id SERIAL PRIMARY KEY,
title VARCHAR(100) NOT NULL,
author VARCHAR(100) NOT NULL,
year_published INT NOT NULL,
isAvailable BOOLEAN Not Null,
price NUmeric NOT NULL,
publication VARCHAR(100) DEFAULT 'XYZ'
);

-- Insert 15 Sample Books In A Table
INSERT INTO books(title,author,year_published,isAvailable,price,publication)
VALUES
('The Time Machine', 'H.G. Wells', 1895, TRUE, 750, 'XYZ'),
('1984', 'George Orwell', 1949, FALSE, 620, 'XYZ'),
('Frankenstein', 'Mary Shelley', 1818, TRUE, 540, 'XYZ'),
('Animal Farm', 'George Orwell', 1945, TRUE, 350, 'Penguin'),
('The Old Man and the Sea', 'Ernest Hemingway', 1952, TRUE, 450, 'Scribner'),
('Of Mice and Men', 'John Steinbeck', 1937, FALSE, 300, 'Vintage'),
('Siddhartha', 'Hermann Hesse', 1922, TRUE, 490, 'Penguin'),
('To Kill a Mockingbird', 'Harper Lee', 1960, TRUE, 800, 'J.B. Lippincott & Co.'),
('Pride and Prejudice', 'Jane Austen', 1813, TRUE, 900, 'Modern Library'),
('The Hobbit', 'J.R.R. Tolkien', 1937, FALSE, 950, 'George Allen & Unwin'),
('War and Peace', 'Leo Tolstoy', 1869, TRUE, 1500, 'Oxford'),
('Ulysses', 'James Joyce', 1922, FALSE, 1350, 'Shakespeare and Company'),
('Don Quixote', 'Miguel de Cervantes', 1605, TRUE, 1200, 'Penguin Classics'),
('The Midnight Library', 'Matt Haig', 2020, TRUE, 1100, 'Canongate'),
('Atomic Habits', 'James Clear', 2018, TRUE, 999, 'Avery');

--Task 3 Select all books published after 2000
SELECT * FROM Books WHERE year_published > 2000;

--Task 4 Select books with a price less than 599.00, ordered by price in descending order
SELECT * FROM Books WHERE price < 599.00 
ORDER BY price DESC;

--Task 5 Select the top 3 most expensive books
SELECT * FROM Books 
ORDER BY PRICE DESC
LIMIT 3;

--TASK 6 Select 2 books, skipping the first 2, ordered by publication_year in descending order
SELECT * FROM Books 
ORDER BY year_published DESC
OFFSET 2
LIMIT 2;

--Task 7 Select all books of the publication “XYZ” ordered alphabetically by title
SELECT * FROM Books
WHERE publication = 'XYZ'
ORDER BY title;


