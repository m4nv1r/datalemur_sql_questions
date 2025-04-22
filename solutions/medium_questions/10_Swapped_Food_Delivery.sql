with odd_data as (
  select 
    order_id + 1 as order_id_temp,
    item 
  from orders 
  where (order_id % 2 = 1)
  and order_id not in (select max(order_id) from orders)
), even_data as (
  select 
    order_id - 1 as order_id_temp,
    item 
  from orders 
  where (order_id % 2 = 0)
), last_row as (
select 
  order_id as order_id_temp,
  item
from orders 
where (order_id % 2 = 1)
  and order_id in (select max(order_id) from orders)
),temp_data as (
(select * from odd_data)
UNION
(select * from even_data)
UNION 
(select * from last_row)
)
select 
  order_id_temp as order_id,
  item
from temp_data 
order by order_id_temp
;
