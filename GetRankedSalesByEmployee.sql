CREATE FUNCTION GetCustomerOrderReport(@startDate DATE, @endDate DATE)
RETURNS TABLE
AS
RETURN (
    WITH RankedOrders AS (
        SELECT 
            CustomerID, 
            OrderID, 
            OrderDate, 
            TotalAmount,
            ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY TotalAmount DESC) AS OrderRank
        FROM 
            Orders
        WHERE 
            OrderDate BETWEEN @startDate AND @endDate
    ),
    FrequentCustomers AS (
        SELECT 
            CustomerID, 
            COUNT(*) AS TotalOrders,
            AVG(TotalAmount) AS AverageOrderAmount
        FROM 
            Orders
        WHERE 
            OrderDate BETWEEN @startDate AND @endDate
        GROUP BY 
            CustomerID
        HAVING 
            COUNT(*) > 5
    )
    SELECT 
        R.CustomerID, 
        R.OrderID, 
        R.OrderDate, 
        R.TotalAmount, 
        R.OrderRank,
        F.TotalOrders,
        F.AverageOrderAmount
    FROM 
        RankedOrders R
    INNER JOIN 
        FrequentCustomers F ON R.CustomerID = F.CustomerID
    WHERE 
        R.OrderRank = 1
)
