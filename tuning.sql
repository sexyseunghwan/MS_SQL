
set arithabort off 
set STATISTICS IO on
set STATISTICS TIME on
	

SELECT
	YEAR(b.buy_date) AS per_year
,	SUM(CONVERT(BIGINT,b.product_quantity) * e.elect_prod_price) AS total_money
FROM dbo.QOO10_USER_REAL q WITH(NOLOCK)
INNER JOIN BUYTBL_INFO b WITH(NOLOCK) ON q.qoouser_seq = b.buy_qoouser_seq
INNER JOIN ELECTRONIC_PRODUCTS e WITH(NOLOCK) ON e.elect_prodserial = b.product_serial
INNER JOIN MANUFACTURER_INC m WITH(NOLOCK) ON m.comp_seq = e.product_manufacturer_comp_seq
WHERE q.qoouser_nation = 'KR' AND q.qoouser_gender = 'M' AND q.qoouser_grade = 5
AND   m.comp_name = 'APPLE'
GROUP BY YEAR(b.buy_date)
ORDER BY per_year DESC


SELECT
	t4.buy_date AS per_year
,	SUM(CONVERT(BIGINT,t4.product_quantity) * t4.elect_prod_price) AS total_money
FROM
(SELECT
	YEAR(t1.buy_date) AS buy_date
,	t1.product_quantity
,	t2.elect_prod_price
FROM dbo.QOO10_USER_REAL q WITH(NOLOCK)
CROSS APPLY
(
	SELECT 
		b.product_quantity
	,	b.buy_qoouser_seq
	,	b.product_serial
	,	b.buy_date
	FROM dbo.BUYTBL_INFO b WITH(NOLOCK)
	WHERE q.qoouser_seq = b.buy_qoouser_seq AND q.qoouser_nation = 'KR' AND q.qoouser_gender = 'M' AND q.qoouser_grade = 5
) AS t1
CROSS APPLY
(
	SELECT
		e.elect_prod_price
	,	e.product_manufacturer_comp_seq
	FROM dbo.ELECTRONIC_PRODUCTS e WITH(NOLOCK)
	WHERE e.elect_prodserial = t1.product_serial

) AS t2
CROSS APPLY
(
	SELECT
		comp_seq
	,	comp_name
	FROM dbo.MANUFACTURER_INC m WITH(NOLOCK)
	WHERE m.comp_seq = t2.product_manufacturer_comp_seq AND m.comp_name = 'APPLE'
) AS t3 ) AS T4
GROUP BY t4.buy_date
ORDER BY per_year DESC





set STATISTICS IO off
set STATISTICS TIME off

--CREATE INDEX IDX__TEST2 ON dbo.BUYTBL_INFO (buy_qoouser_seq,buy_date)



--CREATE INDEX IDX__TEST ON dbo.BUYTBL_INFO (buy_date)

--QOO10_USER_REAL

--CREATE INDEX IDX__QOO10_USER_REAL__QOOUSER_GENDER__QOOUSER_NATION ON dbo.QOO10_USER_REAL (qoouser_gender,qoouser_nation)
