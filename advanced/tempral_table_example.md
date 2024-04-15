This script demonstrates the creation and usage of a temporary table in SQL. 

It first creates a temporary table named `TempEmployees` and inserts some employee data into it. 

Then it performs a query to calculate the average salary for each department. Finally, it drops the temporary table to clean up the database. 

´´´sql
-- Create a temporary table
-- This command creates a new temporary table named TempEmployees with five columns.
CREATE TEMPORARY TABLE TempEmployees
(
    EmployeeID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2)
);

-- Insert data into the temporary table
-- This command inserts 10 rows of employee data into the TempEmployees table.
INSERT INTO TempEmployees (EmployeeID, FirstName, LastName, DepartmentID, Salary)
VALUES 
    (1, 'John', 'Doe', 1, 50000),
    (2, 'Jane', 'Doe', 2, 60000),
    (3, 'Jim', 'Smith', 1, 55000),
    (4, 'Jill', 'Johnson', 3, 70000),
    (5, 'Jake', 'Williams', 2, 65000),
    (6, 'Judy', 'Brown', 3, 75000),
    (7, 'Jack', 'Davis', 1, 80000),
    (8, 'Julia', 'Miller', 2, 85000),
    (9, 'Joe', 'Wilson', 3, 90000),
    (10, 'Jennifer', 'Moore', 1, 95000);

-- Perform a query on the temporary table
-- This command selects the DepartmentID and the average Salary from the TempEmployees table, groups the results by DepartmentID, and orders the results by the average Salary in descending order.
SELECT 
    DepartmentID, 
    AVG(Salary) AS AverageSalary
FROM 
    TempEmployees
GROUP BY 
    DepartmentID
ORDER BY 
    AverageSalary DESC;

-- Drop the temporary table
-- This command removes the TempEmployees table from the database.
DROP TABLE TempEmployees;
```
