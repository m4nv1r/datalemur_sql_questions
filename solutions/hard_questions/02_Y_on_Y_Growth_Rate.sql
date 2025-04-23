with temp_data as (
  select 
    extract(year from transaction_date) as year,
    product_id,
    sum(spend) as total_spend
  from user_transactions
  group by product_id, year
), temp_data_2 as (
select 
  year,
  product_id,
  total_spend as curr_year_spend,
  lag(total_spend, 1) over(
  partition by product_id 
  order by year
  ) as prev_year_spend
from temp_data
)
select 
  year,
  product_id,
  curr_year_spend,
  prev_year_spend,
  round(100.0*(curr_year_spend-prev_year_spend)/prev_year_spend, 2) as yoy_rate
from temp_data_2
order by product_id, year
;
