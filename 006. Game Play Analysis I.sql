511. Game Play Analysis I
-- QUESTION LINK: https://leetcode.com/problems/game-play-analysis-i/

-- TOPIC: DATABSES

-- CODE:
  
select player_id , min(event_date) as first_login from Activity 
group by player_id;
