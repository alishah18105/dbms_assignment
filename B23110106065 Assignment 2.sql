-- Name: Syed Ali Sultan
-- Seat No: B23110106065

-- Create Table Customers
CREATE TABLE Customers(
customer_id SERIAL PRIMARY KEY,
customer_name VARCHAR(100) NOT NULL,
city VARCHAR(100) NOT NULL,
state VARCHAR(100) NOT NULL DEFAULT 'Pakistan',
joinDate DATE DEFAULT CURRENT_DATE
);

-- Create Table Cars
CREATE TABLE Cars(
car_id SERIAL PRIMARY KEY,
model VARCHAR(50) NOT NULL,
brand VARCHAR(50) NOT NULL,
year INT DEFAULT 2025,
price NUMERIC NOT NULL,
color VARCHAR(50) NOT NULL,
inventory_count INT NOT NULL
);

-- Create Table Salespersons
CREATE TABLE Salespersons(
salesperson_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
department VARCHAR(50) NOT NULL,
hire_date DATE DEFAULT CURRENT_DATE
);

-- Create Table Sales
CREATE TABLE Sales(
sale_id SERIAL PRIMARY KEY,
customer_id INT NOT NULL,
car_id INT NOT NULL,
sale_date DATE NOT NULL,
sale_price NUMERIC NOT NULL,
salesperson_id INT NOT NULL,
FOREIGN KEY (customer_id) REFERENCES Customers (customer_id),
FOREIGN KEY (car_id) REFERENCES Cars (car_id),
FOREIGN KEY (salesperson_id) REFERENCES Salespersons (salesperson_id)
);

-- Create Table ServiceRecords
CREATE TABLE ServiceRecords(
record_id SERIAL PRIMARY KEY,
car_id INT NOT NULL,
service_date DATE NOT NULL,
service_type VARCHAR(50),
cost NUMERIC NOT NULL,
technician_id INT NOT NULL,
FOREIGN KEY (car_id) REFERENCES Cars (car_id)
);

-- Insert Data In Customers Table
INSERT INTO Customers (customer_name, city, state, joinDate) VALUES
('Ali Sultan', 'Karachi', 'Pakistan', '2024-01-15'),
('Neha Rehan', 'Lahore', 'Pakistan', '2024-02-10'),
('Ibrahim Riaz', 'Islamabad', 'Pakistan', '2024-03-05'),
('Hasan Bin irshad', 'Faisalabad', 'Pakistan', '2024-03-18'),
('Ayesha Ehtisham', 'Multan', 'Pakistan', '2024-04-02'),
('Farheen Arshad', 'Rawalpindi', 'Pakistan', '2024-04-22'),
('Abdullah Imran', 'Peshawar', 'Pakistan', '2024-05-11'),
('Mariam Shah', 'Quetta', 'Pakistan', '2024-05-29'),
('Omar Farooq', 'Sialkot', 'Pakistan', '2024-06-14'),
('Nadia Qureshi', 'Hyderabad', 'Pakistan', '2024-07-01');

-- Insert Data In Cars Table
INSERT INTO Cars (model, brand, year, price, color, inventory_count) VALUES
('Corolla Altis', 'Toyota', 2023, 4800000, 'White', 5),
('Yaris', 'Toyota', 2022, 3800000, 'Silver', 3),
('Civic RS', 'Honda', 2023, 7200000, 'Black', 2),
('City Aspire', 'Honda', 2022, 4200000, 'Grey', 4),
('Alto VXL', 'Suzuki', 2023, 2500000, 'Red', 8),
('Sonata 2.5', 'Hyundai', 2024, 9500000, 'Grey', 2),
('Swift GLX', 'Suzuki', 2023, 3500000, 'Blue', 3),
('Sportage', 'Kia', 2023, 7800000, 'White', 2),
('Stonic', 'Kia', 2022, 5500000, 'Yellow', 1),
('Elantra GLS', 'Hyundai', 2023, 6100000, 'Black', 3),
('Tucson', 'Hyundai', 2023, 7800000, 'Silver', 2),
('Elantra 1.6', 'Hyundai', 2024, 5800000, 'Blue', 2);

-- Insert Data In Salespersons Table
INSERT INTO Salespersons (name, department, hire_date) VALUES
('Ali Hassan', 'New Cars', '2023-01-10'),
('Sadia Tariq', 'New Cars', '2023-03-14'),
('Imran Sheikh', 'Used Cars', '2023-05-22'),
('Rabia Nadeem', 'Used Cars', '2023-07-19'),
('Faisal Mehmood', 'New Cars', '2023-08-05');

