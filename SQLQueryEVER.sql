


select * from dbo.QOO10_USER_REAL_2015 with(nolock)

drop table dbo.QOO10_USER_REAL


SELECT * INTO dbo.QOO10_USER_REAL_2008 FROM dbo.QOO10_USER_REAL WHERE qoouser_register_datetime BETWEEN '2008-01-01' AND '2009-01-01'

ALTER TABLE dbo.QOO10_USER_REAL_2008 ADD CONSTRAINT PK__QOO10_USER_REAL_2008__QOOUSER_SEQ PRIMARY KEY (qoouser_seq)

SELECT * INTO dbo.QOO10_USER_REAL_2009 FROM dbo.QOO10_USER_REAL WHERE QOOUSER_REGISTER_DATETIME between '2009-01-01' AND '2010-01-01'

ALTER TABLE dbo.QOO10_USER_REAL_2009 ADD CONSTRAINT PK__QOO10_USER_REAL_2009__QOOUSER_SEQ PRIMARY KEY (qoouser_seq)


DROP TABLE dbo.USER_PARTITION_TEST


CREATE TABLE dbo.USER_PARTITION_TEST
(
	user_seq BIGINT NOT NULL
,	user_id VARCHAR(100) NOT NULL
,	user_email VARCHAR(200) 
,	user_grade INT NOT NULL
,	reg_dt CHAR(8) NOT NULL
) ON ps_register_date (reg_dt)

INSERT INTO dbo.USER_PARTITION_TEST
(
	user_seq 
,	user_id 
,	user_email 
,	user_grade 
,	reg_dt 
)
SELECT
	qoouser_seq
,	qoouser_id
,	qoouser_email
,	qoouser_grade	
,	replace(convert(char(10),qoouser_register_datetime,23),'-','') 
FROM dbo.QOO10_USER_REAL
WHERE qoouser_seq < 100000


SELECT 
	$PARTITION.pf_register_date(reg_dt) AS partition_number
,	MAX(reg_dt) AS date
,	COUNT(*) AS cnt
FROM dbo.USER_PARTITION_TEST WITH(NOLOCK)
GROUP BY $PARTITION.pf_register_date(reg_dt)



SELECT
	'20021223' AS input_data
,	$PARTITION.pf_register_date('20021223') AS expect_value


SELECT * FROM dbo.USER_PARTITION_TEST


replace(convert(char(10),reg_dt,23),'-','') 


SELECT * FROM SYS.PARTITION_FUNCTIONS


SELECT * FROM SYS.PARTITION_RANGE_VALUES WHERE function_id = 65536


CREATE PARTITION SCHEME ps_register_date_2
AS PARTITION pf_register_date
TO 
(
	[PRIMARY], [PRIMARY], [UFG01]
)



SELECT 
	a.*
,	b.*
FROM SYS.DESTINATION_DATA_SPACES a
INNER JOIN SYS.DATA_SPACES b ON a.data_space_id = b.data_space_id



SELECT * FROM SYS.PARTITION_SCHEMES



--asdasd

CREATE PARTITION FUNCTION pf_register_date( char(8) )
AS RANGE RIGHT
FOR VALUES (
	'2002'	/* 2002년 파티션 */
,	'2003'	/* 2003년 파티션 */
,	'2004'	/* 2004년 파티션*/
)



select year(qoouser_register_datetime) , count(*) from dbo.QOO10_USER_REAL with(nolock) group by year(qoouser_register_datetime)




USE master GO -- FirstDB02에 UFG01 사용자 정의 파일 그룹 추가 

ALTER DATABASE ADMIN ADD FILEGROUP UFG01 

GO 

-- UFG01 파일 그룹에 파일 추가 
ALTER DATABASE ADMIN 
ADD FILE ( 
	NAME = 'FirstDB02_03', 
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TESTDB_02.ndf',
	SIZE = 512MB, 
	FILEGROWTH = 128MB 
) 
TO FILEGROUP UFG01


;

GO 

-- UFG01 파일 그룹을 기본 파일 그룹으로 변경 
ALTER DATABASE FirstDB02 MODIFY FILEGROUP UFG01 DEFAULT GO


ALTER DATABASE ADMIN MODIFY FILEGROUP UFG01 DEFAULT


GO
