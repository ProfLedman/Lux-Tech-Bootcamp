
# SQL Joins Cheat

## Overview
SQL Joins are used to retrieve data from multiple tables based on a related column between them. The most commonly used SQL joins include:

- **INNER JOIN**
- **LEFT (OUTER) JOIN**
- **RIGHT (OUTER) JOIN**
- **FULL (OUTER) JOIN**
- **CROSS JOIN**

In this summary, I will explore each type of join using data examples as a follow up to today's bootcamp class on advance SQL topics.

## Data Setup

Here I create two tables `employees` and `departments` to demonstrate the different types of joins.

```sql
-- Create 'employees' table
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
```

---

## 1. INNER JOIN
An INNER JOIN is the most commonly used type of join. It retrieves only the rows that have matching values in both tables. if there's no match between the two tables on the specified condition, the row will be excluded from the result set.

Key Points:
- It only includes rows where the join condition is met in both tables.
- If no match is found, the row will not appear in the result set.
Use Case:
`INNER JOIN` is useful when we want to find records that exist in both tables. For example, if you want to find employees who belong to a valid department.

### Example:

```sql
SELECT e.employee_name, d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;
```

### Result:

| employee_name | department_name |
|---------------|-----------------|
| Alice         | HR              |
| Bob           | Finance         |

---

## 2. LEFT (OUTER) JOIN
A `LEFT JOIN`, also called a `LEFT OUTER JOIN`, retrieves all rows from the left table (the first table), and the matching rows from the right table (the second table). If there is no match, NULL values will be returned for the right table's columns.

Key Points:
- Returns all rows from the left table and matching rows from the right table.
- Rows from the left table that do not have matching rows in the right table will still be included, with NULL values for columns from the right table.
Use Case:
A LEFT JOIN is useful when we want to see all records from the first table, even if they don't have related records in the second table. For example, if we want to find all employees, even those not assigned to a department.
### Example:

```sql
SELECT e.employee_name, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;
```

### Result:

| employee_name | department_name |
|---------------|-----------------|
| Alice         | HR              |
| Bob           | Finance         |
| Charlie       | NULL            |
| David         | NULL            |

---

## 3. RIGHT (OUTER) JOIN

A `RIGHT JOIN`, or `RIGHT OUTER JOIN`, is the mirror image of a LEFT JOIN. It retrieves all rows from the right table (second table) and matching rows from the left table (first table). If no match is found, NULL values will appear for the columns from the left table.

Key Points:
- Returns all rows from the right table and matching rows from the left table.
- If no match is found for a row in the right table, NULL values will be returned for the left table's columns.
Use Case:
A RIGHT JOIN is useful when we want to include all records from the second table, even if there is no match in the first table. For example, you can use this to list all departments, even if no employees are assigned to them.


### Example:

```sql
SELECT e.employee_name, d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id;
```

### Result:

| employee_name | department_name |
|---------------|-----------------|
| Alice         | HR              |
| Bob           | Finance         |
| NULL          | Engineering      |

---

## 4. FULL (OUTER) JOIN

A `FULL JOIN` (or `FULL OUTER JOIN`) returns all rows when there is a match in either the left table or the right table. If there is no match, NULL values will be returned for the columns from the table without a match. This join type combines the results of both LEFT JOIN and RIGHT JOIN.

Key Points:
- Returns all rows from both tables.
- Rows with no match in the other table will contain NULL values for the missing columns.
- It's a union of LEFT JOIN and RIGHT JOIN results.
Use Case:
A FULL JOIN is useful when we want a comprehensive view of both tables, even if some rows do not have corresponding records in the other table. For example, we can use this to see all employees and all departments, regardless of whether they are related.
* SOME DBs MAY NOT SUPPORT FULL JOIN/FULL OUTER JOIN

### Example:

```sql
SELECT e.employee_name, d.department_name
FROM employees e
FULL JOIN departments d
ON e.department_id = d.department_id;
```

### Result:

| employee_name | department_name |
|---------------|-----------------|
| Alice         | HR              |
| Bob           | Finance         |
| Charlie       | NULL            |
| David         | NULL            |
| NULL          | Engineering      |

---

## 5. CROSS JOIN

A `CROSS JOIN` returns the Cartesian product of two tables. This means that it combines every row from the first table with every row from the second table. This can result in a very large number of rows if both tables have many records.

Key Points:
- Returns every possible combination of rows between the two tables.
- The result set's size is the number of rows in the first table multiplied by the number of rows in the second table.
Use Case:
A CROSS JOIN is useful when you need to generate combinations of data from two tables. It is often used in scenarios such as generating test data, or when you need to associate every item in one table with every item in another.

### Example:

```sql
SELECT e.employee_name, d.department_name
FROM employees e
CROSS JOIN departments d;
```

### Result:

| employee_name | department_name |
|---------------|-----------------|
| Alice         | HR              |
| Alice         | Finance         |
| Alice         | Engineering      |
| Bob           | HR              |
| Bob           | Finance         |
| Bob           | Engineering      |
| Charlie       | HR              |
| Charlie       | Finance         |
| Charlie       | Engineering      |
| David         | HR              |
| David         | Finance         |
| David         | Engineering      |

---

Notes on Performance:
`INNER JOIN` is generally faster than outer joins because it only retrieves matching rows. Since it filters data during the join process, it minimizes the amount of data returned.
`LEFT JOIN` and `RIGHT JOIN` require retrieving all rows from one of the tables, which can sometimes result in slower performance if the table is large or indexing is not optimized.
`FULL OUTER JOIN` can be slower compared to other joins, as it combines both left and right joins.
`CROSS JOIN` can produce large result sets, so use it carefully to avoid performance issues in large tables.