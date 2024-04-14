# Intermediate SQL Functions

Welcome to the **Intermediate SQL Functions** guide. This document aims to delve deeper into SQL, providing you with a comprehensive understanding of intermediate-level operations and techniques. You'll find enhanced examples that will help you refine your SQL skills.

## Table of Contents
- Joins
- Subqueries
- Indexes
- Views
- Complex WHERE Clauses
- Aggregate Functions
- Group By and Having Clauses

## Joins
Combining data from multiple tables is essential in SQL. Here's how to use different types of joins to retrieve exactly what you need.

### INNER JOIN
Fetches records that have matching values in both tables.

```sql
SELECT orders.order_id, customers.customer_name
FROM orders
INNER JOIN customers ON orders.customer_id = customers.customer_id;
```

## LEFT JOIN
Returns all records from the left table, and the matched records from the right table.

```sql
SELECT customers.customer_name, orders.order_id
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id;
```
## RIGHT JOIN
Returns all records from the right table, and the matched records from the left table.
```sql
SELECT employees.employee_name, payroll.payroll_id
FROM employees
RIGHT JOIN payroll ON employees.employee_id = payroll.employee_id;
```
## FULL OUTER JOIN
Selects all records when there is a match in either left or right table.
```sql
SELECT suppliers.supplier_name, orders.order_id
FROM suppliers
FULL OUTER JOIN orders ON suppliers.supplier_id = orders.supplier_id;
```
## Subqueries
Subqueries allow you to nest queries within other queries to perform complex operations.

```sql
SELECT employee_name
FROM employees
WHERE employee_id IN (SELECT employee_id FROM payroll WHERE salary > 50000);
```
## Indexes
Creating indexes on tables can significantly improve query performance.
```sql
CREATE INDEX idx_employee_name
ON employees (employee_name);
```
## Views
Views are virtual tables that result from a query and can simplify complex queries.
```sql
CREATE VIEW view_customer_orders AS
SELECT customers.customer_name, COUNT(orders.order_id) AS number_of_orders
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_name;
```
## Complex WHERE Clauses
Utilize operators and conditions to filter data effectively.

```sql
SELECT * FROM products
WHERE (price BETWEEN 10 AND 20) AND NOT category_id IN (3, 4, 5);
```
## Aggregate Functions
Aggregate functions perform a calculation on a set of values and return a single value.
```sql
SELECT COUNT(customer_id), country
FROM customers
GROUP BY country;
```
## Group By and Having Clauses
These clauses are used to group rows that have the same values in specified columns and to filter groups by certain conditions.
```sql
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 100000;
```
## Conclusion
Mastering these intermediate SQL functions will enhance your ability to work with complex data sets and perform sophisticated data analysis. Practice these examples and explore beyond to become proficient in SQL.
