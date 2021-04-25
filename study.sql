



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
	qoouser_id varchar(100) not null,--ȸ�� ���̵�
	qoouser_pw varchar(800) not null, -- ȸ�� ��й�ȣ encryption
	qoouser_birthday datetime,--ȸ�� �������
	qoouser_email varchar(200) null,--ȸ�� �̸��� 
	qoouser_gender char(1) null,--ȸ�� ���� 
	qoouser_nation char(2) null,-- ȸ�� ���� 
	qoouser_ipaddress varchar(200) null,-- ȸ�� �������ּ�
	qoouser_hascoin int not null,-- ȸ���� ������ ����
	qoouser_phone_num varchar(20) not null,-- ȸ���� ��ȭ��ȣ
	qoouser_grade int not null, -- ȸ���� ���
	qoouser_receive_email char(1) not null, -- ȸ���� �̸��� ���� ����
	qoouser_receive_sms char(1) not null, -- ȸ���� ���� ���� ����
	qoouser_denide char(1) not null, -- ���ܵ� ȸ������ ����
	qoouser_register_datetime datetime not null, -- ȸ�� �����
	qoouser_lastlogin_datetime datetime null, -- ȸ���� ���� �α��� �ð�
	qoouser_lastlogin_ipaddress varchar(200) null--ȸ���� ���� �α��� ������
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
,	COUNT(*) -- �÷��� ����
,	MAX(qoouser_hascoin) -- �÷��� ����
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

--ALTER TABLE dbo.BUYTBL ADD CONSTRAINT FK__BUYTBL__USERID FOREIGN KEY (userid) REFERENCES dbo.USERTBL (userid)--�̷������� ����Ű ����

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
,	N'�ų���'
,	1987
,	N'��õ'
,	'010'
,	'12347899'
,	180
)


SELECT * FROM dbo.BUYTBL WITH(NOLOCK)

--  WITH NOCHECK

ALTER TABLE dbo.BUYTBL WITH NOCHECK ADD CONSTRAINT CHK__BUYTBL__PRICE__AMOUNT CHECK (price >= 0 and amount >= 0)
 
--ALTER TABLE dbo.BUYTBL DROP CONSTRAINT CHK__BUYTBL__PRICE__AMOUNT




INSERT INTO dbo.BUYTBL VALUES ('KBS',N'���̽�ũ��',N'�ķ�ǰ',-1,3)
INSERT INTO dbo.BUYTBL VALUES ('KBS',N'���̽�ũ��',N'�ķ�ǰ',-1,-3)
INSERT INTO dbo.BUYTBL VALUES ('KBS',N'���̽�ũ��',N'�ķ�ǰ',1,-3)

INSERT INTO dbo.BUYTBL VALUES ('KBS',N'���̽�ũ��',N'�ķ�ǰ',1000,3)

