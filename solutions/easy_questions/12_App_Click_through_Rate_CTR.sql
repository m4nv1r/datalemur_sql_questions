with temp_data as (
  select 
    app_id,
    sum(case when event_type = 'click' then 1 else 0 end) as number_of_clicks,
    sum(case when event_type = 'impression' then 1 else 0 end) as number_of_impressions
  from events
  where extract(year from timestamp) = '2022'
  group by app_id
)
select 
  app_id,
  round(((100.0*number_of_clicks)/number_of_impressions),2) as ctr
from temp_data
;