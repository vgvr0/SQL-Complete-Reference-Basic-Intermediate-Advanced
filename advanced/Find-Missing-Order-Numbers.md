This script demonstrates how to find gaps in sequential data in SQL. It first creates a temporary table named `TempOrders` and inserts a sequence of order numbers into it, intentionally skipping some numbers. Then it uses two Common Table Expressions (CTEs) to generate a sequence of numbers that spans the range of order numbers and to find the order numbers that are missing from the sequence. Finally, it drops the temporary table.

```sql
-- Create a temporary table to store order numbers
-- This command creates a new temporary table named TempOrders with a single column for order numbers.
CREATE TEMPORARY TABLE TempOrders
(
    OrderNumber INT
);

-- Insert some test data into the temporary table
-- This command inserts a sequence of order numbers into the TempOrders table, intentionally skipping some numbers to create gaps in the sequence.
INSERT INTO TempOrders (OrderNumber)
VALUES 
    (1), (2), (3), (5), (6), (8), (10), (11), (12), (14), (15), (17), (18), (20);

-- Create a Common Table Expression (CTE) to find the range of order numbers
-- This CTE, named OrderRange, calculates the minimum and maximum order numbers in the TempOrders table.
WITH OrderRange AS (
    SELECT MIN(OrderNumber) AS StartSeq, MAX(OrderNumber) AS EndSeq
    FROM TempOrders
), 
-- Create a Common Table Expression (CTE) to generate a sequence of numbers
-- This recursive CTE, named NumberSequence, generates a sequence of numbers from the minimum to the maximum order number.
NumberSequence AS (
    SELECT StartSeq AS OrderNumber
    FROM OrderRange
    UNION ALL
    SELECT OrderNumber + 1
    FROM NumberSequence
    WHERE OrderNumber < (SELECT EndSeq FROM OrderRange)
)
-- Select the missing order numbers from the sequence
-- This SELECT statement joins the generated sequence of numbers with the TempOrders table and finds the numbers that are in the sequence but not in the TempOrders table.
SELECT NS.OrderNumber AS MissingOrderNumber
FROM NumberSequence NS
LEFT JOIN TempOrders TO ON NS.OrderNumber = TO.OrderNumber
WHERE TO.OrderNumber IS NULL
OPTION (MAXRECURSION 0);

-- Drop the temporary table
-- This command removes the TempOrders table from the database.
DROP TABLE TempOrders;

```
