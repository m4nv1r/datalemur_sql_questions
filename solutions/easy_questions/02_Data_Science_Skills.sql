select 
  candidate_id
from candidates 
group by candidate_id
having sum(case when skill in ('Python', 'Tableau', 'PostgreSQL') then 1 else 0 end) = 3