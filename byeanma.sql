

CREATE TABLE dbo.TBLINSA(
        num INT NOT NULL
       ,name VARCHAR(20) NOT NULL
       ,ssn  VARCHAR(14) NOT NULL
       ,ibsadate DATETIME     NOT NULL
       ,city  VARCHAR(10)
       ,tel   VARCHAR(15)
       ,buseo VARCHAR(15) NOT NULL
       ,jikwi VARCHAR(15) NOT NULL
       ,basicpay INT NOT NULL
       ,sudang INT NOT NULL
);


ALTER TABLE dbo.TBLINSA ADD CONSTRAINT [PK__TBLINSA__NUM] PRIMARY KEY CLUSTERED (num)  

INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1001, '홍길동', '871212-1022432', '2008-10-11', '서울', '011-2356-4528', '기획부',
   '부장', 2610000, 200000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1002, '이순신', '901007-1544236', '2010-11-29', '경기', '010-4758-6532', '총무부',
   '사원', 1320000, 200000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1003, '이순애', '870922-2312547', '2009-02-25', '인천', '010-4231-1236', '개발부',
   '부장', 2550000, 160000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1004, '김정훈', '890304-1788896', '2010-10-01', '전북', '019-5236-4221', '영업부',
   '대리', 1954200, 170000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1005, '한석봉', '911112-1566789', '2014-08-13', '서울', '018-5211-3542', '총무부',
   '사원', 1420000, 160000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1006, '이기자', '880505-2978541', '2012-02-11', '인천', '010-3214-5357', '개발부',
   '과장', 2265000, 150000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1007, '장인철', '880506-1625148', '2008-03-16', '제주', '011-2345-2525', '개발부',
   '대리', 1250000, 150000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1008, '김영년', '921011-2362514', '2012-04-30', '서울', '016-2222-4444', '홍보부',