-- Insert Data In Sales Table
INSERT INTO Sales (customer_id, car_id, sale_date, sale_price, salesperson_id) VALUES
(7, 1, '2024-04-10', 4800000, 1), 
(5, 2, '2024-06-05', 3800000, 2),  
(2, 3, '2024-04-15', 7200000, 2), 
(1, 4, '2024-06-15', 4200000, 3), 
(3, 5, '2024-05-01', 2500000, 3), 
(7, 7, '2024-07-02', 3500000, 4),  
(1, 6, '2024-08-25', 9500000, 4),  
(2, 10, '2024-08-05', 6100000, 1), 
(3, 12, '2024-09-01', 5800000, 1),
(4, 8, '2024-05-20', 7800000, 1), 
(8, 9, '2024-07-18', 5500000, 5),  
(10, 11, '2024-08-20', 7800000, 2),
(5, 6, '2024-09-15', 9500000, 3), 
(9, 1, '2024-09-20', 4800000, 2),  
(6, 5, '2024-09-25', 2500000, 4); 

-- Insert Data In ServiceRecords Table
INSERT INTO ServiceRecords (car_id, service_date, service_type, cost, technician_id) VALUES
(1, '2024-04-25', 'Oil Change', 5000, 101),
(3, '2024-05-10', 'Engine Tune-up', 15000, 102),
(5, '2024-05-25', 'Tyre Replacement', 40000, 103),
(7, '2024-06-10', 'Brake Service', 12000, 104),
(2, '2024-06-22', 'AC Repair', 18000, 105),
(4, '2024-07-05', 'Oil Change', 5000, 101),
(6, '2024-07-15', 'Battery Replacement', 18000, 103),
(8, '2024-08-01', 'Engine Overhaul', 85000, 102),
(9, '2024-08-18', 'Oil Change', 5000, 104),
(10, '2024-08-28', 'Suspension Repair', 30000, 105);

----------------------------------
-- Part 1 Basic Aggregate Functions
----------------------------------

--Find the total number of customers in the database.
SELECT COUNT(customer_id) FROM Customers;

--Calculate the average sale price of all car sales.
SELECT TO_CHAR(AVG(sale_price),'FM999999999.00') FROM Sales;

--Find the most expensive car ever sold.
SELECT MAX(sale_price) FROM Sales;

--Determine the total inventory count of all cars in the showroom.
SELECT SUM(inventory_count) FROM Cars;

--Find the earliest and most recent sale dates.
SELECT MIN(sale_date) AS earliest_sale_date, MAX(sale_date) AS recent_sale_date FROM Sales;

-----------------------------
-- Part 2: GROUP BY Exercises
-----------------------------

--Group cars by brand and count how many models each brand has.
SELECT brand, COUNT(model) FROM Cars
GROUP BY brand;

--Calculate the total sales amount for each salesperson.
SELECT salesperson_id, SUM(sale_price) FROM sales
GROUP BY salesperson_id;

--Find the average sale price for each car model.
SELECT car_id, TO_CHAR(AVG(sale_price),'FM999999999.00') FROM Sales
GROUP BY car_id;

--For each service type, find the average service cost.
SELECT service_type, TO_CHAR(AVG(cost),'FM999999.00') FROM ServiceRecords
GROUP BY service_type;

--Find the count of cars by brand and color combination from the cars table.
SELECT brand, COUNT(*) AS color_combinations from cars
GROUP BY brand;

----------------------------------
-- Part 3: HAVING Clause Exercises
----------------------------------

--Identify brands that offer more than five different car models.
SELECT brand, COUNT(model) AS no_of_models FROM Cars
GROUP BY brand
HAVING COUNT(model) > 5;

--List car models that have been sold more than 10 times.
SELECT s.car_id, c.model, COUNT(s.car_id) AS count FROM Sales s
JOIN Cars c ON c.car_id = s.car_id
GROUP BY s.car_id,c.model
HAVING COUNT(s.car_id) > 10;

--Find salespersons whose average sale price is greater than 50,000.
SELECT sp.salesperson_id, sp.name, TO_CHAR(AVG(s.sale_price),'FM99999999.00') FROM Salespersons sp
JOIN Sales s ON s.salesperson_id = sp.salesperson_id
GROUP BY sp.salesperson_id,sp.name
HAVING AVG(s.sale_price) > 50000;

--Identify months that had more than 20 sales.
SELECT TO_CHAR(sale_date, 'YYYY-MM') AS sale_month, COUNT(sale_id) AS total_sales
FROM Sales
GROUP BY TO_CHAR(sale_date, 'YYYY-MM')
HAVING COUNT(sale_id) > 20;

--Find service types where the average cost is greater than 500
SELECT service_type, TO_CHAR(AVG(cost),'FM99999.00') AS avg FROM ServiceRecords
GROUP BY service_type
HAVING AVG(cost) > 500;

