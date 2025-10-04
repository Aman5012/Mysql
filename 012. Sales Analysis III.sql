1084. Sales Analysis III
-- Question Link: https://leetcode.com/problems/sales-analysis-iii/

-- code:
-------------------  approach 1 ------------------------
select p.product_id, p.product_name from Product p
join Sales s 
on s.product_id =  p.product_id 
GROUP BY p.product_id, p.product_name
HAVING 
    SUM(s.sale_date BETWEEN '2019-01-01' AND '2019-03-31') > 0   -- sold in range
    AND SUM(s.sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31') = 0; -- not sold outside



-- using window function -----------------------------------------------------------------
SELECT DISTINCT product_id, product_name
FROM (
    SELECT p.product_id, p.product_name,
           MIN(s.sale_date) OVER (PARTITION BY p.product_id) AS min_date,
           MAX(s.sale_date) OVER (PARTITION BY p.product_id) AS max_date
    FROM Product p
    JOIN Sales s 
      ON s.product_id = p.product_id
) t
WHERE min_date >= '2019-01-01'
  AND max_date <= '2019-03-31';