'사원', 950000 , 145000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1009, '나윤균', '910810-1552147', '2013-10-10', '경기', '019-1111-2222', '인사부',
   '사원', 840000 , 220400);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1010, '김종서', '851010-1122233', '2007-08-08', '부산', '011-3214-5555', '영업부',
   '부장', 2540000, 130000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1011, '유관순', '901010-2987897', '2010-07-07', '서울', '010-8888-4422', '영업부',
   '사원', 1020000, 140000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1012, '정한국', '860909-1333333', '2009-10-16', '강원', '018-2222-4242', '홍보부',
   '사원', 880000 , 114000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1013, '조미숙', '890102-2777777', '2008-06-07', '경기', '019-6666-4444', '홍보부',
   '대리', 1601000, 103000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1014, '황진이', '910707-2574812', '2012-02-15', '인천', '010-3214-5467', '개발부',
   '사원', 1100000, 130000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1015, '이현숙', '900606-2954687', '2009-07-26', '경기', '016-2548-3365', '총무부',
   '사원', 1050000, 104000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1016, '이상헌', '881010-1666678', '2011-11-29', '경기', '010-4526-1234', '개발부',
   '과장', 2350000, 150000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1017, '엄용수', '920507-1452365', '2010-08-28', '인천', '010-3254-2542', '개발부',
   '사원', 950000 , 210000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1018, '이성길', '901028-1849534', '2014-08-08', '전북', '018-1333-3333', '개발부',
   '사원', 880000 , 123000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1019, '박문수', '880710-1985632', '2009-12-10', '서울', '017-4747-4848', '인사부',
   '과장', 2300000, 165000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1020, '유영희', '900304-2741258', '2013-10-10', '전남', '011-9595-8585', '자재부',
   '사원', 880000 , 140000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1021, '홍길남', '901010-1111111', '2011-09-07', '경기', '011-9999-7575', '개발부',
   '사원', 875000 , 120000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1022, '이영숙', '900501-2312456', '2013-02-25', '전남', '017-5214-5282', '기획부',
   '대리', 1960000, 180000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1023, '김인수', '831211-1214576', '2005-02-23', '서울', NULL           , '영업부',
   '부장', 2500000, 170000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1024, '김말자', '930225-2633334', '2009-08-28', '서울', '011-5248-7789', '기획부',
   '대리', 1900000, 170000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1025, '우재옥', '901103-1654442', '2010-10-01', '서울', '010-4563-2587', '영업부',
   '사원', 1100000, 160000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1026, '김숙남', '910907-2015457', '2012-08-28', '경기', '010-2112-5225', '영업부',
   '사원', 1050000, 150000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1027, '김영길', '901216-1898752', '2010-10-18', '서울', '019-8523-1478', '총무부',
   '과장', 2340000, 170000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1028, '이남신', '910101-1010101', '2011-09-07', '제주', '016-1818-4848', '인사부',
   '사원', 892000 , 110000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1029, '김말숙', '900301-2020202', '2010-09-08', '서울', '016-3535-3636', '총무부',
   '사원', 920000 , 124000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1030, '정정해', '890210-2101010', '2009-10-17', '부산', '019-6564-6752', '총무부',
   '과장', 2304000, 124000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1031, '지재환', '871115-1687988', '2011-01-21', '서울', '019-5552-7511', '기획부',
   '부장', 2450000, 160000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1032, '심심해', '910206-2222222', '2010-05-05', '전북', '016-8888-7474', '자재부',
   '사원', 880000 , 108000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1033, '김미나', '880505-2999999', '2008-06-07', '서울', '011-2444-4444', '영업부',
   '사원', 1020000, 104000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1034, '이정석', '920505-1325468', '2015-09-26', '경기', '011-3697-7412', '기획부',
   '사원', 1100000, 160000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1035, '정영희', '931010-2153252', '2012-05-16', '인천', NULL           , '개발부',
   '사원', 1050000, 140000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1036, '이재영', '801126-2852147', '2013-08-10', '서울', '011-9999-9999', '자재부',
   '사원', 960400 , 190000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1037, '최석규', '870129-1456987', '2008-10-15', '인천', '011-7777-7777', '홍보부',
   '과장', 2350000, 187000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1038, '손인수', '891009-2321456', '2009-11-15', '부산', '010-6542-7412', '영업부',
   '대리', 2000000, 150000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1039, '고순정', '900504-2000032', '2013-12-28', '경기', '010-2587-7895', '영업부',
   '대리', 2010000, 160000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1040, '박세열', '890509-1635214', '2010-09-10', '경북', '016-4444-7777', '인사부',
   '대리', 2100000, 130000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1041, '문길수', '821217-1951357', '2011-12-10', '충남', '016-4444-5555', '자재부',
   '과장', 2300000, 150000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1042, '채정희', '910709-2000054', '2013-10-17', '경기', '011-5125-5511', '개발부',
   '사원', 1020000, 200000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1043, '양미옥', '930504-2471523', '2013-09-24', '서울', '016-8548-6547', '영업부',
   '사원', 1100000, 210000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1044, '지수환', '920305-1475286', '2014-01-21', '서울', '011-5555-7548', '영업부',
   '사원', 1060000, 220000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1045, '홍원신', '690906-1985214', '2013-03-16', '전북', '011-7777-7777', '영업부',
   '사원', 960000 , 152000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1046, '허경운', '860105-1458752', '2009-05-04', '경남', '017-3333-3333', '총무부',
   '부장', 2650000, 150000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1047, '산마루', '880505-1234567', '2011-07-15', '서울', '018-0505-0505', '영업부',
   '대리', 2100000, 112000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1048, '이기상', '890604-1415141', '2011-06-07', '전남', NULL           , '개발부',
   '대리', 2050000, 106000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1049, '이미성', '930908-2456548', '2010-04-07', '인천', '010-6654-8854', '개발부',
   '사원', 1300000, 130000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1050, '이미인', '910403-2828287', '2013-06-07', '경기', '011-8585-5252', '홍보부',
   '대리', 1950000, 103000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1051, '권영미', '890303-2155554', '2010-06-04', '서울', '011-5555-7548', '영업부',
   '과장', 2260000, 104000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1052, '권옥경', '920406-2000456', '2010-10-10', '경기', '010-3644-5577', '기획부',
   '사원', 1020000, 105000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1053, '김싱식', '900715-1313131', '2009-12-12', '전북', '011-7585-7474', '자재부',
   '사원', 960000 , 108000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1054, '정상호', '910705-1212141', '2009-10-16', '강원', '016-1919-4242', '홍보부',
   '사원', 980000 , 114000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1055, '정한나', '920506-2425153', '2014-06-07', '서울', '016-2424-4242', '영업부',
   '사원', 1000000, 104000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1056, '전용재', '900605-1456987', '2014-08-13', '인천', '010-7549-8654', '영업부',
   '대리', 1950000, 200000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1057, '이미경', '880406-2003214', '2008-02-11', '경기', '016-6542-7546', '자재부',
   '부장', 2520000, 160000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1058, '김신제', '900709-1321456', '2013-08-08', '인천', '010-2415-5444', '기획부',
   '대리', 1950000, 180000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1059, '임수봉', '910809-2121244', '2011-10-10', '서울', '011-4151-4154', '개발부',
   '사원', 890000 , 102000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1060, '김신애', '910809-2111111', '2011-10-10', '서울', '011-4151-4444', '개발부',
   '사원', 900000 , 102000);


