with most_recent_date as (
select 
  user_id, 
  transaction_date,
  row_number() over (partition by user_id order by transaction_date desc) as rn
from user_transactions
)
select
  max(user_transactions.transaction_date) as transaction_date,
  user_transactions.user_id,
  count(*) as purchase_count
from user_transactions 
  join most_recent_date 
    on user_transactions.user_id = most_recent_date.user_id
where user_transactions.transaction_date = most_recent_date.transaction_date 
  and most_recent_date.rn = 1
group by user_transactions.user_id
order by transaction_date
;