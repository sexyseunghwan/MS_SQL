
set arithabort off 
set STATISTICS IO on
set STATISTICS TIME on
	

	SELECT
	t1.buy_year AS last_year
,	t2.buy_year AS present_year
,	FORMAT(t1.total_sum,'#,#') AS S1_SUM
,	FORMAT(ISNULL(t2.total_sum,0),'#,#') AS S2_SUM
,	FORMAT(ISNULL(t2.total_sum - t1.total_sum,0),'#,#') AS profit
,	CONVERT(VARCHAR,CONVERT(NUMERIC(20,3),((CONVERT(NUMERIC,t2.total_sum) - t1.total_sum) / t1.total_sum) * 100)) + ' %'
,	FORMAT(t1.total_sum - t1.cost,'#,#')
,	FORMAT(t2.total_sum - t2.cost,'#,#')
FROM
(SELECT 
	YEAR(b.buy_date) AS buy_year
,	COUNT(q.qoouser_seq) AS user_count
,	SUM(CONVERT(BIGINT,e.elect_prod_price * b.product_quantity)) AS total_sum
,	SUM(CONVERT(BIGINT,e.first_cost * b.product_quantity)) AS cost
FROM dbo.MANUFACTURER_INC m WITH(NOLOCK)
INNER JOIN dbo.ELECTRONIC_PRODUCTS e WITH(NOLOCK) ON m.comp_seq = e.product_manufacturer_comp_seq
INNER JOIN dbo.BUYTBL_INFO b WITH(NOLOCK) ON b.product_serial = e.elect_prodserial
INNER JOIN dbo.QOO10_USER_REAL q WITH(NOLOCK) ON q.qoouser_seq = b.buy_qoouser_seq
WHERE m.comp_seq = 5
GROUP BY YEAR(b.buy_date)) AS t1
LEFT JOIN
(SELECT 
	YEAR(b.buy_date) AS buy_year
,	COUNT(q.qoouser_seq) AS user_count
,	SUM(CONVERT(BIGINT,e.elect_prod_price * b.product_quantity)) AS total_sum
,	SUM(CONVERT(BIGINT,e.first_cost * b.product_quantity)) AS cost
FROM dbo.MANUFACTURER_INC m WITH(NOLOCK)
INNER JOIN dbo.ELECTRONIC_PRODUCTS e WITH(NOLOCK) ON m.comp_seq = e.product_manufacturer_comp_seq
INNER JOIN dbo.BUYTBL_INFO b WITH(NOLOCK) ON b.product_serial = e.elect_prodserial
INNER JOIN dbo.QOO10_USER_REAL q WITH(NOLOCK) ON q.qoouser_seq = b.buy_qoouser_seq
WHERE m.comp_seq = 5
GROUP BY YEAR(b.buy_date)) AS t2
ON t1.buy_year = t2.buy_year - 1
ORDER BY t1.buy_year

	--CREATE INDEX IDX__BUYTBL_INFO_TEST__BUY_QOOUSER_SEQ ON dbo.BUYTBL_INFO_TEST (buy_qoouser_seq) INCLUDE (product_quantity)

	--select TOP(20)
	--	m.comp_name
	----,	sum(convert(bigint,e.elect_prod_price)*convert(bigint,b.product_quantity))-sum(convert(bigint,e.first_cost)*convert(bigint,b.product_quantity)) as totalsum
	--,	format(sum(convert(bigint,e.elect_prod_price)*convert(bigint,b.product_quantity))-sum(convert(bigint,e.first_cost)*convert(bigint,b.product_quantity)),'#,#') as totalsum
	--from dbo.QOO10_USER_REAL_TEST q with(nolock)
	--inner join dbo.BUYTBL_INFO_TEST b with(nolock) on q.qoouser_seq = b.buy_qoouser_seq
	--inner join dbo.ELECTRONIC_PRODUCTS e with(nolock) on e.elect_prodserial = b.product_serial
	--inner join dbo.MANUFACTURER_INC m on m.comp_seq = e.product_manufacturer_comp_seq
	--where q.qoouser_nation = 'KR' and b.buy_date between '2009-01-01' and '2009-03-01' and m.comp_name = 'APPLE'
	--group by m.comp_name
	--order by sum(convert(bigint,e.elect_prod_price)*convert(bigint,b.product_quantity))-sum(convert(bigint,e.first_cost)*convert(bigint,b.product_quantity)) desc


	--SELECT TOP(1000)
	--	q.qoouser_id
	--,	q.qoouser_ipaddress
	--,	b. product_serial
	--FROM dbo.QOO10_USER_REAL_TEST q WITH(NOLOCK)
	--INNER JOIN dbo.BUYTBL_INFO_TEST b WITH(NOLOCK) ON q.qoouser_seq = b.buy_qoouser_seq
	--WHERE b.buy_date BETWEEN '2019-01-01' AND '2019-03-01' AND q.qoouser_nation = 'KR'
	--ORDER BY q.qoouser_seq


	--select
	--	m.comp_name
	----,	sum(convert(bigint,e.elect_prod_price)*convert(bigint,b.product_quantity))-sum(convert(bigint,e.first_cost)*convert(bigint,b.product_quantity)) as totalsum
	--,	format(sum(convert(bigint,e.elect_prod_price)*convert(bigint,b.product_quantity))-sum(convert(bigint,e.first_cost)*convert(bigint,b.product_quantity)),'#,#') as totalsum
	--from dbo.QOO10_USER_REAL_TEST q with(nolock)
	--inner join dbo.BUYTBL_INFO_TEST b with(nolock) on q.qoouser_seq = b.buy_qoouser_seq
	--inner join dbo.ELECTRONIC_PRODUCTS e with(nolock) on e.elect_prodserial = b.product_serial
	--inner join dbo.MANUFACTURER_INC m on m.comp_seq = e.product_manufacturer_comp_seq
	--where q.qoouser_nation = 'KR' and b.buy_date between '2009-01-01' and '2009-03-01'
	--group by m.comp_name
	--order by sum(convert(bigint,e.elect_prod_price)*convert(bigint,b.product_quantity))-sum(convert(bigint,e.first_cost)*convert(bigint,b.product_quantity)) desc

	


