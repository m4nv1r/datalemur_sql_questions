with temp_data as (
  select 
    *,
    row_number() over (
      partition by card_name 
      order by issue_year, issue_month
    ) as rn
  from monthly_cards_issued
)
select 
  card_name,
  issued_amount
from temp_data 
where rn = 1
order by issued_amount desc
;