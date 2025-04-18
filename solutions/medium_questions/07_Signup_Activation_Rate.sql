with confirmation_texts as (
  SELECT 
    * 
  FROM texts 
  where signup_action = 'Confirmed'
)
SELECT
  round(avg(case when signup_action = 'Confirmed' then 1 else 0 end), 2) as confirm_rate
FROM emails
  left join confirmation_texts
    on emails.email_id = confirmation_texts.email_id
;