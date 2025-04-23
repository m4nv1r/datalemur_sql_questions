with temp_data as (
  select 
    max(order_occurrences) as max_order_occurrences
  from items_per_order
)
select
  item_count as mode
from items_per_order
  join temp_data
    on order_occurrences = max_order_occurrences
order by item_count
;