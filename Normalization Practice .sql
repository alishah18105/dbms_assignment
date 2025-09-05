-- CREATE LIBRARY RAW TABLE (UnNormalized Form)

CREATE TABLE LibraryRaw (
    BookID INT,
    BookName VARCHAR(100),
    Author VARCHAR(200),
    BorrowID INT,
    BorrowName VARCHAR(100),
    BorrowDate DATE,
    LibrarianID INT,
    LibrarianName VARCHAR(100)
);

-- INSERT DATA IN LIBRARY RAW TABLE

INSERT INTO LibraryRaw (BookID, BookName, Author, BorrowID, BorrowName, BorrowDate, LibrarianID, LibrarianName)
VALUES
(1, 'Database Systems', 'C. J. Date, Hector Garcia', 1, 'Syed Ali Sultan', '2025-12-11', 01, 'Sarah Khan'),
(2, 'Object Oriented Prog.', 'Bjarne Stroustrup, James Gosling', 2, 'Neha Rehan', '2025-12-13', 02, 'Ahmed Raza'),
(1, 'Database Systems', 'Hector Garcia, Navathe', 3, 'Bilal Hussain', '2025-12-14', 01, 'Sarah Khan'),
(3, 'Operating System Concepts', 'Abraham Silberschatz, Peter Galvin', 4, 'Usama Ahmed', '2025-12-15', 03, 'Mariam Iqbal'),
(4, 'Computer Networks', 'Andrew Tanenbaum, David Wetherall', 5, 'Mustafa Akhlaq', '2025-12-16', 02, 'Ahmed Raza'),
(5, 'Artificial Intelligence', 'Stuart Russell, Peter Norvig', 6, 'Abdullah Imran', '2025-12-17', 03, 'Mariam Iqbal'),
(6, 'Data Mining Concepts', 'Jiawei Han, Micheline Kamber', 7, 'Sana Khalid', '2025-12-18', 01, 'Sarah Khan');


-- CREATE BOOK TABLE
CREATE TABLE BOOK(
book_id SERIAL UNIQUE PRIMARY KEY,
book_name VARCHAR(100)
);

-- CREATE AUTHOR TABLE
CREATE TABLE Author(
author_id SERIAL UNIQUE PRIMARY KEY,
author_name VARCHAR(100) NOT NULL
);

-- CREATE BORROW TABLE
CREATE TABLE Borrow(
borrow_id SERIAL UNIQUE PRIMARY KEY,
borrow_name VARCHAR(100)
);

-- CREATE LIBRARIAN TABLE 
CREATE TABLE Librarian(
librarian_id SERIAL PRIMARY KEY,
librarian_name VARCHAR(100)
);

-- CREATE BOOK DETAILS TABLE
CREATE TABLE Book_Details(
book_id INT REFERENCES BOOK(book_id),
author_id INT REFERENCES AUTHOR(author_id),
PRIMARY KEY (book_id, author_id)
);

-- CREATE TABLE LIBRARY NORMALIZE (Normalize Form)
CREATE TABLE LibraryNormalize(
transaction_record SERIAL PRIMARY KEY,
book_id INT REFERENCES BOOK(book_id),
borrow_id INT REFERENCES BORROW(borrow_id),
borrow_date DATE,
librarian_id INT REFERENCES LIBRARIAN(librarian_id)
);

-- INSERT DATA IN BOOK TABLE
INSERT INTO BOOK(book_name)
VALUES
('Database Systems'),
('Object Oriented Prog'),
('Operating System Concepts'),
('Computer Networks'),
('Artifical Intelligence'),
('Data Mining Concepts');

-- INSERT DATA IN AUTHOR TABLE
INSERT INTO AUTHOR(author_name)
VALUES
('C. J. Date'),
('Hector Garcia'),
('Bjarne Stroustrup'),
('James Gosling'),
('Garcia Navathe'),
('Abraham Silberschatz'),
('Peter Galvin'),
('David Wetherall'),
('Stuart Russell'),
('Peter Norvig'),
('Jiawei Han'),
('Andrew Tanenbaum'),
('Micheline Kamber');

-- INSERT DATA IN BORROW TABLE 

INSERT INTO BORROW(borrow_name)
VALUES
('Syed Ali Sultan'),
('Neha Rehan'),
('Bilal Hussain'),
('Usama Ahmed'),
('Mustafa Akhlaq'),
('Abdullah Imran'),
('Sana Khalid');

-- INSERT DATA IN LIBRARIAN TABLE 

INSERT INTO LIBRARIAN(librarian_name)
VALUES
('Sarah Khan'),
('Mariam Iqbal'),
('Ahmed Raza');

-- INSERT DATA IN BOOK_DETAILS TABLE 

INSERT INTO Book_Details(book_id,author_id)
VALUES
(1,1),(1,2),(1,5),(2,3),(2,4),(3,6),(3,7),(4,12),(4,8),(5,9),(5,10),(6,11),(6,13);


-- INSERT DATA IN LIBRARY NORMALIZE TABLE
INSERT INTO LibraryNormalize(book_id, borrow_id, borrow_date, librarian_id)
VALUES
(1,1,'2025-12-11',1),
(2,2,'2025-12-13',3),
(1,3,'2025-12-14',1),
(3,4,'2025-12-15',2),
(4,5,'2025-12-16',3),
(5,6,'2025-12-17',2),
(6,7,'2025-12-18',1);

-- To View Record With Author Name, Borrow name, Librarian Name etc...

SELECT lbn.transaction_record, b.book_name, STRING_AGG(a.author_name, ', ') AS authors, br.borrow_name, lbn.borrow_date, l.librarian_name FROM LibraryNormalize lbn
JOIN Book b ON lbn.book_id = b.book_id
JOIN Book_Details bd ON b.book_id = bd.book_id
JOIN Author a ON bd.author_id = a.author_id
JOIN Borrow br ON lbn.borrow_id = br.borrow_id
JOIN Librarian l ON lbn.librarian_id = l.librarian_id
GROUP BY lbn.transaction_record, b.book_name, br.borrow_name, lbn.borrow_date, l.librarian_name;



SELECT * FROM LibraryRaw; -- To See Unnormalize Table

SELECT * FROM LibraryNormalize; -- to See Normalize Table



