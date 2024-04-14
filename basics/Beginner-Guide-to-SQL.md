# Beginner's Guide to SQL

Welcome to the **Beginner's Guide to SQL**. This document is designed to help you take your first steps into the world of SQL databases. Here you'll find examples of basic functions that will enable you to manipulate and query data effectively.

## What is SQL?

SQL stands for **Structured Query Language**, a programming language designed for managing and manipulating relational databases. It is the de facto standard for querying and modifying data stored in relational database management systems (RDBMS).

## Basic Operations in SQL

The most fundamental operations in SQL are known as CRUD, which stands for **Create**, **Read**, **Update**, and **Delete**.

### SELECT

The `SELECT` statement is used to select data from a database. The data returned is stored in a result table.

```sql
-- Select all columns from a table named 'employees'
SELECT * FROM employees;

-- Select specific columns (employee ID and name) from the 'employees' table
SELECT employee_id, employee_name FROM employees;

-- Select employees from the 'employees' table who are in the 'Sales' department
SELECT * FROM employees WHERE department = 'Sales';

```

## INSERT
The `INSERT INTO` statement is used to insert new records into a table.

```sql
-- Insert specific data into columns of a table named 'customers'
INSERT INTO customers (customer_name, email) VALUES ('John Doe', 'john@example.com');

-- Insert data into all columns of the 'customers' table
INSERT INTO customers VALUES (1, 'Jane Smith', 'jane@example.com', 'New York');

-- Insert multiple rows into a table named 'orders'
INSERT INTO orders (order_id, customer_id, order_date)
VALUES 
    (101, 1, '2024-04-14'),
    (102, 2, '2024-04-15'),
    (103, 3, '2024-04-16');

```

## UPDATE
The `UPDATE` statement is used to modify existing records in a table.
```sql
-- Update specific records in the table with new values for column1 where the condition is met
UPDATE table_name SET column1 = value1 WHERE condition;

-- Update multiple columns in the table with new values for column1 and column2 where the condition is met
UPDATE table_name SET column1 = value1, column2 = value2 WHERE condition;

-- Update the table using a subquery to set the value of column1 based on the result of the subquery, where the condition is met
UPDATE table_name SET column1 = (SELECT expression) WHERE condition;

```
For example: 
```sql
-- Update specific records in the table 'employees' to set their 'status' to 'active' where 'department' is 'Sales'
UPDATE employees SET status = 'active' WHERE department = 'Sales';

-- Update multiple columns in the table 'products' to set 'price' to 10.99 and 'stock' to 100 where 'category' is 'Electronics'
UPDATE products SET price = 10.99, stock = 100 WHERE category = 'Electronics';

-- Update the table 'orders' to set the 'total_price' column based on the sum of prices from the 'order_items' table for each order, where 'order_id' matches
UPDATE orders 
SET total_price = (
    SELECT SUM(price) 
    FROM order_items 
    WHERE order_items.order_id = orders.order_id
) 
WHERE condition;
```
## DELETE
The `DELETE` statement is used to delete existing records from a table.
```sql
-- Delete specific records from the table where the condition is met
DELETE FROM table_name WHERE condition;

-- Delete all records from the table
DELETE FROM table_name;

-- Delete records from the table using a subquery to match values in a column with values from another table based on certain conditions
DELETE FROM table_name WHERE column_name IN (SELECT column_name FROM another_table WHERE condition);

```

For example: 
```sql
-- Delete specific records from the table 'employees' where the 'department' is 'HR'
DELETE FROM employees WHERE department = 'HR';

-- Delete all records from the table 'customers'
DELETE FROM customers;

-- Delete records from the table 'orders' where the 'customer_id' matches the 'customer_id' in the 'customers' table where the 'country' is 'USA'
DELETE FROM orders WHERE customer_id IN (SELECT customer_id FROM customers WHERE country = 'USA');
```
## Conclusion
This has been a brief overview of the basic operations in SQL. With practice and time, you’ll learn to perform more complex queries and handle databases with confidence.