-----------------------------------------



SELECT * FROM dbo.TBLINSA WITH(NOLOCK)



create procedure dbo.sh_test1
(
	@buseo varchar(15)
)
AS
BEGIN
SET NOCOUNT ON 
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	select name,buseo,jikwi from dbo.TBLINSA with(nolock) where buseo = @buseo;
end


exec dbo.sh_test1 '기획부'



select * from dbo.TBLINSA with(nolock)

--자기 이름 , 부서 이름을 입력했을 경우에 자기 상사들이 나오게 하는 프로시저를 짜보자
go


--drop procedure dbo.sangsa
 

create procedure dbo.sangsa
(
	@name varchar(20),
	@buseo varchar(15)
)
AS
BEGIN
SET NOCOUNT ON 
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

declare @empJikwi varchar(15) -- 직원 지위
select @empJikwi = jikwi from dbo.TBLINSA with(nolock) where name = @name and buseo = @buseo;

if (@empJikwi='사원')
begin
	select name,buseo,jikwi from dbo.TBLINSA with (nolock) where buseo = @buseo and jiwi
end

	
end




select * from tblinsa

exec dbo.sangsa '홍길동','기획부'

go 



drop table dbo.HACKEDiNFO

create table dbo.HACKEDiNFO
(
	seq int identity(1,1),
	id varchar(200) null,
	pw varchar(200) null
)

ALTER TABLE dbo.TBLINSA ADD CONSTRAINT [PK__TBLINSA__NUM] PRIMARY KEY CLUSTERED (num)  


alter table dbo.HACKEDiNFO add constraint [PK__HACKEDiNFO] PRIMARY KEY CLUSTERED (seq)


select * from dbo.HACKEDiNFO

insert into dbo.HACKEDiNFO values ('123','123')

insert into dbo.HACKEDiNFO (id,pw) values ('234','567')







set arithabort off 
set STATISTICS IO on
set STATISTICS TIME on
 --          select t1.name,t1.buseo from dbo.TBLINSA t1 with(nolock)
	--left outer join dbo.TBLINSA t2 on t1.name = t2.name
	--left outer join  dbo.TBLINSA t3 on t2.name = t3.name
	--left outer join  dbo.TBLINSA t4 on t3.name = t4.name


	select t1.jikwi,t1.buseo from dbo.TBLINSA t1 with(nolock) 
	left outer join dbo.TBLINSA t2 on t1.name = t2.name

	select t1.jikwi,t1.buseo from dbo.TBLINSA t1 with(nolock,index=IDX__TBLINSA__NAME) 
	left outer join dbo.TBLINSA t2 on t1.name = t2.name

