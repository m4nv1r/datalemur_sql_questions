with users_in_june as (
select 
  distinct user_id 
from user_actions 
where to_char(event_date, 'MM-YYYY') = '06-2022'
), users_in_july as (
select 
  distinct user_id 
from user_actions 
where to_char(event_date, 'MM-YYYY') = '07-2022'
)
select 
  7 as mth,
  count(distinct users_in_june.user_id) as monthly_active_users
from users_in_june 
  join users_in_july 
    on users_in_june.user_id = users_in_july.user_id 
;