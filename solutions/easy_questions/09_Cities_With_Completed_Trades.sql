SELECT 
  city,
  count(*) as total_orders
FROM trades 
  join users 
    on trades.user_id = users.user_id 
where status = 'Completed'
group by city
order by total_orders desc
limit 3
;