SELECT 
  user_id
FROM emails 
  join texts 
    on emails.email_id = texts.email_id
where signup_action = 'Confirmed'
and (action_date::date - signup_date::date) = 1 
;