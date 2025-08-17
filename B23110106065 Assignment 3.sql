-- Name: Syed Ali Sultan
-- Seat No: B23110106065

-- Create Table Departments
CREATE TABLE departments(
dept_id SERIAL PRIMARY KEY,
dept_name VARCHAR(100) NOT NULL,
location VARCHAR(100) NOT NULL
);

-- Create Table Employees
CREATE TABLE employees(
emp_id SERIAL PRIMARY KEY,
emp_name VARCHAR(100) NOT NULL,
salary NUMERIC DEFAULT 50000,
dept_id INT,
hire_date DATE DEFAULT CURRENT_DATE,
FOREIGN KEY (dept_id) REFERENCES departments (dept_id)
);

-- Create Table Projects
CREATE TABLE Projects(
project_id SERIAL PRIMARY KEY,
project_name VARCHAR(100) NOT NULL,
budget NUMERIC(12,2),
start_date DATE,
end_date DATE
);

-- Create Table Employee_Projects
CREATE TABLE employee_projects(
emp_id INT NOT NULL,
project_id INT NOT NULL,
hours_worked NUMERIC,
PRIMARY KEY (emp_id, project_id),
FOREIGN KEY (emp_id) REFERENCES Employees (emp_id),
FOREIGN KEY (project_id) REFERENCES Projects (project_id)
);

--Insert Values In Departments Table
INSERT INTO departments (dept_name, location) VALUES
('Human Resources', 'Karachi'),
('Finance', 'Lahore'),
('IT', 'Islamabad'),
('Marketing', 'Karachi'),
('Research', 'Faisalabad'),
('Management','Lahore');

--Insert Values In Employees Table
INSERT INTO employees (emp_name, salary, dept_id, hire_date) VALUES
('Ali Sultan', 80000, 1, '2023-02-15'),
('Neha Rehan', 80000, 2, '2022-07-10'),
('Bilal Ahmed', 70000, 3, '2021-11-20'),
('Ayesha Ehtisham', 60000, 4, '2023-05-05'),
('Omar Farooq', 60000, 3, '2020-08-18'),
('Farheen Arshad', 75000, 1, '2021-01-22'),
('Faisal Qureshi', 48000, NULL, '2022-04-30'),
('Abdullah Imran', 65000, 2, '2021-09-09'),
('Usman Ali', 50000, NULL, '2023-01-01'),  
('Mustafa Akhlaq', 62000, 4, '2022-02-17'),
('Hamza Iqbal', 58000, 3, '2020-12-12'),
('Farah Javed', 49000, 5, '2023-03-19'),
('Ahmed Raza', 53000, 1, '2021-10-10'),
('Mariam Sheikh', 56000, 2, '2022-11-25'),
('Hamza Khan', 60000, NULL, '2023-07-07'),
('Muhammad Ahsan', 55000, 5,'2025-03-12');

--Insert Values In Projects Table
INSERT INTO projects (project_name, budget, start_date, end_date) VALUES
('ERP System Upgrade', 200000.00, '2023-01-01', '2023-12-31'),
('Marketing Campaign', 150000.00, '2023-03-01', '2023-09-30'),
('AI Research', 300000.00, '2022-06-01', '2024-06-01'),
('Financial Audit', 100000.00, '2023-04-01', '2023-08-31'),
('HR Training Program', 80000.00, '2023-05-15', '2023-07-15'),
('Mobile App Development', 250000.00, '2023-02-10', '2024-01-20'),
('Data Migration', 120000.00, '2023-06-01', '2023-10-15'),
('Cybersecurity Enhancement', 180000.00, '2023-07-01', '2023-12-01'),
('Customer Analytics', 220000.00, '2022-11-15', '2023-11-15'),
('Website Redesign', 140000.00, '2023-03-20', '2023-08-20');

--Insert Values In Employee_Projects Table
INSERT INTO employee_projects (emp_id, project_id, hours_worked) VALUES
(1, 3, 120),
(2, 3, 130),
(3, 1, 150),
(4, 2, 60),
(5, 6, 200),
(6, 5, 40),
(7, 4, 110),
(8, 4, 75),
(10, 2, 95),
(11, 1, 160),
(12, 5, 50),
(13, 6, 130),
(14, 7, 145),
(15, 8, 100),
(9, 9, 85);

-----------------------
-- Part 1: Basic Joins
-----------------------

-- Write a query to display all employees along with their department names (include employees without departments).
SELECT e.emp_id, e.emp_name, d.dept_name FROM employees e
LEFT JOIN departments d on e.dept_id = d.dept_id;

-- Write a query to show all departments and their employees (include departments without employees).
SELECT d.dept_id, d.dept_name, e.emp_name FROM departments d
LEFT JOIN employees e on e.dept_id = d.dept_id;

-- Write a query to find employees who are not assigned to any department.
SELECT e.emp_id, e.emp_name, d.dept_name FROM employees e
LEFT JOIN departments d on e.dept_id = d.dept_id
WHERE d.dept_name IS NULL ;

-------------------------
-- Part 2: Complex Joins
-------------------------

-- Write a query to display all projects with the names of employees working on them (include projects with no 
-- employees assigned).
SELECT p.project_id, p.project_name, e.emp_name FROM projects p
LEFT JOIN employee_projects ep ON p.project_id = ep.project_id
LEFT JOIN employees e ON  ep.emp_id = e.emp_id;


-- Write a query to calculate the total hours worked per department (include departments with no hours worked).
SELECT d.dept_id, d.dept_name, COALESCE(SUM(ep.hours_worked),0) AS hours_worked FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id
LEFT JOIN employee_projects ep ON e.emp_id = ep.emp_id
GROUP BY d.dept_id, d.dept_name
ORDER BY d.dept_id;

-- Write a query to find employees who aren't working on any projects.
SELECT e.emp_id, e.emp_name, p.project_name FROM employees e
LEFT JOIN employee_projects ep ON e.emp_id = ep.emp_id
LEFT JOIN projects p ON ep.project_id = p.project_id
WHERE project_name IS NULL;