set STATISTICS IO off
set STATISTICS TIME off






CREATE INDEX [IDX__TBLBUSEO__NAME__BUSEO] ON dbo.TBLINSA (name,buseo)

DROP INDEX [IDX__TBLBUSEO__NAME__BUSEO] ON dbo.TBLINSA


select t1.jikwi,t1.buseo from dbo.TBLINSA t1 with(nolock) 
	inner join dbo.TBLINSA t2 on t1.name = t2.name

select t1.name,t1.basicpay from dbo.TBLINSA t1 with(nolock,index = IDX__TBLINSA__NAME) 
	inner join dbo.TBLINSA t2 on t1.name = t2.name
	where t2.name = '홍길동'



CREATE INDEX [IDX__TBLINSA__BASICPAY] ON dbo.TBLINSA (basicpay)
CREATE INDEX [IDX__TBLINSA__NAME] ON dbo.TBLINSA (name)

CREATE INDEX [IDX__TBLINSA__NAME__BASICPAY] ON dbo.TBLINSA (name,basicpay)

CREATE INDEX [IDX__TBLINSA__NAME] ON dbO.TBLINSA (name)

DROP INDEX [IDX__TBLINSA__BASICPAY] ON dbo.TBLINSA
DROP INDEX [IDX__TBLINSA__NAME] ON dbo.TBLINSA


CREATE INDEX [IDX__TBLINSA__NAME] ON dbo.TBLINSA (basicpay)




CREATE INDEX [IDX__TBLINSA__BASICPAY] ON dbo.TBLINSA (basicpay)

CREATE INDEX [IDX__TBLINSA__NAME__BASICPAY] ON dbo.TBLINSA (name,basicpay)


DROP INDEX [IDX__TBLINSA__NAME__BASICPAY] ON dbo.TBLINSA


--where t1.jikwi = '부장'


CREATE INDEX [IDX__TBLINSA__NAME] ON dbo.TBLINSA (name)

DROP INDEX [IDX__TBLINSA__NAME] ON dbo.TBLINSA


CREATE INDEX [IDX__TBLINSA__JIKWI] ON dbo.TBLINSA (jikwi)

DROP INDEX [IDX__TBLINSA__JIKWI] ON dbo.TBLINSA

--,index=IDX__TBLINSA__JIKWI__BUSE__NAME

DROP INDEX [IDX__TBLINSA__JIKWI__BUSE__NAME] ON dbo.TBLINSA

CREATE INDEX [IDX__TBLINSA__JIKWI__BUSE__NAME] ON dbo.TBLINSA (jikwi,buseo,name)


select name from dbo.TBLINSA with(nolock) where buseo = '개발부'


CREATE INDEX [IDX__TBLINSA__BUSEO__NAME] ON dbo.TBLINSA (buseo,name)

DROP INDEX [IDX__TBLINSA__BUSEO__NAME] ON dbo.TBLINSA


DROP INDEX IDX__TBLINSA__JIKWI__BUSE__NAME ON dbo.TBLINSA 


SELECT * FROM dbo.TBLIP

SELECT * FROM dbo.HACKEDiNFO


CREATE TABLE dbo.NISSTAFF
(
	id varchar(20) not null,
	pw varchar(30) not null,
	name nvarchar(6) not null,
	address varchar(100) null,
	buseo varchar(10) null,
	jikwi nvarchar(10) not null
)

ALTER TABLE dbo.NISSTAFF ADD CONSTRAINT PK__NISSTAFF__ID PRIMARY KEY (id)

DROP INDEX [IDX__NISSTAFF__ID__PW] ON dbo.NISSTAFF
CREATE INDEX [IDX__NISSTAFF__ID__PW] ON dbo.NISSTAFF (id,pw)

