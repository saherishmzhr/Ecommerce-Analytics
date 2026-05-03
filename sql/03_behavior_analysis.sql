-- Orders by hour
select hour(order_date) as hour,
count(*) as total_orders
from ecom
group by hour
order by hour;
-- Insight:
-- Orders peak during specific hours of the day, indicating the best time to target users with promotions.

-- Orders by weekday
select dayname(order_date) as weekday,
  count(*) as total_orders
from ecom
group by weekday
order by total_orders desc;
-- Insight:
-- Certain days have higher activity, helping in planning marketing campaigns and operational capacity.

-- Revenue by the time of day
select
case
when hour(order_date) between 6 and 11 then 'Morning'
when hour(order_date) between 12 and 3 then 'Afternoon'
else 'Evening/Night'
end as time_of_day,
sum(total_purchase_amt) as revenue
from ecom
group by time_of_day;
-- Insight:
-- Revenue concentration during particular time periods suggests when high-value purchases are most likely.


-- Weekday vs. Weekend
select 
case 
when dayofweek(order_date) in (1,7) then 'Weekend'
else 'Weekday'
end as day_type,
count(*) as total_orders
from ecom
group by day_type;
--Insight:
-- Differences between weekday and weekend activity reveal customer shopping behavior patterns.
