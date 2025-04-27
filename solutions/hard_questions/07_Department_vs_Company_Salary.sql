with company_average as (
select
  avg(amount) average_salary,
  '03-2024' as payment_date
from salary 
where to_char(payment_date, 'MM-YYYY') = '03-2024'
), department_average as (
  select 
    e.department_id,
    avg(amount) average_salary,
    '03-2024' as payment_date
  from employee e 
    join salary s 
      on e.employee_id = s.employee_id
  where to_char(payment_date, 'MM-YYYY') = '03-2024'
  group by e.department_id
)
select 
  department_id,
  d.payment_date,
  case 
    when d.average_salary > c.average_salary then 'higher'
    when d.average_salary < c.average_salary then 'lower'
    else 'same'
  end as comparison
from department_average d 
  join company_average c 
    on d.payment_date = c.payment_date
;