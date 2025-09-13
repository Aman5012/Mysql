182. Duplicate Emails
//QUESTION LINK: https://leetcode.com/problems/duplicate-emails/


-- CODE:

SELECT Email
FROM Person
GROUP BY Email
HAVING COUNT(email) > 1;
