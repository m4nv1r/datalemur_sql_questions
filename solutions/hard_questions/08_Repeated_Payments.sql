with temp_data as (
SELECT 
  *,
  lag(transaction_timestamp) over (partition by merchant_id, credit_card_id, amount order by transaction_timestamp) as previous_transaction_timestamp
FROM transactions
)
select 
  count(*) as payment_count 
from temp_data where (extract(epoch from (transaction_timestamp - previous_transaction_timestamp))/60) <= 10
;