WITH Customer_Spending AS (
  SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    SUM(o.total_amount) AS total_spent,
    COUNT(o.order_id) AS total_orders,
    RANK() OVER (ORDER BY SUM(o.total_amount) DESC) AS spending_rank
  FROM 
    customers c
  JOIN 
    orders o ON c.customer_id = o.customer_id
  GROUP BY 
    c.customer_id
),
Product_Sales AS (
  SELECT 
    p.product_id,
    p.product_name,
    SUM(od.quantity) AS units_sold,
    SUM(od.quantity * od.unit_price) AS sales_revenue,
    RANK() OVER (ORDER BY SUM(od.quantity * od.unit_price) DESC) AS sales_rank
  FROM 
    products p
  JOIN 
    order_details od ON p.product_id = od.product_id
  GROUP BY 
    p.product_id
),
Recent_Orders AS (
  SELECT 
    o.order_id,
    o.customer_id,
    o.order_date,
    DATEDIFF(CURDATE(), o.order_date) AS days_since_order,
    ROW_NUMBER() OVER (PARTITION BY o.customer_id ORDER BY o.order_date DESC) AS recent_order_rank
  FROM 
    orders o
)
SELECT 
  cs.customer_name,
  cs.total_spent,
  cs.total_orders,
  cs.spending_rank,
  ps.product_name,
  ps.units_sold,
  ps.sales_revenue,
  ps.sales_rank,
  ro.order_id,
  ro.order_date,
  ro.days_since_order
FROM 
  Customer_Spending cs
JOIN 
  Product_Sales ps ON cs.customer_id = ps.product_id
JOIN 
  Recent_Orders ro ON cs.customer_id = ro.customer_id
WHERE 
  cs.spending_rank <= 10 AND ps.sales_rank <= 5 AND ro.recent_order_rank = 1
ORDER BY 
  cs.spending_rank, ps.sales_rank, ro.days_since_order;
