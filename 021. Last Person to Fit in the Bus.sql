Q: 1204. Last Person to Fit in the Bus
-- Link: https://leetcode.com/problems/last-person-to-fit-in-the-bus/

-- code
WITH cte1 as(
    select person_name , turn ,
        sum(weight) over(order by turn) as totalWeight  
    from Queue
),
filter as(
    select * from cte1
    where totalWeight <= 1000
)
select person_name from filter
order by turn DESC
limit 1;
