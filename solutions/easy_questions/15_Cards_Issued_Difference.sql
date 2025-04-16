with hightest_issued_month as (
select 
  *, 
  row_number() over (partition by card_name order by issued_amount desc) as rn 
from monthly_cards_issued
), lowest_issued_month as (
select 
  *, 
  row_number() over (partition by card_name order by issued_amount) as rn 
from monthly_cards_issued
)
select 
  hm.card_name,
  hm.issued_amount - lm.issued_amount as difference
from hightest_issued_month hm 
  join lowest_issued_month lm 
    on hm.card_name = lm.card_name
where hm.rn = 1 
  and lm.rn = 1
order by difference desc
;
