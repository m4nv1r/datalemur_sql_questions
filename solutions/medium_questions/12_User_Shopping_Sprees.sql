select 
  distinct tab1.user_id
from transactions tab1 
  join transactions tab2 
    on (tab1.transaction_date::date + 1) = (tab2.transaction_date::date)
  join transactions tab3 
    on (tab2.transaction_date::date + 1) = (tab3.transaction_date::date)
order by tab1.user_id
;