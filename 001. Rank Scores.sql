178. Rank Scores
  
-- QUESTION LINK: https://leetcode.com/problems/rank-scores/
code:
  
select s1.score,
    (   select COUNT(distinct s2.score)
        from Scores s2
        where s1.score <= s2.score
    ) as 'rank'
from Scores s1
order by s1.score Desc;
