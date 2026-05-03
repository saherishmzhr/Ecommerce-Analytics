-- Who are the top 10 customers by revenue?

select customer_name,
sum(total_purchase_amt) as total_spent
group by customer_name,
order by revenue desc
limit 10;
-- Insight:
-- Identifies highest-value customers.


-- How many repeat vs. one-time customers?

select customer_name,
count(*) as total_orders
from ecom
group by customer_name
having total_orders>1;
-- Insight:
-- Measures customer retention.

--Customers who spend more than the average
select 
    customer_name,
    SUM(total_purchase_amt) as total_spent
from ecom
group by customer_name
having sum(total_purchase_amt) > (
    select avg(customer_total)
    from (
        select 
            customer_name,
            sum(total_purchase_amt) as customer_total
        from ecom
        group by customer_name
    ) t
)
order by total_spent desc;
--Insight:
--Above-average spenders drive a large share of revenue.

-- Rank customers by total spending
select 
    customer_name,
    sum(total_purchase_amt) as total_spent,
    rank() over (order by sum(total_purchase_amt) desc) as customer_rank
from ecom
group by customer_name;
--Insight:
--Top-ranked customers dominate revenue contribution.


-- Customer value segments
select customer_name,
sum(total_purchase_amt) as total_spent,
case
when sum(total_purchase_amt)>10000 then 'High'
when sum(total_purchase_amt)>5000 then 'Medium'
else 'Low'
end as segment
from ecom
group by customer_name;
-- Insight:
-- Most customers fall into the low or medium segment, while high-value customers contribute disproportionately to revenue.
