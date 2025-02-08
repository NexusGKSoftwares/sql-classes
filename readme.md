Introduction to SQL & Relational Databases

What is SQL?
------
SQL (Structured Query Language) is a programming language 
designed for managing and manipulating data stored in relational databases
It is used to perform various operations such as creating, modifying, and querying database tables.

importance & applications of SQL
--------------------------------
SQL is used in various applications such as:
- used in web development to interact with databases e.g facebook, instagram 
- used in data analysis to extract insights from large datasets
- used in data science to build predictive models and data visualizations
- used in business intelligence to create reports and dashboards


Types of Databases
==================== 
There are several types of databases including:
- Relational databases (e.g. MySQL, PostgreSQL)
  based on structured tables with well-defined relationships between them 
  it uses the SQL for querying and manipulating data

- NoSQL databases (e.g. MongoDB, Cassandra)
  stores data in a flexible formats like (key value, documents, column family and graphs)
  used to handle large amounts of unstructured data eg iot 

comparison table

Feature                     Relational database                      non-relational database
data  structure             tables (rows and columns)                Key-value, document, graphs
query language              SQL                                      NoSQL
scalability                 vertical (add more power)                horizontal (add more nodes)
flexibility                 Rigid schema                             Flexible schema


Introduction to RDBMS
===================== 
is a software used to manage relational databases(create , modify, delete)

Popular RDBMS options 
MySQL - open source, widely used in web development
PostgreSQL - open source, known for its reliability and scalability- advanced features 
            like window functions and common table expressions
SQL server - Microsoft's RDBMS used in enterprise solutions
Oracle - commercial RDBMS used in large-scale applications

key Feature of RDBMS
---------------------
- structured tables with relationships
- ensures ACID properties (atomicity, consistency, isolation, durability)
- supports multiple users and transactions

SQL basics 
setting up the database environments
 - xampp
 - wamp
 - sql server express


understanding tables, rows and columns 
database - collection of tables
table - collection of rows and columns
row - single record in a table
column - single field in a table

end of class 

# SQL Crash Course: Fetching and Analyzing Company Data

## **1. Introduction to SQL**
### **What is SQL?**
- SQL (Structured Query Language) is used to communicate with databases.
- It helps in storing, retrieving, and analyzing structured data.

### **Types of SQL Commands**
1. **DDL (Data Definition Language)** – Defines database structure  
   - `CREATE`, `ALTER`, `DROP`
2. **DML (Data Manipulation Language)** – Modifies data  
   - `INSERT`, `UPDATE`, `DELETE`
3. **DQL (Data Query Language)** – Retrieves data  
   - `SELECT`
4. **DCL (Data Control Language)** – Controls access  
   - `GRANT`, `REVOKE`
5. **TCL (Transaction Control Language)** – Manages transactions  
   - `COMMIT`, `ROLLBACK`

---

## **2. Setting Up SQL in VS Code**
### **Installing Requirements**
- Install **VS Code**
- Install **SQLTools Extension** in VS Code
- Install a database:
  - **MySQL** (Use XAMPP for an easy setup)
  - **PostgreSQL**
  - **SQLite** (Use SQLite extension in VS Code)

### **Connecting to a Database**
1. Open **SQLTools** extension
2. Click **Add New Connection**
3. Choose **Database Type** (MySQL/PostgreSQL/SQLite)
4. Enter database credentials and **Connect**

---

## **3. Fetching Data with SELECT Queries**
### **Basic SELECT Query**
```sql
SELECT * FROM employees;
```
- Fetches all columns from the `employees` table.

### **Filtering Data using WHERE**
```sql
SELECT * FROM employees WHERE department = 'Sales';
```
- Retrieves only employees in the Sales department.

### **Sorting Results with ORDER BY**
```sql
SELECT employee_name, salary FROM employees ORDER BY salary DESC;
```
- Sorts employees by salary in descending order.

### **Limiting Results with LIMIT**
```sql
SELECT * FROM employees LIMIT 5;
```
- Displays only the first 5 rows.

---

## **4. Aggregating & Grouping Data**
### **Using Aggregate Functions**
```sql
SELECT COUNT(*) FROM employees;
SELECT AVG(salary) FROM employees;
SELECT SUM(salary) FROM employees;
```
- Counts employees, calculates average salary, and sums salaries.

### **Grouping Data using GROUP BY**
```sql
SELECT department, AVG(salary) FROM employees GROUP BY department;
```
- Shows the average salary per department.

