with temp_data as (
  select 
    *, 
    dense_rank() over (order by salary desc) as rn 
  from employee
)
select 
  salary as second_highest_salary 
from temp_data 
where rn = 2
limit 1
;