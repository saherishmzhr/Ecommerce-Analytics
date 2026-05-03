-- Overall churn rate
select
round(avg(churn)*100,2) as churn_rate
from ecom;
-- Insight:
-- A higher churn rate indicates potential issues with customer satisfaction or retention.


-- Churn count
select churn,
count(*) as num_of_customers
from ecom
group by churn;
-- Insight:
-- Comparing churned vs retained customers shows overall retention health.


--Churn by weekday
select dayname(order_date) as weekday,
round(avg(churn)*100,2) as churn_rate
from ecom
group by weekday;
-- Insight:
-- Variations in churn across days may suggest timing-related dissatisfaction or inconsistent user experience.


-- Churned customers
select customer_name
from ecom
where churn=1;
-- Insight:
-- Identifying churned customers helps in targeting re-engagement campaigns.


--Revenue lost due to churn
select sum(total_purchase_amt) as lost_revenue
from ecom
where churn=1;
-- Insight:
-- Churn directly impacts revenue, and reducing it can significantly improve profitability.