--DROP INDEX [IDX__NISSTAFF__ID__PW] ON dbo.NISSTAFF (id,pw)

INSERT INTO dbo.NISSTAFF VALUES ('ssh9308','BY789*798','신승환','서울시 송파구','DEV','MANAGER')
INSERT INTO dbo.NISSTAFF VALUES ('dsy9206','sy170125','고서윤','경기도 남양주시','MARKETING','STAFF') 
INSERT INTO dbo.NISSTAFF VALUES ('Iasd8339','ASFHK#$%4345','김구라','서울시 강남구','DESIGN','LEADER') 
INSERT INTO dbo.NISSTAFF VALUES ('asdwr7895','fjkhdj^5i894','강림원','경기도 성남시','DEV','STAFF') 
INSERT INTO dbo.NISSTAFF VALUES ('fhkjd82','287965@#$','강원진','강원도 속초시','DEV','MANAGER') 


SELECT * FROM dbo.NISSTAFF WITH(NOLOCK)


go


drop proc dbo.nis_login

create procedure dbo.nis_login
(
	@id varchar(20),--아이디
	@pw varchar(30)--비밀번호
)
AS
BEGIN
SET NOCOUNT ON 
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	select count(*) as staffcount from dbo.NISSTAFF with(nolock,forceseek) where id = @id and pw = @pw;

end

select count(*) as staffcount from dbo.NISSTAFF with(nolock) where id = 'admin' and pw = '1234';

select count(*) as staffcount from dbo.NISSTAFF with(nolock) where id = 'admin' or pw = '1234' and pw = '';


SELECT * FROM dbo.NISSTAFF WITH(NOLOCK)

INSERT INTO dbo.NISSTAFF VALUES ('admin','1234','관리자','서울 송파구','DEV','STAFF')

go

create procedure dbo.nis_staff_info
(
	@id varchar(20)--아이디
)
AS
BEGIN
SET NOCOUNT ON 
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	select id,name,address,buseo,jikwi from dbo.NISSTAFF with(nolock) where id = @id;
end


exec dbo.nis_staff_info 'ssh9308'

select * from dbo.NISSTAFF with(nolock)

--exec dbo.nis_login 'ssh9308','BY789ㄷ*798'


drop table dbo.TBLIP

--아이피 로그 테이블 생성
CREATE TABLE dbo.TBLIP
(
	seq int identity(1,1) not null,
	ip_number varchar(100) not null,
	come_date datetime not null
		constraint DF__TBLIP__COME_DATE DEFAULT getdate()
)

select * from dbo.TBLIP

ALTER TABLE dbo.TBLIP ADD CONSTRAINT PK__TBLIP__SEQ PRIMARY KEY CLUSTERED (seq)

--접근하지 못할 아이피 리스트 생성
CREATE TABLE dbo.BANEDIP
(
	seq int identity(1,1) not null,--pk
	banned_ip_number varchar(100) not null--들어오지 못하게할 ip
)

ALTER TABLE dbo.BANEDIP ADD CONSTRAINT PK__BANEDIP__SEQ PRIMARY KEY CLUSTERED (seq)


insert into dbo.BANEDIP values ('211.36.157.252')

select * from dbo.BANEDIP with(nolock)

go


drop proc dbo.nis_banned_ip

create procedure dbo.nis_banned_ip
(
	@banned_ip_number varchar(100)--입력 아이피
)
AS
BEGIN
SET NOCOUNT ON 
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	
	select count(*) as banned_ip_true from dbo.BANEDIP with(nolock) where  banned_ip_number = @banned_ip_number;

end

	

go




drop procedure dbo.nis_ip_log


go


-- 아이피 로그 확인하는 프로시저
create procedure dbo.nis_ip_log
(
	@ip varchar(100)--아이피번호
)
AS
BEGIN
SET NOCOUNT ON 
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	insert into dbo.TBLIP values (@ip,default);

