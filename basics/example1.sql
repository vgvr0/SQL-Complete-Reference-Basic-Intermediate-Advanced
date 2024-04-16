SELECT 
  CONCAT(c.first_name, ' ', c.last_name) AS full_name,
  COUNT(o.order_id) AS number_of_orders,
  SUM(od.quantity * od.unit_price) AS total_spent,
  AVG(p.price) AS average_product_price,
  MAX(p.price) AS highest_price,
  MIN(p.price) AS lowest_price,
  ROUND(AVG(p.price), 2) AS average_price_rounded,
  FLOOR(AVG(p.price)) AS average_price_floor,
  CEILING(AVG(p.price)) AS average_price_ceiling,
  SUBSTRING(p.description, 1, 10) AS short_description,
  DATEDIFF(CURDATE(), c.last_purchase_date) AS days_since_last_purchase,
  DATE_FORMAT(o.order_date, '%Y-%m-%d') AS formatted_order_date
FROM 
  customers c
JOIN 
  orders o ON c.customer_id = o.customer_id
JOIN 
  order_details od ON o.order_id = od.order_id
JOIN 
  products p ON od.product_id = p.product_id
GROUP BY 
  c.customer_id;
