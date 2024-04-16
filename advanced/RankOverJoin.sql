WITH Ranked_Products AS (
  SELECT 
    p.product_id,
    p.product_name,
    p.price,
    RANK() OVER (ORDER BY p.price DESC) AS price_rank
  FROM 
    products p
),
Top_Customers AS (
  SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(o.total_amount) AS total_spent,
    COUNT(o.order_id) AS order_count,
    RANK() OVER (ORDER BY SUM(o.total_amount) DESC) AS spending_rank
  FROM 
    customers c
  JOIN 
    orders o ON c.customer_id = o.customer_id
  GROUP BY 
    c.customer_id, c.first_name, c.last_name
)
SELECT 
  tc.customer_id,
  CONCAT(tc.first_name, ' ', tc.last_name) AS customer_name,
  tc.total_spent,
  tc.order_count,
  tc.spending_rank,
  rp.product_name,
  rp.price,
  rp.price_rank
FROM 
  Top_Customers tc
JOIN 
  order_details od ON tc.customer_id = od.customer_id
JOIN 
  Ranked_Products rp ON od.product_id = rp.product_id
WHERE 
  rp.price_rank <= 5 AND tc.spending_rank <= 10
ORDER BY 
  tc.spending_rank, rp.price_rank;
