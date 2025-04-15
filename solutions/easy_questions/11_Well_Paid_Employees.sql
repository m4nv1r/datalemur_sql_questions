SELECT 
  employee.employee_id,
  employee.name as employee_name
FROM employee 
  join employee as manager 
    on employee.manager_id = manager.employee_id
where employee.salary > manager.salary
;