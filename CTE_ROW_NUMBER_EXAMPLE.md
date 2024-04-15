This SQL query uses the `ROW_NUMBER()` function to assign a unique row number to each employee within their respective department, sorted by their salary in descending order. This is done within a Common Table Expression (CTE) named Employee_CTE.

In the main query, it selects the employees from Employee_CTE and joins them with the Departments table to get the department name. Finally, it filters to only get the top three highest-paid employees from each department.

The result is a list of employees, with each row containing the employee’s ID, first name, last name, department ID, salary, department name, and their rank within their department based on salary. The employees are ordered by their department ID and their rank within the department.

```sql
WITH Employee_CTE AS (
    SELECT 
        EmployeeID,
        FirstName,
        LastName,
        DepartmentID,
        Salary,
        ROW_NUMBER() OVER (
            PARTITION BY DepartmentID 
            ORDER BY Salary DESC
        ) AS RowNumber
    FROM 
        Employees
)
SELECT 
    E1.EmployeeID,
    E1.FirstName,
    E1.LastName,
    E1.DepartmentID,
    E1.Salary,
    D.DepartmentName,
    E1.RowNumber
FROM 
    Employee_CTE E1
JOIN 
    Departments D ON E1.DepartmentID = D.DepartmentID
WHERE 
    E1.RowNumber <= 3
ORDER BY 
    E1.DepartmentID,
    E1.RowNumber;

```
