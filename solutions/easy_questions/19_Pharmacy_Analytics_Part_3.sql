select 
  manufacturer,
  '$' || round((1.0*sum(total_sales))/1000000) || ' million' as sale
from pharmacy_sales
group by 
  manufacturer
order by 
  round((1.0*sum(total_sales))/1000000) desc, 
  manufacturer desc
;