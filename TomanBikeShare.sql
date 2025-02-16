with cte as(
	select * from bike_share_yr_0
	union
	select * from bike_share_yr_1)

select 
dteday,
season,
a.yr,
weekday,
hr,
rider_type,
riders,
price,
COGS,
riders*price as Revenue,
riders*price - COGS as Profit

from cte a
left join cost_table b
on a.yr = b.yr