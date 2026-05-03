-- Monthly revenue trend

select date_format(order_date,'%m-%Y') as month,
  sum(total_purchase_amt) as revenue
from ecom
group by month
order by month;

-- What is the Average Order Value?

select
round(sum(total_purchase_amt)/count(*),2) as avg_order_value
from ecom;

-- Which days generate the highest spending?
select dayname(order_date) as weekday,
sum(total_purchase_amt) as revenue
from ecom
group by weekday
order by revenue desc;

-- What is cumulative revenue growth?
select order_date,
  sum(total_purchase_amt) over (order by order_date) as cumulative_revenue
from ecom;
