with callers_of_interest as (
  select 
    policy_holder_id 
  from callers 
  group by policy_holder_id
  having count(distinct case_id) >= 3
)
select 
  count(*) as policy_holder_count
from callers_of_interest
;