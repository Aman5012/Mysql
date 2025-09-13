183. Customers Who Never Order

//QUESTION LINK: https://leetcode.com/problems/customers-who-never-order/

CODE:

Select name as  Customers from Customers
where id NOT IN (select customerId from Orders); 
