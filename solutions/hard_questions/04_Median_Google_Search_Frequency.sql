with temp_data as (
  select 
    searches 
  from search_frequency
  group by searches, generate_series(1, num_users)
)
select 
  round(percentile_cont(0.5) within group (
  order by searches)::decimal, 1)
from temp_data
;