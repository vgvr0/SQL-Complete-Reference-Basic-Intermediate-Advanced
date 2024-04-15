-- Let's say we have a database of employees and their sales records.
-- We want to find the top-performing employees in terms of sales for the current year.

-- We start by defining a CTE that calculates the total sales per employee for the current year.
WITH SalesCTE AS (
    SELECT 
        EmployeeID, 
        SUM(SaleAmount) AS TotalSales
    FROM 
        SalesRecords
    WHERE 
        YEAR(SaleDate) = YEAR(GETDATE())
    GROUP BY 
        EmployeeID
)

-- Now, we want to rank the employees based on their total sales.
-- We use the CTE we just created and join it with the Employees table to get more details.
, RankedEmployees AS (
    SELECT 
        E.EmployeeID, 
        E.FirstName, 
        E.LastName, 
        S.TotalSales,
        RANK() OVER (ORDER BY S.TotalSales DESC) AS SalesRank
    FROM 
        Employees E
    INNER JOIN 
        SalesCTE S ON E.EmployeeID = S.EmployeeID
)

-- Finally, we select the top 5 employees from the ranked list.
SELECT 
    FirstName, 
    LastName, 
    TotalSales, 
    SalesRank
FROM 
    RankedEmployees
WHERE 
    SalesRank <= 5;
