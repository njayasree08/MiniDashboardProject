
----- project
---- which region sold highest no of items
select region,count(quantity) as total_product from ecommerce_order
group by region
order by total_product desc

----what was total revenue by each month
select 
 to_char(order_date, 'yy-mm') as month,
 sum(price*quantity) as total_revenu from ecommerce_order
 group by month
 order by month

 --what are top 5 selling product based on quantity
 select product,sum(quantity) as total_sale from ecommerce_order
 group by product
 order by total_sale desc
 limit 5

---which product catogery sale highest revenu
select category,sum(price*quantity) as total_sale from ecommerce_order
group by category
order by total_sale desc

--which city generate higherst revenur
select ecommerce_customer.city,sum(ecommerce_order.price*ecommerce_order.quantity) as total_sales
from ecommerce_customer 
join ecommerce_order
on ecommerce_customer.customer_name=ecommerce_order.customer_name
group by city
order by total_sales desc
 

