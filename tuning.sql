
set arithabort off 
set STATISTICS IO on
set STATISTICS TIME on
	


--	SELECT 
--	comment_id
--,	comment
--,	author 
--,	(SELECT COUNT(*) FROM dbo.COMMENT_TEST c2 WITH(NOLOCK) WHERE c1.comment_id = c2.parent_id) as comment_cnt
--FROM dbo.COMMENT_TEST c1 WITH(NOLOCK)
	
SELECT
	c1.comment_id
,	c1.comment
,	c1.author
,	COUNT(c3.parent_id) AS cnt
FROM dbo.COMMENT_TEST c1 WITH(NOLOCK)
LEFT JOIN dbo.COMMENT_TEST c2 WITH(NOLOCK) ON c1.comment_id = c2.parent_id
LEFT JOIN dbo.COMMENT_TEST c3 WITH(NOLOCK) ON c2.comment_id = c3.parent_id
LEFT JOIN dbo.COMMENT_TEST c4 WITH(NOLOCK) ON c3.comment_id = c4.parent_id 
LEFT JOIN dbo.COMMENT_TEST c5 WITH(NOLOCK) ON c4.comment_id = c5.parent_id 
GROUP BY c1.comment_id,c1.comment, c1.author






set STATISTICS IO off
set STATISTICS TIME off







