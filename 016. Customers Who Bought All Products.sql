1045. Customers Who Bought All Products
-- QUESTION LINK: https://leetcode.com/problems/customers-who-bought-all-products/description/

-- TOPIC: Database 

-- CODE: 

select customer_id from Customer  
group by customer_id
having count(distinct product_key) = (select count(*) from Product);
