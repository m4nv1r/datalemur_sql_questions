with temp_data as (
SELECT 
  activities.user_id,
  age_bucket,
  case when activity_type = 'send' then time_spent else 0.0 end as time_spent_sending,
  case when activity_type = 'open' then time_spent else 0.0 end as time_spent_opening
FROM activities 
  join age_breakdown 
    on activities.user_id = age_breakdown.user_id
)
select 
  age_bucket,
  round(100.0*(sum(time_spent_sending)) / (sum(time_spent_sending) + sum(time_spent_opening)), 2) as send_perc,
  round(100.0*(sum(time_spent_opening)) / (sum(time_spent_sending) + sum(time_spent_opening)), 2) as open_perc
from temp_data 
group by age_bucket
;