set STATISTICS IO off
set STATISTICS TIME off
	


	--drop index IDX__BUYTBL_INFO_TEST__BUY_QOOUSER_SEQ ON dbo.BUYTBL_INFO_TEST

	-- Çï·Î ÀÕÃ÷¹Ì
	--CREATE INDEX IDX__BUYTBL_INFO_TEST__BUY_QOOUSER_SEQ ON dbo.BUYTBL_INFO_TEST (buy_qoouser_seq)
	--DROP INDEX IDX__BUYTBL_INFO_TEST__BUY_QOOUSER_SEQ ON dbo.BUYTBL_INFO_TEST


	--SELECT
	--	q.qoouser_seq
	--,	q.qoouser_email
	--,	b.product_quantity
	--FROM dbo.QOO10_USER_REAL_TEST q WITH(NOLOCK)
	--INNER JOIN dbo.BUYTBL_INFO_TEST b WITH(NOLOCK) ON q.qoouser_seq = b.buy_qoouser_seq
	

	
	--CREATE INDEX IDX__BUYTBL_INFO_TEST__BUY_QOOUSER_SEQ ON dbo.BUYTBL_INFO_TEST (buy_qoouser_seq)
	--DROP INDEX IDX__BUYTBL_INFO_TEST__BUY_QOOUSER_SEQ ON dbo.BUYTBL_INFO_TEST


	--TOP(10)

	--SELECT TOP(10)
	--	q.qoouser_id
	--,	q.qoouser_ipaddress
	--,	b. product_serial
	--FROM dbo.QOO10_USER_REAL_TEST q WITH(NOLOCK)
	--INNER JOIN dbo.BUYTBL_INFO_TEST b WITH(NOLOCK) ON q.qoouser_seq = b.buy_qoouser_seq
	--WHERE b.buy_date BETWEEN '2019-01-01' AND '2019-03-01' AND q.qoouser_nation = 'KR'
	--ORDER BY q.qoouser_seq


	--SELECT COUNT(*) FROM dbo.BUYTBL_INFO_TEST WITH(NOLOCK)



	--select
	--	m.comp_name
	----,	sum(convert(bigint,e.elect_prod_price)*convert(bigint,b.product_quantity))-sum(convert(bigint,e.first_cost)*convert(bigint,b.product_quantity)) as totalsum
	--,	format(sum(convert(bigint,e.elect_prod_price)*convert(bigint,b.product_quantity))-sum(convert(bigint,e.first_cost)*convert(bigint,b.product_quantity)),'#,#') as totalsum
	--from dbo.QOO10_USER_REAL q with(nolock)
	--inner join dbo.BUYTBL_INFO b with(nolock) on q.qoouser_seq = b.buy_qoouser_seq
	--inner join dbo.ELECTRONIC_PRODUCTS e with(nolock) on e.elect_prodserial = b.product_serial
	--inner join dbo.MANUFACTURER_INC m on m.comp_seq = e.product_manufacturer_comp_seq
	--where q.qoouser_nation = 'KR' and b.buy_date between '2009-01-01' and '2009-03-01' and m.comp_name = 'APPLE'
	--group by m.comp_name
	--order by sum(convert(bigint,e.elect_prod_price)*convert(bigint,b.product_quantity))-sum(convert(bigint,e.first_cost)*convert(bigint,b.product_quantity)) desc


