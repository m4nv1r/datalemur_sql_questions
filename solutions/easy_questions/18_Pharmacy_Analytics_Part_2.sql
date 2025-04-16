with losses_data as (
  select 
    *, 
    cogs - total_sales as loss 
  from pharmacy_sales 
  where (cogs - total_sales) > 0
)
select 
  manufacturer, 
  count(*) drug_count, 
  sum(loss) as total_loss 
from losses_data 
group by manufacturer
order by total_loss desc
;