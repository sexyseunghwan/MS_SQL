
set arithabort off 
set STATISTICS IO on
set STATISTICS TIME on
	



SELECT 
	name
,	buseo
,	SUM(basicPay) AS sum_pay
FROM dbo.TBLINSA WITH(NOLOCK)
GROUP BY
GROUPING SETS
(
	(name,buseo),
	(buseo),
	(name),
	()
)



set STATISTICS IO off
set STATISTICS TIME off

--CREATE INDEX IDX__TEST2 ON dbo.BUYTBL_INFO (buy_qoouser_seq,buy_date)



--CREATE INDEX IDX__TEST ON dbo.BUYTBL_INFO (buy_date)

--QOO10_USER_REAL

--CREATE INDEX IDX__QOO10_USER_REAL__QOOUSER_GENDER__QOOUSER_NATION ON dbo.QOO10_USER_REAL (qoouser_gender,qoouser_nation)


