with temp_data as (
  select 
    user_id, 
    count(*) as tweet_bucket
  from tweets 
  where extract(year from tweet_date) = '2022'
  group by user_id
)
select 
  tweet_bucket, 
  count(*) as users_num 
from temp_data 
group by tweet_bucket
;