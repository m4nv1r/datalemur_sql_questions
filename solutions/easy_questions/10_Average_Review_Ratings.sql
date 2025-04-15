with temp_data as (
  select 
    *, 
    extract(month from submit_date) as month 
  from reviews
)
select 
  month, 
  product_id,
  round(avg(stars),2) as avg_stars
from temp_data 
group by 
  month, 
  product_id 
order by 
  month, 
  product_id
;