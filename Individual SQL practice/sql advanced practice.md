```markdown
# Advanced SQL Practice

This file summarizes the SQL scripts presented demonstrating various advanced SQL concepts, techniques, and best practices. Each script highlights key SQL functionalities, including subqueries, string manipulation, aggregation, and data transposition. The examples used primarily focus on employee and department dummy data from the Udemy mastering SQL course that I will be using to practice thoughtout the bootcamp as I leanr new SQL concepts .

## Key Concepts Covered

### 1. **Correlated Subqueries**
   - Correlated subqueries are subqueries that reference columns from the outer query. They are evaluated once for each row processed by the outer query.
   - **Example:** Checking if an employee’s salary is above the average salary of their department.
   ```sql
   SELECT first_name, department, salary
   FROM employees e1
   WHERE salary > (SELECT ROUND(AVG(salary)) 
                   FROM employees e2 WHERE e1.department = e2.department);
   ```

### 2. **Aggregation Functions**
   - Use of functions like `SUM()`, `COUNT()`, `AVG()`, `MAX()`, and `MIN()` to summarize and analyze data.
   - **Example:** Calculating the maximum salary per department.
   ```sql
   SELECT department, MAX(salary) AS max_sal
   FROM employees
   GROUP BY department;
   ```

### 3. **String Manipulation**
   - Various string functions like `SUBSTRING()`, `REPLACE()`, `UPPER()`, and `LOWER()` to manipulate and extract parts of strings.
   - **Example:** Extracting domain names from email addresses.
   ```sql
   SELECT email, SUBSTRING(email, POSITION('@' IN email) + 1) AS domain
   FROM employees;
   ```

### 4. **Conditional Expressions (CASE)**
   - Using `CASE` statements to categorize data into groups based on certain conditions.
   - **Example:** Categorizing employees by salary range.
   ```sql
   SELECT first_name, salary,
   CASE
       WHEN salary < 100000 THEN 'Under Paid'
       WHEN salary > 100000 AND salary < 150000 THEN 'Paid Well'
       ELSE 'Executive'
   END AS category
   FROM employees;
   ```

### 5. **Data Transposition**
   - Transforming data by using `CASE` expressions and `SUM()` to create a pivot-like structure.
   - **Example:** Transposing employee counts by department.
   ```sql
   SELECT SUM(CASE WHEN department = 'Sports' THEN 1 ELSE 0 END) AS Sports_dept,
   SUM(CASE WHEN department = 'Tools' THEN 1 ELSE 0 END) AS Tools_dept,
   SUM(CASE WHEN department = 'Clothing' THEN 1 ELSE 0 END) AS Clothing_dept
   FROM employees;
   ```

### 6. **Grouping and Filtering Aggregated Data (HAVING Clause)**
   - Using the `GROUP BY` clause to aggregate data and `HAVING` to filter aggregated results.
   - **Example:** Departments with more than 35 employees.
   ```sql
   SELECT department, COUNT(*) AS employee_count
   FROM employees
   GROUP BY department
   HAVING COUNT(*) > 35;
   ```

### 7. **Subqueries**
   - Subqueries used to compare sets of data or perform calculations that depend on other rows in the table.
   - **Example:** Finding the departments with more than 38 employees.
   ```sql
   SELECT department
   FROM departments d
   WHERE 38 < (SELECT COUNT(*) FROM employees e WHERE e.department = d.department);
   ```

### 8. **Ordering and Limiting Results**
   - Use of `ORDER BY` to sort query results and `LIMIT` to restrict the number of rows returned.
   - **Example:** Displaying the top 10 highest-paid employees.
   ```sql
   SELECT first_name, salary
   FROM employees
   WHERE salary > 160000
   ORDER BY salary DESC
   LIMIT 10;
   ```

### 9. **Handling NULL Values**
   - Techniques for dealing with `NULL` values, such as using `COALESCE()` to provide default values or checking for `NULL` directly.
   - **Example:** Replacing `NULL` email addresses with "NONE".
   ```sql
   SELECT COALESCE(email, 'NONE') AS email
   FROM employees;
   ```
