1148. Article Views I
-- Question Link: https://leetcode.com/problems/article-views-i/

-- code:

select distinct author_id as id from Views 
where  author_id = viewer_id 
order by  id;