### **Filtering Groups using HAVING**
```sql
SELECT department, COUNT(*) FROM employees GROUP BY department HAVING COUNT(*) > 10;
```
- Displays only departments with more than 10 employees.

---

## **5. Joining & Relating Tables**
### **INNER JOIN (Fetching Related Data)**
```sql
SELECT employees.name, departments.department_name
FROM employees
INNER JOIN departments ON employees.department_id = departments.id;
```
- Fetches employee names along with their department names.

### **LEFT JOIN (Including Unmatched Rows)**
```sql
SELECT employees.name, projects.project_name
FROM employees
LEFT JOIN projects ON employees.id = projects.employee_id;
```
- Displays all employees even if they have no assigned projects.

---

## **6. Data Analysis & Reporting**
### **Using CASE for Conditional Queries**
```sql
SELECT name, salary,
  CASE
    WHEN salary > 80000 THEN 'High'
    WHEN salary BETWEEN 50000 AND 80000 THEN 'Medium'
    ELSE 'Low'
  END AS Salary_Category
FROM employees;
```
- Categorizes salaries as High, Medium, or Low.

### **Using Subqueries**
```sql
SELECT name, salary FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
```
- Finds employees earning more than the average salary.

---

## **7. Hands-on Data Project**
### **Task: Analyze Company Employee Data**
1. **Fetch all employee details**
2. **Find highest-paid employees**
3. **Calculate department-wise salary expense**
4. **List employees who have no assigned projects**
5. **Find the most common job title in the company**

---

## **8. Practice & Next Steps**
- Use a sample dataset (e.g., `Northwind` or `Sakila`)
- Write SQL queries based on real-world scenarios
- Explore advanced topics like indexing, stored procedures, and views

### **Resources for Further Learning**
- [SQL Tutorial](https://www.w3schools.com/sql/)
- [SQL Practice](https://www.sqlzoo.net/)
- [Leetcode SQL Problems](https://leetcode.com/problemset/database/)

---
🎯 **With these notes, your student will quickly grasp SQL for data fetching and analysis!** 🚀


Here's a sample **Company Database** with SQL scripts to create tables and insert sample data. This dataset includes **employees, departments, and projects** to help with analysis.  

---

### **Step 1: Create the Database**  
```sql
CREATE DATABASE company_db;
USE company_db;
```

---

### **Step 2: Create Tables**  

#### **1. Employees Table**
```sql
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    department_id INT,
    salary DECIMAL(10,2),
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);
```

#### **2. Departments Table**
```sql
CREATE TABLE departments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);
```

#### **3. Projects Table**
```sql
CREATE TABLE projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    employee_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);
```

---

### **Step 3: Insert Sample Data**  

#### **Insert Departments**
```sql
INSERT INTO departments (department_name) VALUES 
('HR'), 
('IT'), 
('Sales'), 
('Marketing');
```

#### **Insert Employees**
```sql
INSERT INTO employees (name, age, department_id, salary, hire_date) VALUES
('Alice Johnson', 30, 2, 70000, '2019-06-10'),
('Bob Smith', 45, 1, 65000, '2015-08-23'),
('Charlie Davis', 29, 3, 48000, '2020-09-15'),
('David Lee', 34, 2, 80000, '2018-03-12'),
('Eva Green', 27, 4, 53000, '2021-07-30');
```

#### **Insert Projects**
```sql
INSERT INTO projects (project_name, employee_id, start_date, end_date) VALUES
('Website Redesign', 1, '2023-01-01', '2023-06-01'),
('Cyber Security Upgrade', 2, '2022-10-15', '2023-04-15'),
('Sales Optimization', 3, '2023-03-01', '2023-09-01'),
('Marketing Campaign', 5, '2023-02-10', '2023-07-10');
```

---

### **Step 4: Query the Data**
#### **Fetch All Employees**
```sql
SELECT * FROM employees;
```

#### **Find Employees Earning More than 60,000**
```sql
SELECT name, salary FROM employees WHERE salary > 60000;
```

#### **List Employees with Their Departments**
```sql
SELECT e.name, d.department_name 
FROM employees e 
JOIN departments d ON e.department_id = d.id;
```

#### **Find Employees Without a Project**
```sql
SELECT e.name FROM employees e 
LEFT JOIN projects p ON e.id = p.employee_id 
WHERE p.id IS NULL;
```

---
