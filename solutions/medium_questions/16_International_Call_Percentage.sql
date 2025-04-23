with temp_info as (
select 
  case when caller_info.country_id = receiver_info.country_id then 0 else 1 end as international_call
from phone_calls 
  join phone_info caller_info
    on phone_calls.caller_id = caller_info.caller_id
  join phone_info receiver_info
    on phone_calls.receiver_id = receiver_info.caller_id
)
select 
  round((100.0*sum(international_call))/count(*), 1) as international_calls_pct
from temp_info
;