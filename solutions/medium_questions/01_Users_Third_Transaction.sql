with temp_data as (
  select 
    *,
    row_number() over (partition by user_id order by transaction_date) as rn
  from transactions
)
select 
  user_id,
  spend,
  transaction_date
from temp_data 
where rn = 3
;