with query_counts as (
  select 
    employee_id,
    count(*) as query_count
  from queries
  where query_starttime between '2023-07-01' and '2023-10-01'
  group by employee_id
), employee_info as (
  select 
    employees.employee_id,
    COALESCE(query_count, 0) as query_count
  from employees 
    left join query_counts 
      on employees.employee_id = query_counts.employee_id
)
select 
  query_count as unique_queries, 
  count(*) as employee_count
from employee_info 
group by query_count
order by query_count
;
