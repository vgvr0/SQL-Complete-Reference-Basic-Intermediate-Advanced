# Commonly Used SQL Functions

## 1. COUNT()
Counts the number of rows that match the specified criteria.
Returns the total number of non-null values in a column.
```sql
SELECT COUNT(*) FROM employees
```
```sql
-- Count the number of employees in each department
SELECT department, COUNT(*) FROM employees GROUP BY department;
```
## 2. SUM()
Calculates the sum of a set of values.
Returns the total sum of a numeric column.
```sql
SELECT SUM(salary) FROM employees
```
```sql
-- Calculate the total sum of salaries in each department
SELECT department, SUM(salary) FROM employees GROUP BY department;
```
## 3. AVG()
Calculates the average value of a set of values.
Returns the average value of a numeric column.
```sql
SELECT AVG(salary) FROM employees
```
```sql
-- Calculate the average salary in each department
SELECT department, AVG(salary) FROM employees GROUP BY department;
```
## 4. MAX()
Returns the maximum value in a set of values.
Finds the highest value in a specified column.
```sql
SELECT MAX(salary) FROM employees
```
## 5. MIN()
Returns the minimum value in a set of values.
Finds the lowest value in a specified column.
```sql
SELECT MIN(salary) FROM employees
```
## 6. CONCAT()
Concatenates two or more strings together.
Joins multiple strings into a single string.
```sql
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees
```
## 7. SUBSTRING()
Extracts a substring from a string.
Returns a specified part of a string.
```sql
SELECT SUBSTRING(phone_number, 1, 3) AS area_code FROM employees
```
## 8. LOWER()
Converts a string to lowercase.
Returns the string with all characters in lowercase.
```sql
SELECT LOWER(first_name) FROM employees
```
## 9. UPPER()
Converts a string to uppercase.
Returns the string with all characters in uppercase.
```sql
SELECT UPPER(last_name) FROM employees
```
## 10. LENGTH()
Returns the length of a string.
Calculates the number of characters in a string.
```sql
SELECT LENGTH(first_name) AS name_length FROM employees
```
## 11. ROUND()
Rounds a numeric value to a specified number of decimal places.
Returns the rounded value of a number.
```sql
SELECT ROUND(salary, 2) FROM employees
```
```sql
-- Round the salary to the nearest whole number
SELECT ROUND(salary) FROM employees;
```
## 12. CURRENT_DATE()
Returns the current date.
Retrieves the current date from the system.
```sql
SELECT CURRENT_DATE()
```
```sql
-- Select the current date and an employee's name
SELECT CURRENT_DATE(), first_name FROM employees;
```
## 13. CURRENT_TIME()
Returns the current time.
Retrieves the current time from the system.
```sql
SELECT CURRENT_TIME()
```
```sql
-- Select the current time and an employee's name
SELECT CURRENT_TIME(), first_name FROM employees;
```
## 14. DATE_FORMAT()
Formats a date according to a specified format.
Returns a formatted date string.
```sql
SELECT DATE_FORMAT(hire_date, '%Y-%m-%d') FROM employees
```
```sql
-- Format the hire date as day-month-year
SELECT DATE_FORMAT(hire_date, '%d-%m-%Y') FROM employees;
```
## 15. GROUP_CONCAT()
Concatenates strings from a group of rows into a single string.
Returns a concatenated string with values from a group.
```sql
SELECT department, GROUP_CONCAT(first_name) AS employees FROM employees GROUP BY department
```
```sql
-- Concatenate all employee names in each department separated by a semicolon
SELECT department, GROUP_CONCAT(first_name ORDER BY first_name ASC SEPARATOR '; ') AS employees FROM employees GROUP BY department;
```
