SELECT *
FROM employees
WHERE salary > 160000
ORDER BY salary DESC
LIMIT 10;

SELECT UPPER(first_name) as "First Name", LENGTH(last_name) AS "Second Name Len"
FROM employees;


SELECT first_name ||' '|| last_name AS "Full Name"
FROM employees;

-- replacing and extracting strings
SELECT SUBSTRING('This is test data' FROM 1 FOR 4) test_data_extract

SELECT SUBSTRING('This is test data' FROM 9 FOR 4) test_data_extract

SELECT department, REPLACE (department, 'Clothing', 'Attire') AS Modified_data 
FROM departments;


SELECT department ||' '|| 'department' AS Full_dept_name
FROM departments;


-- Etract substring using position 
SELECT email, SUBSTRING (email, POSITION('@' IN email) + 1) AS domain
FROM employees;


SELECT COALESCE(email, 'NONE') as email
FROM employees;

SELECT *
FROM employees
WHERE email IS NULL;

SELECT MAX(salary) AS Max_Sal
FROM employees;

SELECT MIN(salary) AS Min_sal
FROM employees;

SELECT ROUND (AVG (salary))
FROM employees;

SELECT COUNT (employee_id)
FROM employees;

SELECT SUM(salary)
FROM employees;

SELECT SUM(salary)
FROM employees 
WHERE department = 'Clothing';

SELECT department, COUNT(*) AS employee_count
FROM employees 
GROUP BY department
ORDER BY employee_count DESC;

SELECT department, SUM (salary) AS "Total Salary Paid"
FROM employees
WHERE region_id IN (4,5,6,7)
GROUP BY department
ORDER BY "Total Salary Paid" DESC;


SELECT department, COUNT(*) AS employee_count, ROUND(AVG(salary)) AS avg_sal, MAX(salary) AS max_sal,  MIN(salary) AS min_sal
FROM employees 
WHERE salary > 70000
GROUP BY department
ORDER BY avg_sal DESC; -- order by comes at the end



SELECT department, COUNT(*) AS employee_count
FROM employees 
GROUP BY department
HAVING COUNT(*) > 35 -- used when filtering aggregated data
ORDER BY department DESC;

-- employees having the same first names
SELECT first_name, COUNT(*) AS count_name
FROM employees
GROUP BY first_name
HAVING COUNT(*) > 1
ORDER BY count_name DESC;

--unique departments in the employees table without using DISTINCT key word
SELECT department
FROM employees
GROUP BY department;

-- give different domain names and the total number of employees with the domain
SELECT SUBSTRING (email, POSITION('@' IN email) + 1) AS domain, COUNT(*)
FROM employees
WHERE email IS NOT NULL
GROUP BY domain
ORDER BY COUNT(*) DESC;


SELECT gender, region_id, ROUND(AVG(salary)) AS avg_sal, MAX(salary) AS max_sal,  MIN(salary) AS min_sal
FROM employees 
GROUP BY gender, region_id
ORDER BY gender, region_id;


