626. Exchange Seats
-- QUESTION LINK: https://leetcode.com/problems/exchange-seats/description/

-- TOPIC: Database 

-- CODE: 
-- appraoch 1
select 
    case
        when id % 2 = 1 and id+1 in (select id from Seat) then id+1
        when id % 2 = 0 then id-1
        else id
    end as id, student
    from Seat
    order by id;

--   approach 2 using Window function 

SELECT 
    id,
    CASE
        WHEN id % 2 = 0 THEN LAG(student) OVER(ORDER BY id)
        ELSE COALESCE(LEAD(student) OVER(ORDER BY id), student)
    END AS student
FROM Seat