end


go

insert into dbo.TBLIP values ('192.556.998',DEFAULT);


exec dbo.nis_ip_log '192.556.998'



select * from dbo.TBLIP with(nolock)



DROP TABLE dbo.USERTBL

DROP TABLE dbo.BUYTBL

CREATE TABLE dbo.USERTBL 
( 
	userid char(8) NOT NULL,--사용자 아이디 
	name varchar(20) NOT NULL,--이름 
	birthday int NOT NULL,--출생년도 
	nation char(2) NOT NULL,--출생국가 
	mobile1 char(3),--휴대폰의 국번 
	mobile2 char(8),--휴대폰의 나머지 전화번호(하이픈 제외) 
	height smallint,--키 
	mdate date--회원 가입일 
	
	CONSTRAINT PK__USERTBL__USERID PRIMARY KEY (userid) 
);

INSERT INTO dbo.USERTBL VALUES ('ssh9308','messi',1983,'KR',NULL,NULL,NULL,NULL)

INSERT INTO dbo.USERTBL VALUES('KSY8803','RONALDO',NULL,NULL,NULL,NULL,NULL,NULL)

SELECT * FROM dbo.USERTBL WITH(NOLOCK)

SELECT * FROM dbo.HACKEDiNFO WITH(NOLOCK)

SELECT * FROM dbo.

SELECT * FROM DBO.TBLINSA


DROP TABLE dbo.TBLSPARESE
DROP TABLE dbo.TBLNOTSPARESE

CREATE TABLE dbo.TBLSPARESE
(
	id int identity(1,1) NOT NULL,
	data char(100) SPARSE NULL
)

CREATE TABLE dbo.TBLNOTSPARESE
(
	id int identity(1,1) NOT NULL,
	data char(100) NULL 
)


DECLARE @i INT = 0
WHILE @I < 100000
BEGIN
	INSERT INTO dbo.TBLSPARESE VALUES ('HI');
	INSERT INTO dbo.TBLNOTSPARESE VALUES ('HI');
	SET @i += 1
END


SELECT * FROM dbo.TBLSPARESE WITH(NOLOCK)
SELECT * FROM dbo.TBLNOTSPARESE WITH(NOLOCK)


go

drop table dbo.USERTBL

CREATE TABLE dbo.USERTBL 
( 
	userid char(8) NOT NULL,--사용자 아이디 
	name varchar(20) NOT NULL,--이름 
	birthday int NOT NULL,--출생년도 
	nation char(2) NOT NULL,--출생국가 
	mobile1 char(3) NULL,--휴대폰의 국번 
	mobile2 char(8) NULL,--휴대폰의 나머지 전화번호(하이픈 제외) 
	height smallint NULL,--키 
	mdate date NULL--회원 가입일 
	CONSTRAINT PK__USERTBL__USERID PRIMARY KEY (userid) 
);

INSERT INTO dbo.USERTBL VALUES ('ssh9308','ssh',1993,'KR','010','51393792',180,'2020-01-01') -- USERTBL 에 데이터 하나 삽입

CREATE TABLE dbo.BUYTBL 
( 
	num int IDENTITY(1,1) NOT NULL,--순번(pk) 
	userid char(8) NOT NULL,--아이디(fk) 
	prodname varchar(10) NOT NULL,--물품명 
	groupname varchar(10) NULL,--분류 
	price int NOT NULL,--단가 
	amount smallint NOT NULL--수량 
	CONSTRAINT FK__BUYTBL__USERTBL__USERID 
		FOREIGN KEY (userid) REFERENCES dbo.USERTBL (userid) 
		ON UPDATE CASCADE 
)

INSERT INTO dbo.BUYTBL VALUES ('ssh9308','ps5','sony',500000,1) -- USERTBL 에 존재하는 ID를 REFERENCES 

UPDATE dbo.USERTBL SET userid = 'ssh9301' where userid = 'ssh9308' 


