Q: 601. Human Traffic of Stadium
-- Link: https://leetcode.com/problems/human-traffic-of-stadium/

-- code
with filterStadium as (
    select *, 
        id- row_number() over(order by id) as grp
    from Stadium 
    where people >=100
),
final as(
    select *,
        count(*) over(partition by grp) as cnt
    from filterStadium  
)
select id, visit_date, people 
from final
where cnt >=3
order by visit_date asc;
