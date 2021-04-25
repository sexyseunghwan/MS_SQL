



SELECT * FROM dbo.TBLINSA WITH(NOLOCK)




SELECT ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) as rm,name,occupation FROM dbo.OCCUPATIONS


SELECT * FROM dbo.OCCUPATIONS WITH(NOLOCK)


SELECT 
	ROW_NUMBER() OVER (PARTITION BY buseo ORDER BY basicpay+sudang DESC) AS rn
,	name
,	ssn
,	ibsaDate
,	city
,	tel
,	buseo
,	jikwi
,	basicpay as salary
,	sudang
FROM dbo.TBLINSA WITH(NOLOCK)


SELECT
	num
,	name
,	ssn
,	ibsaDate
,	city
,	tel
,	buseo
,	jikwi
,	basicpay as salary
,	sudang 
FROM dbo.TBLINSA WITH(NOLOCK)
ORDER BY salary DESC
OFFSET 56 ROWS


SELECT COUNT(*) AS total FROM dbo.TBLINSA WITH(NOLOCK)




SELECT TOP (1) PERCENT
	name
,	ssn
,	ibsaDate
,	city
,	tel
,	buseo
,	jikwi
,	basicpay as salary
,	sudang 
FROM dbo.TBLINSA WITH(NOLOCK)
ORDER BY salary DESC




SELECT 
	name
,	ssn
,	city
,	tel
,	buseo
,	jikwi
,	basicpay 
,	sudang 
FROM dbo.TBLINSA WITH(NOLOCK)
ORDER BY ibsaDate DESC




SELECT DISTINCT
	city
,	jikwi
,	buseo
FROM dbo.TBLINSA WITH(NOLOCK)
ORDER BY city DESC















create table dbo.QOO10_USER_REAL 
(  
	qoouser_id varchar(100) not null,--회원 아이디
	qoouser_pw varchar(800) not null, -- 회원 비밀번호 encryption
	qoouser_birthday datetime,--회원 생년월일
	qoouser_email varchar(200) null,--회원 이메일 
	qoouser_gender char(1) null,--회원 성별 
	qoouser_nation char(2) null,-- 회원 국가 
	qoouser_ipaddress varchar(200) null,-- 회원 아이피주소
	qoouser_hascoin int not null,-- 회원이 소유한 코인
	qoouser_phone_num varchar(20) not null,-- 회원의 전화번호
	qoouser_grade int not null, -- 회원의 등급
	qoouser_receive_email char(1) not null, -- 회원의 이메일 수신 여부
	qoouser_receive_sms char(1) not null, -- 회원의 문자 수신 여부
	qoouser_denide char(1) not null, -- 차단된 회원인지 여부
	qoouser_register_datetime datetime not null, -- 회원 등록일
	qoouser_lastlogin_datetime datetime null, -- 회원이 최종 로그인 시간
	qoouser_lastlogin_ipaddress varchar(200) null--회원의 최종 로그인 아이피
)


SELECT * 
FROM dbo.QOO10_USER_REAL WITH(NOLOCK) 
WHERE qoouser_lastlogin_datetime >= '2021-03-31'

ALTER TABLE dbo.QOO10_USER_REAL ADD CONSTRAINT PK__QOO10_USER_REAL__QOOUSER_ID PRIMARY KEY (qoouser_id)


SELECT DISTINCT
	qoouser_grade
,	qoouser_nation
,	qoouser_register_datetime
FROM dbo.QOO10_USER_REAL WITH(NOLOCK)
WHERE qoouser_register_datetime > '2008-01-01'




SELECT 
	qoouser_grade
,	qoouser_nation
,	COUNT(*) AS cnt
,	MAX(qoouser_hascoin) AS richcoin
FROM dbo.QOO10_USER_REAL
WHERE qoouser_register_datetime > '2008-01-01'
GROUP BY qoouser_grade, qoouser_nation
HAVING MAX(qoouser_hascoin) > 3014000

SELECT 
	qoouser_grade
,	qoouser_nation
,	COUNT(*) -- 컬럼을 변형
,	MAX(qoouser_hascoin) -- 컬럼을 변형
FROM dbo.QOO10_USER_REAL
WHERE qoouser_register_datetime > '2008-01-01'
GROUP BY qoouser_grade, qoouser_nation
HAVING MAX(qoouser_hascoin) > 3014000



SELECT
	qoouser_grade
,	qoouser_nation
,	YEAR(qoouser_birthday) AS btd
FROM dbo.QOO10_USER_REAL WITH(NOLOCK)

--WHERE qoouser_birthday >= '2000'



DROP TABLE dbo.TESTSH

CREATE TABLE dbo.TESTSH
(
	seq INT NOT NULL,
	name VARCHAR(20) NULL,
	nation CHAR(2) NULL
)

ALTER TABLE dbo.TESTSH ADD CONSTRAINT PK__TESTSH__SEQ PRIMARY KEY (seq)

INSERT INTO dbo.TESTSH VALUES (1,'harry','KR')
INSERT INTO dbo.TESTSH VALUES (2,'harry','SG')
INSERT INTO dbo.TESTSH VALUES (3,'harry','KR')
INSERT INTO dbo.TESTSH VALUES (4,'jhone','KR')
INSERT INTO dbo.TESTSH VALUES (5,'krul','CN')
INSERT INTO dbo.TESTSH VALUES (6,'galua','JP')

