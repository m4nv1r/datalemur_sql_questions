with highest_open as (
  select
    ticker,
    to_char(date, 'Mon-YYYY') as highest_mth,
    open as highest_open,
    row_number() over(partition by ticker order by open desc) as rn
  from stock_prices
), lowest_open as (
  select 
    ticker,
    to_char(date, 'Mon-YYYY') as lowest_mth,
    open as lowest_open,
    row_number() over(partition by ticker order by open) as rn
  from stock_prices
)
select
  highest_open.ticker,
  highest_mth,
  highest_open,
  lowest_mth,
  lowest_open
from highest_open 
  join lowest_open 
    on highest_open.ticker = lowest_open.ticker
where highest_open.rn = 1 and lowest_open.rn = 1
order by ticker
;