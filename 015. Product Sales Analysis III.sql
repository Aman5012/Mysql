1070. Product Sales Analysis III
-- QUESTION LINK: https://leetcode.com/problems/product-sales-analysis-iii/

-- TOPIC: Database


-- CODE: 
-- appraoch 1 --

select product_id, year as first_year, quantity, price
from Sales
where (product_id, year) in (select product_id, min(year) from Sales Group by product_id);



--   appraoch 2 using join  --

SELECT s.product_id,
       s.year AS first_year,
       s.quantity,
       s.price
FROM Sales s
JOIN (
    SELECT product_id, MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
) x
ON s.product_id = x.product_id
AND s.year = x.first_year;