SELECT name,nation FROM dbo.TESTSH WITH(NOLOCK) 

SELECT DISTINCT name,nation FROM dbo.TESTSH WITH(NOLOCK) 




INSERT INTO dbo.TESTSH VALUES (1,10)
INSERT INTO dbo.TESTSH VALUES (2,20)
INSERT INTO dbo.TESTSH VALUES (3,10)
INSERT INTO dbo.TESTSH VALUES (4,20)
INSERT INTO dbo.TESTSH VALUES (5,50)
INSERT INTO dbo.TESTSH VALUES (6,NULL)

SELECT SUM(etcdata) FROM dbo.TESTSH WITH(NOLOCK)

SELECT SUM(DISTINCT etcdata) FROM dbo.TESTSH WITH(NOLOCK)


INSERT INTO dbo.TESTSH VALUES (1,'DATA1')
INSERT INTO dbo.TESTSH VALUES (2,'DATA2')
INSERT INTO dbo.TESTSH VALUES (3,NULL)
INSERT INTO dbo.TESTSH VALUES (4,'DATA4')

SELECT COUNT(*) AS cnt FROM dbo.TESTSH WITH(NOLOCK)

SELECT SUM(DISTINCT etcdata) AS cnt FROM dbo.TESTSH WITH(NOLOCK)






SELECT qoouser_hascoin FROM dbo.QOO10_USER_REAL WITH(NOLOCK)






SELECT 
	qoouser_grade
,	qoouser_nation
,	COUNT(*) AS cnt
FROM dbo.QOO10_USER_REAL
WHERE qoouser_register_datetime >= '2008-01-01'
GROUP BY qoouser_grade, qoouser_nation
HAVING COUNT(*) > 4500
ORDER BY qoouser_grade, qoouser_nation


SELECT qoouser_id,qoouser_grade, YEAR(qoouser_birthday) AS birthyear, COUNT(*) AS cnt
FROM dbo.QOO10_USER_REAL
WHERE qoouser_nation = 'KR'
GROUP BY qoouser_id,qoouser_grade, YEAR(qoouser_birthday)
HAVING COUNT(*) > 1
ORDER BY qoouser_id, birthyear



SELECT TOP(100) * FROM dbo.QOO10_USER_REAL  WITH(NOLOCK)



SELECT qoouser_grade, YEAR(qoouser_birthday) AS birthyear
FROM dbo.QOO10_USER_REAL
WHERE qoouser_nation = 'KR'


SELECT qoouser_id,qoouser_grade, YEAR(qoouser_birthday) AS birthyear, COUNT(*) AS cnt
FROM dbo.QOO10_USER_REAL
WHERE qoouser_nation = 'KR'
GROUP BY qoouser_id,qoouser_grade, YEAR(qoouser_birthday)
HAVING COUNT(*) > 1
ORDER BY qoouser_id, birthyear








SELECT * FROM dbo.USERTBL

SELECT * FROM dbo.BUYTBL

--ALTER TABLE dbo.USERTBL ADD CONSTRAINT PK__USERTBL__USERID PRIMARY KEY (userID)

--ALTER TABLE dbo.BUYTBL ADD CONSTRAINT PK__BUYTBL__NUM PRIMARY KEY (num)

--alter table dbo.BUYTBL drop constraint PK__buyTbl__DF908D65297564CE

--alter table dbo.BUYTBL drop constraint FK__buyTbl__userID__795DFB40 

--ALTER TABLE dbo.BUYTBL ADD CONSTRAINT FK__BUYTBL__USERID FOREIGN KEY (userid) REFERENCES dbo.USERTBL (userid)--이런식으로 참조키 지정

SELECT * FROM dbo.USERTBL WITH(NOLOCK)


ALTER TABLE dbo.USERTBL ADD CONSTRAINT DF__USERTBL__MDATE DEFAULT getdate() FOR mDate


INSERT INTO dbo.USERTBL 
(
	userID
,	name
,	birthYear
,	addr
,	mobile1
,	mobile2
,	height
)
VALUES 
(
	'ssh9308'
,	N'신나라'
,	1987
,	N'인천'
,	'010'
,	'12347899'
,	180
)


SELECT * FROM dbo.BUYTBL WITH(NOLOCK)

--  WITH NOCHECK

ALTER TABLE dbo.BUYTBL WITH NOCHECK ADD CONSTRAINT CHK__BUYTBL__PRICE__AMOUNT CHECK (price >= 0 and amount >= 0)
 
--ALTER TABLE dbo.BUYTBL DROP CONSTRAINT CHK__BUYTBL__PRICE__AMOUNT




INSERT INTO dbo.BUYTBL VALUES ('KBS',N'아이스크림',N'식료품',-1,3)
INSERT INTO dbo.BUYTBL VALUES ('KBS',N'아이스크림',N'식료품',-1,-3)
INSERT INTO dbo.BUYTBL VALUES ('KBS',N'아이스크림',N'식료품',1,-3)

INSERT INTO dbo.BUYTBL VALUES ('KBS',N'아이스크림',N'식료품',1000,3)

