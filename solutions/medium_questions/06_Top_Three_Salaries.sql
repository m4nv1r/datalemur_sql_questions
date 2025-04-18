with temp_data as (
SELECT
  department_name,
  name,
  salary,
  dense_rank() over (
    partition by department_name 
    order by salary desc
  ) as rn
FROM employee
  join department
    on employee.department_id = department.department_id
)
select 
  department_name, 
  name, 
  salary 
from temp_data 
where rn in (1,2,3)
order by
  department_name, salary desc, name
;