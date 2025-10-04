1141. User Activity for the Past 30 Days I
-- Question Link: https://leetcode.com/problems/user-activity-for-the-past-30-days-i/

-- code:

Select  activity_date as day , count(distinct user_id) as active_users
from activity
where activity_date between '2019-06-28' and  '2019-07-27'
Group by activity_date
having count(user_id)>=1;
