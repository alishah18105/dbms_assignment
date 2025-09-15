CREATE TABLE Student_Admission(
student_id SERIAL Primary Key,
student_name VARCHAR(50),
age INT NOT NULL
);

CREATE TABLE Bank_Accounts(
account_id SERIAL Primary Key,
account_title VARCHAR(50) NOT NULL,
balance NUMERIC DEFAULT 0
);

INSERT INTO Bank_Accounts(account_title,balance)
VALUES
('Ali Sultan', 55000),
('Neha Rehan', 51000),
('Abdullah Imran', 45000);

CREATE TABLE Orders(
order_id SERIAL Primary Key,
customer_name VARCHAR(50) NOT NULL,
payment NUMERIC NOT NULL
);

CREATE TABLE Payment(
payment_id SERIAL Primary Key,
order_id INT References Orders(order_id),
status VARCHAR(10) DEFAULT 'Pending'
);
--------------------------------------------------------------------------------------------
-- Q1: Student Admission Rollback
-- Start a transaction.
-- Insert a new student into the students table (Ali, 20).
-- Then insert another student but make a mistake (use a wrong column name).
-- Finally, use ROLLBACK so that both inserts are canceled.

BEGIN;
INSERT INTO Student_Admission(student_name, age)
VALUES
('Ali',20);

INSERT INTO Student_Admission(student_name, agee)
VALUES
('Ali',20);

ROLLBACK;
--------------------------------------------------------------------------------------------
-- Q2: Successful Admission Commit
-- Start a transaction.
-- Insert two students into the students table: Sara (21) and Usman (22).
-- Commit the transaction so that both entries are saved.

BEGIN;
Insert INTO Student_admission(student_name,age)
VALUES ('Ali',20);

INSERT INTO student_admission(student_name,age)
VALUES ('Neha',19);

Commit;
--------------------------------------------------------------------------------------------
-- Q3: Bank Transfer with Rollback
-- In the accounts table, deduct Rs. 1000 from Account ID=1.
-- Add Rs. 1000 to Account ID=2.
-- But in the second query, deliberately use a wrong account id.
-- Rollback the transaction so that both updates are canceled.

BEGIN;

UPDATE BANK_Accounts
SET balance = balance - 2000
WHERE account_id = 1;

UPDATE BANK_Accounts
SET balance = balance + 2000
WHERE account_id = 4;

Rollback;
--------------------------------------------------------------------------------------------
-- Q4: Bank Transfer with SAVEPOINT
-- Start a transaction.
-- Deduct Rs. 2000 from Account ID=1.
-- Create a savepoint.
-- Try to add Rs. 2000 to Account ID=999 (wrong id).
-- Rollback to the savepoint (so only the wrong query is canceled).
-- Now correctly add Rs. 2000 to Account ID=2.
-- Commit the transaction.

BEGIN;
UPDATE Bank_Accounts 
SET balance = balance - 2000
WHERE account_id =1;

SAVEPOINT sp1;

UPDATE Bank_Accounts
SET balance = balance + 2000
WHERE account_id = 10;

ROLLBACK TO sp1;

UPDATE Bank_ACcounts
SET balance = balance + 2000
WHERE account_id = 2;

COMMIT;
-------------------------------------------------------------------------------------------
-- Q5: Online Shopping Transaction
-- Socho ek orders table hai:
-- Ek transaction start karo.
-- Ek naya order insert karo (order_id=101, customer='Hamza', amount=5000).
-- Phir payments table mein payment insert karo (order_id=101, status='Paid').
-- Agar payment query galti se fail ho jaye, poora transaction rollback karo.

BEGIN;

INSERT INTO orders(customer_name,payment)
VALUES ('Ali',5000);

INSERT INTO payment(order_id,status)
VALUES ('1','paid');

ROLLBACK;



