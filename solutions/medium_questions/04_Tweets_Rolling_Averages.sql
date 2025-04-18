with temp_data as (
select 
  user_id,
  tweet_date,
  avg(tweet_count) over (
  partition by user_id 
  order by tweet_date 
  rows between 2 preceding and current row
  ) as rolling_avg_3d 
from tweets
)
select 
  user_id,
  tweet_date,
  round(rolling_avg_3d, 2) as rolling_avg_3d
from temp_data
;