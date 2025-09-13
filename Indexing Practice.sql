-- Indexing Practice

-- Creating Table Student_Admission: 

CREATE TABLE Student_Admission(
student_id SERIAL Primary Key,
student_name VARCHAR(50) NOT NULL,
age INT NOT NULL
);

-- Inserting Two Values in Student_Admission Table:

INSERT INTO Student_Admission(student_name,age)
VALUES

('Ali Sultan', 20),
('Neha Rehan', 20);

-- Now Inserting Dummy Data 3 - 100000 for index search

INSERT INTO Student_Admission(student_name, age)
SELECT
    'Student_' || g,		   -- Student_03
    (random() * 7 + 18)::INT   -- 18 to 24
FROM generate_series(3, 100000) g;

-- Creating Index On Student_Name:
CREATE INDEX idx_students_name
ON Student_Admission(student_name);

-- SELECTING Student With Name 'Ali Sultan' From 100000 rows
EXPLAIN SELECT* FROM student_admission 
WHERE student_name = 'Ali Sultan';
