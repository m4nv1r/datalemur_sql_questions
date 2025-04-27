with batch_sizes as (
  select 
    item_type, 
    sum(square_footage) as total_footage,
    count(*) as item_count
  from inventory 
  group by item_type
), prime_amount as (
  select 
    floor(500000/total_footage) as batch_size,
    item_count,
    total_footage,
    item_type
  from batch_sizes 
  where item_type = 'prime_eligible'
), not_prime_amount as (
  select 
    floor((500000 - (select batch_size*total_footage from prime_amount))/total_footage) as batch_size,
    item_count,
    total_footage,
    item_type
  from batch_sizes 
  where item_type = 'not_prime'
), temp_data as (
(select * from prime_amount)
union
(select * from not_prime_amount)
)
select 
  item_type,
  item_count * batch_size as item_count
from temp_data
order by item_type desc
;
