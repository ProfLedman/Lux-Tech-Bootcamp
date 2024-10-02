-- Correlated queries **can be very sow for many records
SELECT first_name, department, salary
FROM employees e1
WHERE salary > (SELECT ROUND (AVG(salary)) 
				FROM employees e2 WHERE e1.department = e2.department); --runs for every single record of the outer query
				
				
SELECT first_name, department, salary,
(SELECT ROUND (AVG(salary)) 
				FROM employees e2 WHERE e1.department = e2.department) AS avg_dpt_sal
FROM employees e1
ORDER BY salary DESC;

--write a query to obtain the departments with more than 38 employees working
SELECT department 
FROM departments d
WHERE 38 < (SELECT COUNT(*)
		   FROM employees e 
		   WHERE e.department = d.department);

-- check max salary for each department
SELECT department, (SELECT MAX(salary) FROM employees WHERE department = d.department) AS max_sal
FROM departments d
WHERE 38 < (SELECT COUNT(*)
		   FROM employees e 
		   WHERE e.department = d.department)
ORDER BY max_sal DESC;

SELECT department, MAX(salary) AS max_sal
FROM employees e1
WHERE 38 < (SELECT COUNT(*)
		   FROM employees e2 
		   WHERE e2.department = e1.department)		   
GROUP BY department
ORDER BY max_sal DESC;

--transpose
SELECT SUM(CASE WHEN salary < 100000 THEN 1 ELSE 0 END) AS under_paid,
SUM( CASE WHEN salary > 100000 AND salary < 150000 THEN 1 ELSE 0 END) AS paid_well,
SUM( CASE WHEN salary > 150000 THEN 1 ELSE 0 END) AS executive
FROM employees;

SELECT a.category, COUNT(*) FROM (
SELECT first_name, salary,
CASE
	WHEN salary < 100000 THEN 'under_paid'
	WHEN salary > 100000 AND salary < 150000 THEN 'Well_paid'
	WHEN salary > 150000 THEN 'Executive'
	ELSE 'Unpaid'
END AS category
FROM employees) a
GROUP BY a.category;


---excercises 
--- Transpose a dataset
SELECT department, COUNT(*)
FROM employees
WHERE department IN ('Sports', 'Tools', 'Clothing', 'Computers')
GROUP BY department;

SELECT SUM(CASE WHEN department = 'Sports' THEN 1 ELSE 0 END) AS Sports_dept,
SUM(CASE WHEN department = 'Tools' THEN 1 ELSE 0 END) AS Tools_dept,
SUM(CASE WHEN department = 'Clothing' THEN 1 ELSE 0 END) AS Clothing_Dept,
SUM(CASE WHEN department = 'Computers' THEN 1 ELSE 0 END) AS Computers_dept
FROM employees

SELECT first_name, 
CASE WHEN region_id = 1 THEN(SELECT country FROM regions WHERE region_id = 1) END AS region_1, 
CASE WHEN region_id = 2 THEN (SELECT country FROM regions WHERE region_id = 2) END AS region_2,
CASE WHEN region_id = 3 THEN (SELECT country FROM regions WHERE region_id = 3) END AS region_3,
CASE WHEN region_id = 4 THEN (SELECT country FROM regions WHERE region_id = 4) END AS region_4,
CASE WHEN region_id = 5 THEN (SELECT country FROM regions WHERE region_id = 5) END AS region_5,
CASE WHEN region_id = 6 THEN (SELECT country FROM regions WHERE region_id = 6) END AS region_6,
CASE WHEN region_id = 7 THEN (SELECT country FROM regions WHERE region_id = 7) END AS region_7
FROM EMPLOYEES

SELECT SUM(CASE WHEN region_id IN (SELECT region_id FROM regions WHERE country = 'United States') THEN 1 ELSE 0 END) AS United_States,
SUM(CASE WHEN region_id IN (SELECT region_id FROM regions WHERE country = 'Asia') THEN 1 ELSE 0 END) AS Asia,
SUM(CASE WHEN region_id IN (SELECT region_id FROM regions WHERE country = 'Canada') THEN 1 ELSE 0 END) AS Canada
FROM employees


SELECT COUNT(a.region_1)+COUNT(a.region_2)+COUNT(a.region_3) as United_States, 
COUNT(a.region_4)+COUNT(a.region_5) AS Asia, COUNT(a.region_6)+COUNT(a.region_7) AS Canada
FROM (
SELECT first_name, 
CASE WHEN region_id = 1 THEN(SELECT country FROM regions WHERE region_id = 1) END AS region_1, 
CASE WHEN region_id = 2 THEN (SELECT country FROM regions WHERE region_id = 2) END AS region_2,
CASE WHEN region_id = 3 THEN (SELECT country FROM regions WHERE region_id = 3) END AS region_3,
CASE WHEN region_id = 4 THEN (SELECT country FROM regions WHERE region_id = 4) END AS region_4,
CASE WHEN region_id = 5 THEN (SELECT country FROM regions WHERE region_id = 5) END AS region_5,
CASE WHEN region_id = 6 THEN (SELECT country FROM regions WHERE region_id = 6) END AS region_6,
CASE WHEN region_id = 7 THEN (SELECT country FROM regions WHERE region_id = 7) END AS region_7
FROM EMPLOYEES) a

--write a query to select the department, the employee that makes the highest and lowest salary with a column flagging each
SELECT first_name, department, 
(SELECT salary FROM employees WHERE salary BETWEEN MAX(salary) AND MIN (salary))
FROM employees e1

(SELECT department, MAX(salary), MIN(salary) 
				FROM employees GROUP BY department); 


SELECT department, 
       (SELECT MIN(salary) FROM employees e2 WHERE e1.department = e2.department) AS min_salary,
       (SELECT MAX(salary) FROM employees e3 WHERE e1.department = e3.department) AS max_salary
FROM employees e1
GROUP BY department;
