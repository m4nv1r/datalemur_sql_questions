with temp_data as (
  select 
    *,
    measurement_time::date measurement_day,
    row_number() over (
      partition by measurement_time::date 
      order by measurement_time
    ) as rn
  from measurements
)
select 
  measurement_day::timestamp,
  sum(case when (rn % 2 = 1) then measurement_value else 0 end) as odd_sum,
  sum(case when (rn % 2 = 0) then measurement_value else 0 end) as even_sum
from temp_data
group by measurement_day
;