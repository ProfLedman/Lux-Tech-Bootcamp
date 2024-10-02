USE practiceDB;

SELECT * 
FROM employees
WHERE NOT department != 'Sports';

SELECT * 
FROM employees
WHERE email IS NULL;
-- CANNOT USE EQUALITY OPERATOR TO COMPARE NULL

--filtering for a set of values
SELECT * 
FROM employees
WHERE department = 'Sports'
OR department = 'Toys'
OR department = 'Garden';


SELECT * 
FROM employees
WHERE department IN( 'Sports','Toys','Garden');

--Checking for values within a given range
SELECT * 
FROM employees
WHERE salary BETWEEN 80000 AND 100000; -- between clause is inclusive


--WHERE CLAUSE AND OPERATORS
-- write a query that gives the first_name and email of female employees 
-- that work in the tools department having a salary greater that 110000
SELECT first_name, email
FROM employees
WHERE department = 'Tools'
AND gender = 'F'
AND salary > 110000;

-- Return the first_name and hire_date of those employees who earn more than 165,000
-- as well as those employees that work in the sports department and also happen to be men
SELECT first_name, hire_date
FROM employees
WHERE salary > 165000
OR (department = 'Sports'AND gender = 'M');

--Return the first names and hire dates of those emploess who were
--hired during jan 1st 2002 and jan 1st 2004
SELECT first_name, hire_date
FROM employees
WHERE hire_date BETWEEN '2002-01-01' AND '2004-01-01';

-- Return the male employees who work in the automotive department and earn more
--than 40,000 and less than 100,000 as well as females that work in the toys department
SELECT *
FROM employees
WHERE (gender = 'M' AND department = 'Automotive')
AND salary BETWEEN 40000 AND 100000
OR (gender = 'F' AND department = 'Toys');

-- Using ORDER By, LIMIT, DISTINCT, and renaming columns
SELECT *
FROM employees
WHERE salary > 160000
ORDER BY salary DESC; --ascending by default

SELECT DISTINCT department AS sorted_departments
FROM employees
ORDER BY department;


SELECT UPPER(first_name), LOWER(department)
FROM employees;

