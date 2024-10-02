-- Correlated subqueries
SELECT first_name, salary
FROM employees 
WHERE salary > (SELECT ROUND(AVG(salary)) FROM employees);
-- a correlated query is a nested subquery that uses values from the outer query
SELECT first_name, department, salary
FROM employees e1 
WHERE salary > (SELECT ROUND(AVG(salary)) 
				FROM employees e2 WHERE e1.department = e2.department);
				-- subquery will run for every single record of the outer query


SELECT first_name, department, salary, (SELECT ROUND(AVG(salary)) 
				FROM employees e2 WHERE e1.department = e2.department) AS avg_dept_sal
FROM employees e1 ;

-- query the names of the departments with more than 38 employees working
SELECT department, employee_count FROM (
SELECT department, COUNT(*) AS employee_count
FROM employees e1
GROUP BY department) a
WHERE employee_count > 38;
