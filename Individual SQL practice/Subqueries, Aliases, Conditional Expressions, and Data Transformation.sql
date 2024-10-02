--Aliases when selecting from multiple sources
SELECT e.department
FROM employees e, departments d

--Introducing Sub-Queries
SELECT * FROM employees
WHERE department NOT IN (SELECT department FROM departments);

SELECT *
FROM (SELECT * FROM employees WHERE salary > 150000) a; -- use an alias for the source of the data

-- Exercises
-- select statement returns all the employees that work in the electronics division
SELECT *
FROM employees
WHERE department IN (SELECT department FROM departments
					WHERE division = 'Electronics');

--employees that work in Asia or canada making more than 130000 
SELECT * 
FROM employees
WHERE region_id IN (SELECT region_id FROM regions 
					WHERE country = 'Asia' OR country = 'Canada')
AND salary > 130000;

--show the first name and department of employees in Asia and Canada along with how much less they make than the highest paid employee
SELECT first_name, department, 
(SELECT MAX(Salary) FROM employees)- salary
FROM employees
WHERE region_id IN (SELECT region_id FROM regions 
					WHERE country = 'Asia' OR country = 'Canada')
					
					
-- ALL/ANY clause
SELECT * 
FROM employees
WHERE region_id > ALL (SELECT region_id FROM regions WHERE country = 'United States')


SELECT * 
FROM employees
WHERE region_id > ANY (SELECT region_id FROM regions WHERE country = 'United States')
-- ANY is a bit confusing*_*

-- Write a query that returns all of those employees that work in the
-- kids division and the dates at which those employees were hired is greater than all of the 
-- hire dates of employees who work in the maintenance department

SELECT * 
FROM employees 
WHERE department = ANY 
(SELECT department FROM departments WHERE division = 'Kids')
AND hire_date > ALL 
(SELECT hire_date FROM employees WHERE department = 'Maintenance');

--Write a query to return the most frequent salaries 
SELECT salary from (SELECT salary, COUNT(*)
FROM employees
GROUP BY salary
ORDER BY COUNT(*) DESC, salary DESC
LIMIT 1) a;


SELECT salary
FROM employees
GROUP BY salary
HAVING count(*) >= ALL (SELECT COUNT(*) FROM employees
					   GROUP BY salary)
ORDER BY salary DESC
LIMIT 1;

-------------------------------------------------------------
CREATE TABLE dupes (id integer,
				   name varchar(10));

INSERT INTO dupes VALUES (1, 'FRANK');
INSERT INTO dupes VALUES (2, 'FRANK');
INSERT INTO dupes VALUES (3, 'ROBERT');
INSERT INTO dupes VALUES (4, 'ROBERT');
INSERT INTO dupes VALUES (5, 'SAM');
INSERT INTO dupes VALUES (6, 'FRANK');
INSERT INTO dupes VALUES (7, 'PETER');
INSERT INTO dupes VALUES (8, 'LEA');

SELECT MIN(id), name
FROM dupes
GROUP BY name;

SELECT * FROM dupes
WHERE id IN (SELECT MIN(id) FROM dupes 
			GROUP BY name);


DELETE FROM dupes
WHERE id NOT IN (SELECT MIN(id) FROM dupes 
			GROUP BY name);

DROP TABLE dupes;

-------------------------------------------------------------
--Outliers
SELECT AVG(salary)
FROM employees
WHERE employee_id NOT IN 

SELECT ROUND(AVG(salary))
FROM employees
WHERE salary NOT IN ((SELECT MIN(salary) FROM employees),
					 (SELECT MAX(salary) FROM employees));

-- conditional expressions
SELECT a.category, COUNT(*) FROM (
SELECT first_name, salary, 
CASE
	WHEN salary < 100000  THEN 'Under Paid'
	WHEN salary > 100000 AND salary < 160000 THEN 'Paid Well'
	WHEN salary > 1600000  THEN 'Executive'
	ELSE 'Unpaid'
	END AS category
FROM employees
ORDER BY salary DESC) a
GROUP BY a.category;

-- Transpose the data
SELECT SUM(CASE WHEN salary < 100000 THEN 1 ELSE 0 END) AS under_paid,
SUM( CASE WHEN salary > 100000 AND salary < 150000 THEN 1 ELSE 0 END) AS paid_well,
SUM( CASE WHEN salary > 150000 THEN 1 ELSE 0 END) AS executive
FROM employees


