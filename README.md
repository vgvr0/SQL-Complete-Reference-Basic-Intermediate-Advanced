# Commonly Used SQL Functions

## 1. COUNT()
Counts the number of rows that match the specified criteria.
Returns the total number of non-null values in a column.
```sql
SELECT COUNT(*) FROM employees;
```
## 2. SUM()
Calculates the sum of a set of values.
Returns the total sum of a numeric column.
```
SELECT SUM(salary) FROM employees;
```
## 3. AVG()
Calculates the average value of a set of values.
Returns the average value of a numeric column.
```
SELECT AVG(salary) FROM employees;
```
## 4. MAX()
Returns the maximum value in a set of values.
Finds the highest value in a specified column.
```
SELECT MAX(salary) FROM employees;
```
## 5. MIN()
Returns the minimum value in a set of values.
Finds the lowest value in a specified column.
```
SELECT MIN(salary) FROM employees;
```
## 6. CONCAT()
Concatenates two or more strings together.
Joins multiple strings into a single string.
```
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;
```
## 7. SUBSTRING()
Extracts a substring from a string.
Returns a specified part of a string.
```
SELECT SUBSTRING(phone_number, 1, 3) AS area_code FROM employees;
```
## 8. LOWER()
Converts a string to lowercase.
Returns the string with all characters in lowercase.
```
SELECT LOWER(first_name) FROM employees;
```
## 9. UPPER()
Converts a string to uppercase.
Returns the string with all characters in uppercase.
```
SELECT UPPER(last_name) FROM employees;
```
## 10. LENGTH()
Returns the length of a string.
Calculates the number of characters in a string.
```
SELECT LENGTH(first_name) AS name_length FROM employees;
```
## 11. ROUND()
Rounds a numeric value to a specified number of decimal places.
Returns the rounded value of a number.
```
SELECT ROUND(salary, 2) FROM employees;
```
## 12. CURRENT_DATE()
Returns the current date.
Retrieves the current date from the system.
```
SELECT CURRENT_DATE();
```
## 13. CURRENT_TIME()
Returns the current time.
Retrieves the current time from the system.
```
SELECT CURRENT_TIME();
```
## 14. DATE_FORMAT()
Formats a date according to a specified format.
Returns a formatted date string.
```
SELECT DATE_FORMAT(hire_date, '%Y-%m-%d') FROM employees;
```
## 15. GROUP_CONCAT()
Concatenates strings from a group of rows into a single string.
Returns a concatenated string with values from a group.
```
SELECT department, GROUP_CONCAT(first_name) AS employees FROM employees GROUP BY department;
```
