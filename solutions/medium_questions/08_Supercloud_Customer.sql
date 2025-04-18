with product_count as (
  select 
    count(distinct product_category) pc 
  from products
)
select
  cc.customer_id
from customer_contracts cc 
  join products p 
    on cc.product_id = p.product_id
group by cc.customer_id
having count(distinct product_category) in (
  select 
    pc 
  from product_count
)
;