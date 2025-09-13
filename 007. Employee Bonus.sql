577. Employee Bonus

-- //QUESTION LINK: https://leetcode.com/problems/employee-bonus/

-- TOPIC: DATABASE


CODE:

--------appraoch 1
select 
e.name, b.Bonus from Employee e
left join Bonus b
on e.empId = b.empId
where b.bonus<1000 or b.bonus is NULL ;


-- sub queries  ------------- appraoch 2
SELECT name,
       (SELECT bonus 
        FROM Bonus b 
        WHERE b.empId = e.empId) AS Bonus
FROM Employee e
WHERE (SELECT bonus 
       FROM Bonus b 
       WHERE b.empId = e.empId) < 1000
   OR (SELECT bonus 
       FROM Bonus b 
       WHERE b.empId = e.empId) IS NULL;


-- window function   ----------- appraoch 3

SELECT name, bonus
FROM (
    SELECT e.name,
           b.bonus,
           ROW_NUMBER() OVER (PARTITION BY e.empId ORDER BY b.bonus) AS rn
    FROM Employee e
    LEFT JOIN Bonus b ON e.empId = b.empId
) t
WHERE rn = 1  -- pick the bonus row (or null if none)
  AND (bonus < 1000 OR bonus IS NULL);
