# MySQL Practice Session - Summary of Learnings

This practice session involved creating and managing a mock database called `practiceDB`, including creating tables, inserting mock data, and understanding relationships between different tables. The focus was on reinforcing foundational concepts in MySQL database management.

## Key Concepts Covered

### 1. Database Selection
   - **Command Used**: `USE practicedb;`
   - I learned how to select the correct database to ensure all subsequent operations are performed within the intended database.

### 2. Creating Tables
   - **Tables Created**: `departments`, `regions`, and `employees`
   - I learned the process of defining tables with appropriate column data types, specifying primary keys to ensure uniqueness, and adding constraints to maintain data integrity.

   - **Example**:
     ```sql
     CREATE TABLE departments (
         department VARCHAR(100),
         division VARCHAR(100),
         PRIMARY KEY(department)
     );
     ```
     - I learned that defining a `PRIMARY KEY` ensures uniqueness in the specified column (`department` in this case).

### 3. Inserting Data
   - **Tables Populated**: `departments`, `regions`, and `employees`
   - I practiced inserting data into tables using the `INSERT INTO` statement, which allowed me to populate the tables with mock data that simulated real-world scenarios.
   
   - **Example**:
     ```sql
     INSERT INTO departments (department, division)
     VALUES ('Clothing', 'Home');
     ```
     - This helped me understand how to insert multiple rows and how to manage various data types (e.g., `VARCHAR` for text, `INT` for numbers, and `DATE` for dates).

### 4. Table Relationships
   - The `employees` table includes a `region_id` column that references the `region_id` in the `regions` table, demonstrating a one-to-many relationship between regions and employees. This helped me understand how tables can be linked through foreign keys to model relationships in a database.

   - I also learned how to maintain data consistency by ensuring that the `employee_id` is a unique identifier for each employee and how the `region_id` in the `employees` table can link to the corresponding region in the `regions` table.

### 5. Handling NULL Values
   - While creating the `employees` table, I encountered rows where `last_name` or `email` were `NULL`. This gave me insights into handling missing or optional data.
   
   - **Example**:
     ```sql
     (4, 'Avrom', 'Rowantree', NULL, '2014-08-02', 'Phones & Tablets', 'M', 119674, 7),
     ```
     - I learned how to structure queries to allow `NULL` values for columns where data might not always be available.

### 6. Data Insertion for Large Data Sets
   - **Bulk Data Insertion**: I inserted 100 rows of employee data into the `employees` table.
   - I gained experience in inserting large amounts of data in one query, which is essential for initializing a database with significant data.

   - **Example**:
     ```sql
     INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, department, gender, salary, region_id)
     VALUES
         (1, 'Berrie', 'Manueau', 'bmanueau0@dion.ne.jp', '2006-04-20', 'Sports', 'F', 154864, 4),
         ...
         (100, 'Sashenka', 'Paris', 'sparis2r@si.edu', '2005-10-01', 'Furniture', 'F', 117137, 2);
     ```

### 7. Managing Data Types and Constraints
   - I explored various data types:
     - `VARCHAR` for text fields such as employee names and email addresses.
     - `INT` for numerical fields like `salary` and `region_id`.
     - `DATE` for storing dates such as the `hire_date`.

   - I also learned to apply constraints like `PRIMARY KEY` to ensure each employee has a unique `employee_id`, and each region has a unique `region_id`.

## Summary of Skills Developed

Through this practice session, I reinforced the following skills:
- **Database Setup**: Using the `USE` command to work within a specific database.
- **Table Design**: Creating tables with meaningful relationships and constraints.
- **Data Insertion**: Inserting both single and multiple rows of mock data.
- **Handling Relationships**: Understanding how to structure tables to model real-world relationships (e.g., linking employees to regions).
- **Data Integrity**: Applying primary keys and handling `NULL` values to maintain the integrity of the data.

This session provided valuable hands-on experience with MySQL, helping me gain confidence in creating, populating, and managing relational databases.
