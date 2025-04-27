with temp_data as (
  SELECT 
    server_id,
    status_time as start_time,
    session_status,
    coalesce(lead(status_time) over (partition by server_id order by status_time), current_timestamp) as end_time
  FROM server_utilization
)
select
  round(extract(epoch from sum(end_time - start_time))/86400) total_uptime_days
from temp_data
where session_status = 'start'
;
