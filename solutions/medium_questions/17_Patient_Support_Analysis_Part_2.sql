with temp_data as (
select 
  case when call_category is null or call_category = 'n/a' then 1 else 0 end as not_categorised
from callers
)
select 
  round((100.0*sum(not_categorised))/count(*), 1) as uncategorised_call_pct
from temp_data
;