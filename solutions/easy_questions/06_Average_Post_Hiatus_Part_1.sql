with post_count as (
  select 
    user_id 
  from posts
  where extract(year from post_date) = '2021'
  group by user_id 
  having count(*) > 1
), first_post_info as (
  select 
    *,
    row_number() over (partition by user_id order by post_date) as rn 
  from posts
  where extract(year from post_date) = '2021'
), last_post_info as (
  select 
    *, 
    row_number() over (partition by user_id order by post_date desc) as rn 
  from posts
  where extract(year from post_date) = '2021'
)
select 
  last_post_info.user_id,
  (last_post_info.post_date::date) - (first_post_info.post_date::date) as days_between
from last_post_info 
  join first_post_info 
    on last_post_info.user_id = first_post_info.user_id
  join post_count 
    on last_post_info.user_id = post_count.user_id
where last_post_info.rn = 1 
  and first_post_info.rn = 1
;
