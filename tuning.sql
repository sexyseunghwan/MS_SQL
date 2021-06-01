
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


set STATISTICS IO off
set STATISTICS TIME off



--select top(20) * from dbo.QOO10_USER_REAL with(nolock)






declare @num int = 0
while (@num < 100)
begin
declare @login_code int
exec dbo.qoo10_total_login '123.123.123', '1', '3', @login_code output
select @login_code
set @num += 1
end

select * from dbo.LOGINTRYIP with(nolock)


		begin tran
			-- 아이피 로그기록 남기기
			insert into dbo.LOGINTRYIP 
			(
				ip_address
			,	try_time
			)
			values 
			(
				@user_ip_address
			,	default
			)
		commit tran


		-- 시도한 횟수 : 15초안에 4번이상 시도하면, 밴을 시킨다.
		select @try_count = count(*) from dbo.LOGINTRYIP with(nolock) 
		where ip_address = @user_ip_address 
		and  DATEDIFF(ss,try_time,getdate()) <= 15
	

		if (@try_count >= 4)
		begin
			begin tran
				insert into dbo.TBLBANNEDIPLIST values (@user_ip_address)
			commit tran
		end