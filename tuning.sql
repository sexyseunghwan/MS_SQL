
set arithabort off 
set STATISTICS IO on
set STATISTICS TIME on
	
	
	


	select
		m.comp_name
	--,	sum(convert(bigint,e.elect_prod_price)*convert(bigint,b.product_quantity))-sum(convert(bigint,e.first_cost)*convert(bigint,b.product_quantity)) as totalsum
	,	format(sum(convert(bigint,e.elect_prod_price)*convert(bigint,b.product_quantity))-sum(convert(bigint,e.first_cost)*convert(bigint,b.product_quantity)),'#,#') as totalsum
	from dbo.QOO10_USER_REAL q with(nolock)
	inner join dbo.BUYTBL_INFO b with(nolock) on q.qoouser_seq = b.buy_qoouser_seq
	inner join dbo.ELECTRONIC_PRODUCTS e with(nolock) on e.elect_prodserial = b.product_serial
	inner join dbo.MANUFACTURER_INC m on m.comp_seq = e.product_manufacturer_comp_seq
	where q.qoouser_nation = 'KR' and b.buy_date between '2009-01-01' and '2009-03-01' and m.comp_name = 'APPLE'
	group by m.comp_name
	order by sum(convert(bigint,e.elect_prod_price)*convert(bigint,b.product_quantity))-sum(convert(bigint,e.first_cost)*convert(bigint,b.product_quantity)) desc



set STATISTICS IO off
set STATISTICS TIME off
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