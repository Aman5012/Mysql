3793. Find Users with High Token Usage
//QUESTION LINK: https://leetcode.com/problems/find-users-with-high-token-usage/

TOPIC: Database


CODE:--
  ///////////////////////  suing Subqueries //////////////////////////////
select distinct p.user_id, t.prompt_count, t.avg_tokens
from prompts p
inner join ( 
select user_id, count(prompt) as prompt_count, round(avg(tokens), 2) as avg_tokens
from prompts
group by user_id
Having count(prompt)>=3 ) t
on p.user_id = t.user_id and p.tokens > t.avg_tokens
order by avg_tokens desc, user_id asc
; 



-- ///////////////////////   using CTE //////////////////////////
with cte as(
    select user_id, count(prompt) as prompt_count, round(avg(tokens), 2) as avg_tokens
    from prompts
    group by user_id
    Having count(prompt)>=3
)
select distinct(cte.user_id), cte.prompt_count, cte.avg_tokens from cte
inner join prompts p
on p.user_id = cte.user_id
and p.tokens > cte.avg_tokens
order by cte.avg_tokens desc, cte.user_id asc
;

