with temp_data as (
select
  category,
  product,
  sum(spend) as total_spend
from product_spend
where extract(year from transaction_date) = '2022'
group by
  category,
  product
), temp_data_2 as (
select 
  category,
  product,
  total_spend,
  row_number() over (partition by category order by total_spend desc) as rn
from temp_data
)
select 
  category,
  product,
  total_spend
from temp_data_2
where rn in (1,2)
;