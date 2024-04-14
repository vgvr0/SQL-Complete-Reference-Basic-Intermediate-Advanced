# SQL functions

This repository contains examples of the main categories of SQL functions, including aggregation functions, string functions, date and time functions, comparison functions, logical functions, conversion functions, and system functions.

## Content

- [Aggregation functions](#aggregation-functions)
- [String functions](#string-functions)
- [Date and time functions](#date-and-time-functions)
- [Comparison functions](#comparison-functions)
- [Logical functions](#logical-functions)
- [Conversion functions](#conversion-functions)
- [System functions](#system-functions)
- [Window-functions](#window-functions)
  
## Aggregation functions
Aggregation functions calculate summary values ​​from data sets.

Example:
```sql
SELECT SUM(salary) FROM employees;
```
Other aggregation functions include:
```sql
SELECT AVG(price) FROM products;
SELECT COUNT(DISTINCT customer_id) FROM orders;
SELECT MAX(score) FROM exams;
SELECT MIN(age) FROM users;
```
## String Functions
String functions manipulate text strings.

Example:
```sql
SELECT UPPER(name) FROM customers;
```
Other string functions include:
```sql
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;
SELECT SUBSTRING(phone_number, 1, 3) AS area_code FROM contacts;
SELECT LENGTH(address) FROM locations;
SELECT TRIM(LEADING ' ' FROM username) FROM accounts;
```
## Date and Time Functions
These functions work with date and time values.

Example:
```sql
SELECT DATE(datetime_column) FROM events;
```
Other date and time functions include:
```sql
SELECT YEAR(hire_date) FROM employees;
SELECT MONTH(birth_date) FROM students;
SELECT CURRENT_TIMESTAMP();
SELECT DATEDIFF(end_date, start_date) AS duration FROM projects;
```
## Comparison Functions
Comparison functions compare values and return boolean values (TRUE or FALSE).

Example:
```sql
SELECT * FROM users WHERE age = 30;
```
Other comparison functions include:
```sql
SELECT * FROM products WHERE price > 100;
SELECT * FROM orders WHERE status <> 'Completed';
SELECT * FROM employees WHERE hire_date BETWEEN '2020-01-01' AND '2020-12-31';
SELECT * FROM customers WHERE name LIKE 'J%';
```
## Logical Functions
Logical functions perform logical operations on boolean values.

Example:
```sql
SELECT * FROM customers WHERE age > 18 AND city = 'New York';
```
Other logical functions include:
```sql
SELECT * FROM orders WHERE status = 'Pending' OR status = 'Processing';
SELECT * FROM students WHERE NOT graduated;
SELECT * FROM products WHERE category IN ('Electronics', 'Clothing');
SELECT * FROM users WHERE email IS NULL;
```
## Conversion Functions
Conversion functions convert values from one data type to another.

Example:
```sql
SELECT CAST(quantity AS VARCHAR) FROM inventory;
```
Other conversion functions include:
```sql
SELECT CONVERT(price, DECIMAL(10,2)) FROM products;
SELECT CAST(order_date AS DATE) FROM orders;
SELECT CAST(is_active AS INTEGER) FROM users;
SELECT CAST(CONCAT(first_name, ' ', last_name) AS CHAR(50)) FROM employees;
```
## System Functions
System functions provide information about the system or database.

Example:
```sql
SELECT USER();
```
Other system functions include:
```sql
SELECT DATABASE();
SELECT VERSION();
SELECT CURRENT_USER();
SELECT LAST_INSERT_ID();
```
## Window Functions
Window functions perform calculations across a set of rows that are related to the current row.

Example:
```sql
SELECT employee_id, department, salary, AVG(salary) OVER (PARTITION BY department) AS avg_department_salary FROM employees;
```
Other window functions include:
```sql
SELECT product_id, category, price, RANK() OVER (PARTITION BY category ORDER BY price DESC) AS price_rank FROM products;
SELECT order_id, customer_id, order_date, LAG(order_date) OVER (PARTITION BY customer_id ORDER BY order_date) AS previous_order_date FROM orders;
SELECT student_id, subject, score, DENSE_RANK() OVER (PARTITION BY subject ORDER BY score DESC) AS subject_rank FROM exam_results;
SELECT sales_rep, order_date, sales_amount, SUM(sales_amount) OVER (PARTITION BY sales_rep ORDER BY order_date) AS running_total FROM sales;
```
