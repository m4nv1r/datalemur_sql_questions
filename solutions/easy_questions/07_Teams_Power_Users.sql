SELECT 
  sender_id, 
  count(*) as message_count 
FROM messages 
where sent_date between '2022-08-01' and '2022-09-01'
group by sender_id
order by message_count desc
limit 2
;