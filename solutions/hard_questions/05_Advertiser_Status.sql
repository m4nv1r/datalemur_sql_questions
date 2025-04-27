select 
  coalesce(a.user_id, d.user_id),
  case
    when a.user_id is null then 'NEW'
    when d.user_id is null then 'CHURN'
    else
      case 
        when status = 'CHURN' then 'RESURRECT'
        else 'EXISTING'
      end
  end as new_status
from advertiser a 
  full outer join daily_pay d 
    on a.user_id = d.user_id
order by coalesce(a.user_id, d.user_id)
;