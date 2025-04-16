SELECT 
  drug,
  total_sales - cogs as total_profit
FROM pharmacy_sales
order by total_profit DESC
limit 3
;