3421. Find Students Who Improved
-- //QUESTION LINK: https://leetcode.com/problems/find-students-who-improved/

-- TOPIC: datadase


CODE:
-- ///////////////////////////////  using CTE and Sun=b queries ////////////////////////
WITH cte1 AS (
    SELECT student_id, subject, score, MIN(exam_date) AS first_date
    FROM Scores
    GROUP BY student_id, subject
    HAVING COUNT(*) >= 2
),
latest_exam AS (
    SELECT student_id, subject, MAX(exam_date) AS max_date
    FROM scores
    GROUP BY student_id, subject
),
cte2 AS ( 
    SELECT s.student_id, s.subject, s.score, s.exam_date
    FROM scores s
    JOIN latest_exam l
      ON s.student_id = l.student_id
     AND s.subject = l.subject
     AND s.exam_date = l.max_date
)
SELECT 
    cte2.student_id,
    cte1.subject,
    cte1.score AS first_score,
    cte2.score AS latest_score 
FROM cte1
INNER JOIN cte2
    ON cte1.student_id = cte2.student_id
   AND cte1.subject = cte2.subject  
WHERE cte1.score < cte2.score
ORDER BY cte2.student_id, cte1.subject;

