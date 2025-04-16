SELECT 
  round(((sum(item_count*order_occurrences))/sum(order_occurrences))::numeric,1) 
FROM items_per_order
;