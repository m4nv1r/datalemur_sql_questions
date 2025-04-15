with temp_data as (
  SELECT company_id, title, description FROM job_listings
  group by company_id, title, description having count(*) > 1
)
select count(distinct company_id) as duplicate_companies from temp_data
;