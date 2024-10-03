-- JOINS
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department_id INT
);

INSERT INTO employees (employee_id, employee_name, department_id) VALUES
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', 103),
(4, 'David', NULL);

-- Create 'departments' table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);


INSERT INTO departments (department_id, department_name) VALUES
(101, 'HR'),
(102, 'Finance'),
(104, 'Engineering');

-- Inner Join
SELECT e.employee_name, d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

-- Left Outer Join
SELECT e.employee_name, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;

-- Right Outer Join
SELECT e.employee_name, d.department_name
FROM employees e
FULL JOIN departments d
ON e.department_id = d.department_id;

-- Full Join
SELECT e.employee_name, d.department_name
FROM employees e
FULL JOIN departments d
ON e.department_id = d.department_id;

-- Cross Join
SELECT e.employee_name, d.department_name
FROM employees e
CROSS JOIN departments d;
