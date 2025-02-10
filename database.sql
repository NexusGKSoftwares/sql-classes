-- 1. dealing with query databases

-- querying the databas involves retrieving data from the database
-- there are several ways to query a database, including using SQL commands
-- or using a programming language like Python or Java to interact with the database
-- we will use SQL commands to query the database in this example
-- we will use the SELECT command to retrieve data from the database


--  2.  sql query structure
-- the basic structure of a SQL query is as follows:
-- SELECT column1, column2, ... FROM table_name WHERE condition;


-- key sql clauses
-- SELECT: specifies the columns to retrieve data from 
-- FROM: specifies the table to retrieve data from
-- WHERE: specifies the condition for which rows to retrieve data from
-- ORDER BY: specifies the order in which to retrieve data from
-- LIMIT: specifies the maximum number of rows to retrieve from the database
-- GROUP BY: specifies the columns to group data for aggregation
-- HAVING: specifies the condition for which groups to retrieve data from - filtering grouped data
-- JOIN: combines rows from two or more tables based on a related column between them


-- 3. retrieving data from a database working with SELECT
-- the SELECT command is used to retrieve data from a database table
-- it allows you to specify which columns to include in the result set

-- selecting all columns
SELECT * FROM employees;

-- selecting specific columns
SELECT name, salary FROM employees;

-- renaming the columns 
SELECT name AS employee_name, salary AS Salary FROM employees;

-- 4. filtering data with WHERE

-- using comparison operators
SELECT * FROM employees WHERE salary > 50000;
SELECT * FROM employees WHERE salary < 50000;

--  using the logical operators(AND, OR, NOT)
SELECT * FROM employees WHERE salary > 50000 AND department = 'sales'; -- deals with both conditions
SELECT * FROM employees WHERE salary > 50000 OR department = 'sales'; -- deals with either condition
SELECT * FROM employees WHERE NOT department = 'sales'; -- deals with the discarded

-- using pattern matching (LIKE)
SELECT * FROM employees WHERE name LIKE '%John%'; -- returns all rows where the name contains 'Johnnn'
SELECT * FROM employees WHERE name LIKE 'John%'; -- returns all rows where the name starts with 'J'
SELECT * FROM employees WHERE name LIKE '%John'; -- returns all rows where the name ends with 'n'
SELECT * FROM employees WHERE name LIKE 'John'; -- returns all rows where the name is exactly 'John'
-- sample data
CREATE TABLE employees (
    id INT,
    name VARCHAR(255),
    salary DECIMAL(10,2),
    department VARCHAR(255)
    );
    INSERT INTO employees (id, name, salary, department) VALUES 
    (1, 'John Doe',50000.00, 'sales'),
    (2, 'Jane Doe', 60000.00, 'sales'),
    (3, 'John Smith', 70000.00, 'marketing'),
    (4, 'Jane Smith', 80000.00, 'marketing'),
    (5, 'John Brown', 90000.00, 'sales'),
    (6, 'Jane Brown', 100000.00, 'sales'),
    (7, 'John White', 110000.00, 'marketing'),
    (8, 'Jane White', 120000.00, 'marketing'),
    (9, 'John Green', 130000.00, 'sales'),
    (10, 'Jane Green', 140000.00, 'sales'),
    (11, 'John Blue', 150000.00, 'marketing'),
    (12, 'Jane Blue', 160000.00, 'marketing'),
    (13, 'John Red', 170000.00, 'sales'),
    (14, 'Jane Red', 180000.00, 'sales'),
    (15, 'John Yellow', 190000.00, 'marketing'),
    (16, 'Jane Yellow', 200000.00, 'marketing'),
    (17, 'John Orange', 210000.00, 'sales'),
    (18, 'Jane Orange', 220000.00, 'sales'),
    (19, 'John Purple', 230000.00, 'marketing'),
    (20, 'Jane Purple', 240000.00, 'marketing');


-- filtering nulls values with IS NULL and IS NOT NULL:
SELECT * FROM employees WHERE salary IS NULL; --returns all rows where the salary is null
SELECT * FROM employees WHERE salary IS NOT NULL; -- returns all rows where the salary is not null

-- 5 . Sorting data with ORDER BY
-- sorting in ascending order
SELECT * FROM employees ORDER BY salary ASC;

-- sorting in descending order
SELECT * FROM employees ORDER BY salary DESC;


-- 6 aggregating data with GROUP BY 

-- common aggregate functions: 
-- COUNT() -counts the number of rows
-- SUM() - calculates the sum of a numeric column
-- AVG() - calculates the average of a numeric column
-- MAX() - returns the maximum value in a numeric column
-- MIN() - returns the minimum value in a numeric column

-- example of using COUNT() to count the number of employees in each department
SELECT department, COUNT(*) FROM employees GROUP BY department; -- returns the number of employees in each department


-- example of using SUM() to calculate the total salary of employees in each department
SELECT department, SUM(salary) FROM employees GROUP BY department; -- returns the total salary of employees in each department

-- example of using AVG() to calculate the average salary of employees in each department
SELECT department, AVG(salary) FROM employees GROUP BY department; -- returns the average salary of employees

-- example of using MAX() to find the maximum salary in each department
SELECT department, MAX(salary) FROM employees GROUP BY department; -- returns the maximum salary in each department

