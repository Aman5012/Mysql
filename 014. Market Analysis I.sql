1158. Market Analysis I

-- QUESTION LINK: https://leetcode.com/problems/market-analysis-i/ 

-- TOPIC: Database
 
-- CODE:
  
select u.user_id as buyer_id, u.join_date, count(o.buyer_id) as orders_in_2019
from users u
left join Orders o
on u.user_id = o.buyer_id
and  order_date like "2019%"

group by u.user_id, u.join_date;
