# SQL Cheat Sheet

Welcome to the SQL Cheat Sheet, your quick guide to basic, intermediate, and advanced SQL functions. Here you'll find practical examples for each type of function to help you understand how to use them in your queries.

## Basic SQL Functions

### SELECT
Used to select data from a database.
```sql
SELECT name, surname FROM users;
```

# Funciones SQL Útiles

## Funciones Básicas

### Funciones de Agregación

Las funciones de agregación calculan valores resumidos a partir de conjuntos de datos.

Ejemplo: Calcular la suma de salarios.

```sql
SELECT SUM(salary) AS total_salaries
FROM employees;