-- example of using MIN() to find the minimum salary in each department
SELECT department, MIN(salary) FROM employees GROUP BY department; -- returns the minimum salary in each department

--7. filtering group data with having
-- example of using HAVING to filter the results of a GROUP BY statement
SELECT department, AVG(salary) FROM employees GROUP BY department HAVING AVG(salary) > 20000000; -- returns the average salary of employees in each department


--8. limiting data with LIMIT
-- example of using LIMIT to limit the number of rows returned by a query
-- getting the first 5 rows of the employees table
-- SELECT * FROM employees LIMIT 5;
-- getting the last 5 rows of the employees table
-- SELECT * FROM employees ORDER BY id DESC LIMIT 5;

-- 9. combining queries union
--  union combines results from multiple queries (removes duplicates)
-- example of using UNION to combine the results of two queries
SELECT * FROM employees WHERE department = 'sales' UNION SELECT * FROM employees WHERE department = 'marketing';

-- example: getting all employee names from two tables
SELECT name FROM employees UNION SELECT name FROM customers;

-- 10 Subqueries(Nested Queries)
-- a subquery is a query nested inside another query
-- example of using a subquery to get the names of employees who earn more than the average salary
SELECT name FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);

--  when using JOIN
-- INNER JOIN - returns records that have matching values in both tables
-- LEFT JOIN - returns all records from the left table, and the matched records from the right table
-- RIGHT JOIN - returns all records from the right table, and the matched records from the left table
-- FULL OUTER JOIN - returns all records when there is a match in either left or right table records

-- example 
-- INNER JOIN
SELECT * FROM employees INNER JOIN departments ON employees.department = departments.id; -- returns employees and their departments
-- LEFT JOIN
SELECT * FROM employees LEFT JOIN departments ON employees.department = departments.id; -- returns all employees and their departments (if any)
-- RIGHT JOIN
SELECT * FROM employees RIGHT JOIN departments ON employees.department = departments.id; -- returns all departments and their
-- FULL OUTER JOIN
SELECT * FROM employees FULL OUTER JOIN departments ON employees.department = departments.id; -- combines all results from LEFT JOIN & RIGTH JOIN

--  difference between UNION and JOIN in sql
-- UNION is used to combine the result-set of two or more SELECT statements while JOIN is used to combine rows from two or more tables based on a related column between them.
-- UNION removes duplicate rows while JOIN does not remove duplicate rows.

-- building relationships between tables
-- 1. one-to-one (1:1) relationship
-- 2. one-to-many (1:N) relationship
-- 3. many-to-many (M:N) relationship


-- one to one relationship
-- example of one-to-one relationship
CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255)
    );
CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
    );
-- in this example, one customer can have one order, and one order is associated with one customer

--  one to many relationship
-- example of one-to-many relationship
CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255)
    );
CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
    );
    
CREATE TABLE products (
    id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
    );

-- in this example, one customer can have many orders, and many products can be associated with one customer

-- many to many relationship
-- example of many-to-many relationship
-- lets consider a student and courses relationships where:
-- one student can enroll in many courses and one course can be enrolled by many students
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255)
    );
CREATE TABLE courses (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    description VARCHAR(255)
    );
CREATE TABLE enrollments (
    id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
    );

--  insert sample large dataset
INSERT INTO students (id, name, email) VALUES
(1, 'John Doe', 'john.doe@example.com'),
(2, 'Jane Doe', 'jane.doe@example.com'),
(3, 'John Smith', 'john.smith@example.com'),
(4, 'Jane Smith', 'jane.smith@example.com'),
(5, 'John Johnson', 'john.johnson@example.com'),
(6, 'Jane Johnson', 'jane.johnson@example.com'),
(7, 'John Williams', 'john.williams@example.com'),
(8, 'Jane Williams', 'jane.williams@example.com'),
(9, 'John Davis', 'john.davis@example.com'),
(10, 'Jane Davis', 'jane.davis@example.com')

INSERT INTO courses (id, name, description) VALUES
(1, 'Math', 'Math course'),
(2, 'Science', 'Science course'),
(3, 'History', 'History course'),
(4, 'English', 'English course'),
(5, 'Geography', 'Geography course'),
(6, 'Biology', 'Biology course'),
(7, 'Chemistry', 'Chemistry course'),
(8, 'Physics', 'Physics course'),
(9, 'Computer Science', 'Computer Science course'),
(10, 'Economics', 'Economics course')

INSERT INTO enrollments (id, student_id, course_id) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 2, 3),
(5, 3, 2),
(6, 3, 4),
(7, 4, 1),
(8, 4, 5),
(9, 5, 3),
(10, 5, 6),
(11, 6, 4),
(12, 6, 7),
(13, 7, 5),
(14, 7, 8),
(15, 8, 6);



-- querying this data 
-- to get all the courses a student is enrolled in
SELECT c.name FROM enrollments e
JOIN courses c ON e.course_id = c.id
WHERE e.student_id = 1;
-- to get all the students enrolled in a course
SELECT s.name FROM enrollments e
JOIN students s ON e.student_id = s.id
WHERE e.course_id = 1;


-- in this example , one student can enroll in many courses and one course can be enrolled by many students
