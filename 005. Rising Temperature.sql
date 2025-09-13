197. Rising Temperature
//QUESTION LINK: https://leetcode.com/problems/rising-temperature/

CODE:

-- -- using sub Queries 

select w1.id from Weather w1
where 0 <> (
    select count(*) from Weather w2
    where w1.temperature > w2.temperature and 
    subdate(w1.recordDate, 1) = w2.recordDate
);


-- -- appraoch 2  using Joins

Select w1.id from Weather w1
join Weather w2      -- join takes alias w2
on subdate(w1.recordDate, 1) = w2.recordDate
where w1.temperature> w2.temperature;


-- method 3 using Window function  
SELECT id
FROM (
    SELECT id,
           recordDate,
           temperature,
           CASE 
               WHEN DATEDIFF(recordDate, LAG(recordDate) OVER (ORDER BY recordDate)) = 1
               THEN LAG(temperature) OVER (ORDER BY recordDate)
               ELSE NULL
           END AS prev_temp
    FROM Weather
) t
WHERE prev_temp IS NOT NULL
  AND temperature > prev_temp;
