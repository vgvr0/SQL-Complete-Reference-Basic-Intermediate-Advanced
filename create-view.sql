-- Assuming we have two tables: Customers and Orders
-- Customers table has columns: CustomerID, CustomerName, ContactName, Country, City
-- Orders table has columns: OrderID, CustomerID, Product, OrderDate

-- We want to create a view that shows detailed information about the customer along with their orders

CREATE VIEW Detailed_Customer_Orders AS
SELECT 
    Customers.CustomerID AS 'Customer ID',  -- Customer's ID
    Customers.CustomerName AS 'Customer Name',  -- Customer's Name
    Customers.ContactName AS 'Contact Name',  -- Customer's Contact Name
    Customers.Country AS 'Country',  -- Customer's Country
    Customers.City AS 'City',  -- Customer's City
    Orders.OrderID AS 'Order ID',  -- Order's ID
    Orders.Product AS 'Product',  -- Ordered Product
    Orders.OrderDate AS 'Order Date'  -- Date when the order was placed
FROM 
    Customers  -- From Customers table
JOIN 
    Orders  -- Join with Orders table
ON 
    Customers.CustomerID = Orders.CustomerID;  -- On condition that Customer's ID matches with the one in Orders

-- Now you can query the view as if it were a regular table
SELECT * FROM Detailed_Customer_Orders;

-- You can also filter the results based on specific conditions. For example, to see all orders from customers in a specific city:
SELECT * FROM Detailed_Customer_Orders WHERE City = 'Berlin';

-- Or to see all orders for a specific product:
SELECT * FROM Detailed_Customer_Orders WHERE Product = 'Apple';
