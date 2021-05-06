set arithabort off 
set STATISTICS IO on
set STATISTICS TIME on
	
	
	
	
	--select 
	--	m.comp_name
	--,	sum(convert(bigint,e.elect_prod_price)*convert(bigint,b.product_quantity)) as totalsum
	--from dbo.QOO10_USER_REAL q with(nolock)
	--inner join dbo.BUYTBL_INFO b with(nolock) on q.qoouser_seq = b.buy_qoouser_seq
	--inner join dbo.ELECTRONIC_PRODUCTS e with(nolock) on e.elect_prodserial = b.product_serial
	--inner join dbo.MANUFACTURER_INC m on m.comp_seq = e.product_manufacturer_comp_seq
	--where b.buy_date between '2000-01-01' and '2001-01-01'
	--group by m.comp_name
	--order by totalsum desc


	select top(10)
		m.comp_name
	,	sum(convert(bigint,e.elect_prod_price)*convert(bigint,b.product_quantity))-sum(convert(bigint,e.first_cost)*convert(bigint,b.product_quantity)) as totalsum
	--,	format(sum(convert(bigint,e.elect_prod_price)*convert(bigint,b.product_quantity))-sum(convert(bigint,e.first_cost)*convert(bigint,b.product_quantity)),'#,#') as totalsum
	from dbo.QOO10_USER_REAL q with(nolock)
	inner join dbo.BUYTBL_INFO b with(nolock) on q.qoouser_seq = b.buy_qoouser_seq
	inner join dbo.ELECTRONIC_PRODUCTS e with(nolock) on e.elect_prodserial = b.product_serial
	inner join dbo.MANUFACTURER_INC m on m.comp_seq = e.product_manufacturer_comp_seq
	where q.qoouser_nation = 'KR' and (b.buy_date between convert(datetime,'2000-01-01') and convert(datetime,'2000-03-01')) 
	group by m.comp_name
	--order by sum(convert(bigint,e.elect_prod_price)*convert(bigint,b.product_quantity))-sum(convert(bigint,e.first_cost)*convert(bigint,b.product_quantity)) desc
	

	--exec dbo.qoo10_test_sp '2020-01-01','2020-12-31','SG'



	 --SELECT FORMAT(99999999, '#,#')



set STATISTICS IO off
set STATISTICS TIME off


--CREATE INDEX IDX__QOO10_USER_REAL__QOOUSER_NATION ON dbo.QOO10_USER_REAL (qoouser_nation)


--DROP INDEX IDX__BUYTBL_INFO__BUY_QOOUSER_SEQ ON dbo.BUYTBL_INFO

--CREATE INDEX IDX__BUYTBL_INFO__BUY_QOOUSER_SEQ__PRODUCT_SERIAL__BUY_DATE ON dbo.BUYTBL_INFO (buy_qoouser_seq,product_serial,buy_date)

--DROP INDEX IDX__BUYTBL_INFO__BUY_QOOUSER_SEQ__PRODUCT_SERIAL ON dbo.BUYTBL_INFO




--CREATE INDEX IDX__BUYTBL_INFO__BUY_DATE ON dbo.BUYTBL_INFO (buy_date)



--CREATE INDEX IDX__ELECTRONIC_PRODUCTS__ELECT_PRODSERIAL__PRODUCT_MANUFACTURER_COMP_SEQ ON dbo.ELECTRONIC_PRODUCTS (elect_prodserial,product_manufacturer_comp_seq)