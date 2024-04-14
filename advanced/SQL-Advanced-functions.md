# Advanced SQL Functions and Usage Examples

Welcome to the advanced section of SQL where we dive into complex functions and provide practical examples to demonstrate their use. This guide is intended for those who have a good grasp of SQL basics and are looking to expand their knowledge.

## Table of Contents
- Window Functions
- Common Table Expressions (CTEs)
- Recursive Queries
- Pivoting Data
- Dynamic SQL

## Window Functions
Window functions perform calculations across a set of table rows that are somehow related to the current row.

### ROW_NUMBER
Assigns a unique sequential integer to rows within a partition of a result set.

```sql
SELECT name, salary, 
       ROW_NUMBER() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;
```
### RANK
Assigns a rank to each row within a partition of a result set, with gaps in rank values for ties.

```sql
SELECT name, salary, 
       RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;
```
## Common Table Expressions (CTEs)
CTEs allow you to name a subquery block, making your queries more readable and modular.

### Simple CTE
```sql
WITH ranked_salaries AS (
    SELECT name, salary,
           RANK() OVER (ORDER BY salary DESC) AS rank
    FROM employees
)
SELECT * FROM ranked_salaries WHERE rank <= 5;
```
## Recursive Queries
Recursive queries are used to query hierarchical data or perform complex joins.

### Recursive CTE

```sql
WITH RECURSIVE subordinates AS (
    SELECT employee_id, manager_id, name
    FROM employees
    WHERE manager_id IS NULL
    UNION ALL
    SELECT e.employee_id, e.manager_id, e.name
    FROM employees e
    INNER JOIN subordinates s ON s.employee_id = e.manager_id
)
SELECT * FROM subordinates;
```
## Pivoting Data
Pivoting transforms rows into columns, allowing you to perform row-to-column transposition.

### Using PIVOT
```sql
SELECT * FROM 
(
    SELECT year, product, amount
    FROM sales
) AS source_table
PIVOT
(
    SUM(amount)
    FOR year IN ([2020], [2021], [2022])
) AS pivot_table;

```
## Dynamic SQL
Dynamic SQL is a programming technique that allows you to build SQL statements dynamically at runtime.

### Executing a Dynamic Query
```sql
DECLARE @table_name NVARCHAR(100) = N'employees';
DECLARE @sql NVARCHAR(MAX);

SET @sql = N'SELECT * FROM ' + @table_name;
EXEC sp_executesql @sql;
```

## Conclusion
Advanced SQL functions are powerful tools that can greatly enhance your data manipulation capabilities. By mastering these functions, you’ll be able to tackle complex data challenges with ease.