SELECT * FROM dbo.USERTBL WITH(NOLOCK)
SELECT * FROM dbo.BUYTBL WITH(NOLOCK)

DROP TABLE dbo.BUYTBL
DROP TABLE dbo.USERTBL


CREATE TABLE dbo.USERTBL
(
	userid char(8) NOT NULL,--사용자 아이디
	name varchar(20) NOT NULL,--이름
	birthday int NOT NULL,--출생년도
	nation char(2) NOT NULL,--출생국가
	mobile1 char(3) NULL,--휴대폰의 국번
	mobile2 char(8) NULL,--휴대폰의 나머지 전화번호(하이픈 제외)
	height smallint NULL,--키
	mdate date NULL--회원 가입일
	CONSTRAINT PK__USERTBL__USERID PRIMARY KEY (userid)
);

INSERT INTO dbo.USERTBL VALUES ('ssh9308','ssh',1993,'KR','010','51393792',180,'2020-01-01') -- USERTBL 에 데이터 하나 삽입

CREATE TABLE dbo.BUYTBL
(
	num int IDENTITY(1,1) NOT NULL,--순번(pk)
	userid char(8) NOT NULL,--아이디(fk)
	prodname varchar(10) NOT NULL,--물품명
	groupname varchar(10) NULL,--분류
	price int NOT NULL,--단가
	amount smallint NOT NULL--수량
	CONSTRAINT FK__BUYTBL__USERTBL__USERID
		FOREIGN KEY (userid) REFERENCES dbo.USERTBL (userid)
		ON DELETE CASCADE
);

INSERT INTO dbo.BUYTBL VALUES ('ssh9308','ps5','sony',500000,1) -- USERTBL 에 존재하는 ID를 REFERENCES 

DELETE FROM dbo.USERTBL WHERE userid = 'ssh9308' -- USERTBL 에 존재하는 한행의 데이터 삭제





--임시테이블 설정
CREATE TABLE #TBL_SH_PRIME
(
    seq int identity(1,1) not null,
    prime_number int not null
);

CREATE PROCEDURE dbo.sh_prime_test 
( 
    @input_num int--sp 파라미터 : upper bound 
) 
as 
begin 
    set nocount on 
    set transaction isolation level read uncommitted 
     
    declare @num int = 2 
    while(@num < @input_num) 
    begin 
        if not exists (select prime_number from #TBL_SH_PRIME where prime_number % @num = 0) 
        begin 
            insert into #TBL_SH_PRIME values (@num) 
        end 
         
        -- 프로시저 생성할 경우(준표) 검수 할 경우 중요한것 UPDATE INSERT DELETE 구문 직후에는 ERROR 처리를 반드시 해줘야 한다.
	if @@error <> 0 
	begin 
		return -1 
	end 
        set @num += 1 
    end 
end;


drop proc dbo.sh_prime_test

CREATE PROCEDURE dbo.sh_prime_test 
( 
    @input_num int--sp 파라미터 : upper bound 
) 
as 
begin 
    set nocount on 
    set transaction isolation level read uncommitted 
     
    declare @num int = 2 
    while(@num < @input_num) 
    begin 
        if not exists (select prime_number from #TBL_SH_PRIME where @num % prime_number = 0) 
        begin 
            insert into #TBL_SH_PRIME values (@num) 
        end 
         
        -- 프로시저 생성할 경우(준표) 검수 할 경우 중요한것 UPDATE INSERT DELETE 구문 직후에는 ERROR 처리를 반드시 해줘야 한다.
	if @@error <> 0 
	begin 
		return -1 
	end 
        set @num += 1 
    end 
end;


exec dbo.sh_prime_test 1000 -- 1000 보다 작은 정수중 소수인 숫자를 모두 임시테이블에 넣어준다.

drop table #TBL_SH_PRIME

select * from #TBL_SH_PRIME -- 임시테이블 불러오기