--SELECT * FROM dbo.QOO10_USER_REAL_TEST WITH(NOLOCK)

--product_serial

--QOO10_USER_REAL_TEST

--SELECT * FROM dbo.QOO10_USER_REAL_TEST WITH(NOLOCK)


--CREATE INDEX IDX__QOO10_USER_REAL_TEST__QOOUSER_SEQ ON dbo.QOO10_USER_REAL_TEST (qoouser_seq)



--CREATE INDEX IDX__BUYTBL_INFO_TEST__BUY_QOOUSER_SEQ ON dbo.BUYTBL_INFO_TEST (buy_qoouser_seq)



--CREATE INDEX IDX__QOO10_USER_REAL_TEST__TEST2 ON dbo.QOO10_USER_REAL_TEST (qoouser_nation) INCLUDE (qoouser_id,qoouser_ipaddress)

--CREATE INDEX IDX__QOO10_USER_REAL_TEST__QOOUSER_SEQ ON dbo.QOO10_USER_REAL_TEST (qoouser_seq) INCLUDE (qoouser_id)

--DROP INDEX IDX__QOO10_USER_REAL_TEST__


--CREATE INDEX IDX__BUYTBL_INFO_TEST__BUY_QOOUSER_SEQ ON dbo.BUYTBL_INFO_TEST (buy_qoouser_seq) INCLUDE (product_serial)

--DROP INDEX IDX__BUYTBL_INFO__BUY_QOOUSER_SEQ__PRODUCT_SERIAL__BUY_DATE ON dbo.BUYTBL_INFO



--T SHOWPLAN_TEXT off
--CREATE INDEX IDX__QOO10_USER_REAL_TEST__TEST1 ON dbo.QOO10_USER_REAL_TEST (qoouser_nation)

--SELECT product_serial,COUNT(*) FROM dbo.BUYTBL_INFO_TEST WITH(NOLOCK) GROUP BY product_serial

--SELECT product_quantity,COUNT(*) FROM dbo.BUYTBL_INFO_TEST WITH(NOLOCK) GROUP BY product_quantity

--SELECT buy_qoouser_seq,COUNT(*) FROM dbo.BUYTBL_INFO_TEST WITH(NOLOCK) GROUP BY buy_qoouser_seq

--CREATE INDEX IDX__BUYTBL_INFO_TEST__TEST ON dbo.BUYTBL_INFO_TEST (buy_qoouser_seq,product_serial,product_quantity)

--CREATE INDEX IDX__BUYTBL_INFO_TEST__TEST2 ON dbo.BUYTBL_INFO_TEST (product_serial) include (product_quantity)

--CREATE INDEX IDX__BUYTBL_INFO_TEST__TEST_new ON dbo.BUYTBL_INFO (buy_date) include (product_serial,product_quantity)
--DROP INDEX IDX__BUYTBL_INFO_TEST__TEST_new ON dbo.BUYTBL_INFO


--CREATE INDEX IDX__BUYTBL_INFO_TEST__TEST4 ON dbo.BUYTBL_INFO_TEST (product_serial,buy_date) include (product_quantity)

--DROP INDEX IDX__BUYTBL_INFO_TEST__TEST ON dbo.BUYTBL_INFO_TEST

--SELECT elect_prodserial,COUNT(*) FROM dbo.ELECTRONIC_PRODUCTS WITH(NOLOCK) GROUP BY elect_prodserial