

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
  (1001, 'ȫ�浿', '871212-1022432', '2008-10-11', '����', '011-2356-4528', '��ȹ��',
   '����', 2610000, 200000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1002, '�̼���', '901007-1544236', '2010-11-29', '���', '010-4758-6532', '�ѹ���',
   '���', 1320000, 200000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1003, '�̼���', '870922-2312547', '2009-02-25', '��õ', '010-4231-1236', '���ߺ�',
   '����', 2550000, 160000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1004, '������', '890304-1788896', '2010-10-01', '����', '019-5236-4221', '������',
   '�븮', 1954200, 170000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1005, '�Ѽ���', '911112-1566789', '2014-08-13', '����', '018-5211-3542', '�ѹ���',
   '���', 1420000, 160000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1006, '�̱���', '880505-2978541', '2012-02-11', '��õ', '010-3214-5357', '���ߺ�',
   '����', 2265000, 150000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1007, '����ö', '880506-1625148', '2008-03-16', '����', '011-2345-2525', '���ߺ�',
   '�븮', 1250000, 150000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1008, '�迵��', '921011-2362514', '2012-04-30', '����', '016-2222-4444', 'ȫ����',
'���', 950000 , 145000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1009, '������', '910810-1552147', '2013-10-10', '���', '019-1111-2222', '�λ��',
   '���', 840000 , 220400);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1010, '������', '851010-1122233', '2007-08-08', '�λ�', '011-3214-5555', '������',
   '����', 2540000, 130000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1011, '������', '901010-2987897', '2010-07-07', '����', '010-8888-4422', '������',
   '���', 1020000, 140000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1012, '���ѱ�', '860909-1333333', '2009-10-16', '����', '018-2222-4242', 'ȫ����',
   '���', 880000 , 114000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1013, '���̼�', '890102-2777777', '2008-06-07', '���', '019-6666-4444', 'ȫ����',
   '�븮', 1601000, 103000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1014, 'Ȳ����', '910707-2574812', '2012-02-15', '��õ', '010-3214-5467', '���ߺ�',
   '���', 1100000, 130000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1015, '������', '900606-2954687', '2009-07-26', '���', '016-2548-3365', '�ѹ���',
   '���', 1050000, 104000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1016, '�̻���', '881010-1666678', '2011-11-29', '���', '010-4526-1234', '���ߺ�',
   '����', 2350000, 150000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1017, '�����', '920507-1452365', '2010-08-28', '��õ', '010-3254-2542', '���ߺ�',
   '���', 950000 , 210000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1018, '�̼���', '901028-1849534', '2014-08-08', '����', '018-1333-3333', '���ߺ�',
   '���', 880000 , 123000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1019, '�ڹ���', '880710-1985632', '2009-12-10', '����', '017-4747-4848', '�λ��',
   '����', 2300000, 165000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1020, '������', '900304-2741258', '2013-10-10', '����', '011-9595-8585', '�����',
   '���', 880000 , 140000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1021, 'ȫ�泲', '901010-1111111', '2011-09-07', '���', '011-9999-7575', '���ߺ�',
   '���', 875000 , 120000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1022, '�̿���', '900501-2312456', '2013-02-25', '����', '017-5214-5282', '��ȹ��',
   '�븮', 1960000, 180000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1023, '���μ�', '831211-1214576', '2005-02-23', '����', NULL           , '������',
   '����', 2500000, 170000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1024, '�踻��', '930225-2633334', '2009-08-28', '����', '011-5248-7789', '��ȹ��',
   '�븮', 1900000, 170000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1025, '�����', '901103-1654442', '2010-10-01', '����', '010-4563-2587', '������',
   '���', 1100000, 160000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1026, '�����', '910907-2015457', '2012-08-28', '���', '010-2112-5225', '������',
   '���', 1050000, 150000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1027, '�迵��', '901216-1898752', '2010-10-18', '����', '019-8523-1478', '�ѹ���',
   '����', 2340000, 170000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1028, '�̳���', '910101-1010101', '2011-09-07', '����', '016-1818-4848', '�λ��',
   '���', 892000 , 110000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1029, '�踻��', '900301-2020202', '2010-09-08', '����', '016-3535-3636', '�ѹ���',
   '���', 920000 , 124000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1030, '������', '890210-2101010', '2009-10-17', '�λ�', '019-6564-6752', '�ѹ���',
   '����', 2304000, 124000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1031, '����ȯ', '871115-1687988', '2011-01-21', '����', '019-5552-7511', '��ȹ��',
   '����', 2450000, 160000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1032, '�ɽ���', '910206-2222222', '2010-05-05', '����', '016-8888-7474', '�����',
   '���', 880000 , 108000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1033, '��̳�', '880505-2999999', '2008-06-07', '����', '011-2444-4444', '������',
   '���', 1020000, 104000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1034, '������', '920505-1325468', '2015-09-26', '���', '011-3697-7412', '��ȹ��',
   '���', 1100000, 160000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1035, '������', '931010-2153252', '2012-05-16', '��õ', NULL           , '���ߺ�',
   '���', 1050000, 140000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1036, '���翵', '801126-2852147', '2013-08-10', '����', '011-9999-9999', '�����',
   '���', 960400 , 190000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1037, '�ּ���', '870129-1456987', '2008-10-15', '��õ', '011-7777-7777', 'ȫ����',
   '����', 2350000, 187000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1038, '���μ�', '891009-2321456', '2009-11-15', '�λ�', '010-6542-7412', '������',
   '�븮', 2000000, 150000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1039, '�����', '900504-2000032', '2013-12-28', '���', '010-2587-7895', '������',
   '�븮', 2010000, 160000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1040, '�ڼ���', '890509-1635214', '2010-09-10', '���', '016-4444-7777', '�λ��',
   '�븮', 2100000, 130000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1041, '�����', '821217-1951357', '2011-12-10', '�泲', '016-4444-5555', '�����',
   '����', 2300000, 150000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1042, 'ä����', '910709-2000054', '2013-10-17', '���', '011-5125-5511', '���ߺ�',
   '���', 1020000, 200000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1043, '��̿�', '930504-2471523', '2013-09-24', '����', '016-8548-6547', '������',
   '���', 1100000, 210000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1044, '����ȯ', '920305-1475286', '2014-01-21', '����', '011-5555-7548', '������',
   '���', 1060000, 220000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1045, 'ȫ����', '690906-1985214', '2013-03-16', '����', '011-7777-7777', '������',
   '���', 960000 , 152000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1046, '����', '860105-1458752', '2009-05-04', '�泲', '017-3333-3333', '�ѹ���',
   '����', 2650000, 150000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1047, '�긶��', '880505-1234567', '2011-07-15', '����', '018-0505-0505', '������',
   '�븮', 2100000, 112000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1048, '�̱��', '890604-1415141', '2011-06-07', '����', NULL           , '���ߺ�',
   '�븮', 2050000, 106000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1049, '�̹̼�', '930908-2456548', '2010-04-07', '��õ', '010-6654-8854', '���ߺ�',
   '���', 1300000, 130000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1050, '�̹���', '910403-2828287', '2013-06-07', '���', '011-8585-5252', 'ȫ����',
   '�븮', 1950000, 103000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1051, '�ǿ���', '890303-2155554', '2010-06-04', '����', '011-5555-7548', '������',
   '����', 2260000, 104000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1052, '�ǿ���', '920406-2000456', '2010-10-10', '���', '010-3644-5577', '��ȹ��',
   '���', 1020000, 105000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1053, '��̽�', '900715-1313131', '2009-12-12', '����', '011-7585-7474', '�����',
   '���', 960000 , 108000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1054, '����ȣ', '910705-1212141', '2009-10-16', '����', '016-1919-4242', 'ȫ����',
   '���', 980000 , 114000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1055, '���ѳ�', '920506-2425153', '2014-06-07', '����', '016-2424-4242', '������',
   '���', 1000000, 104000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1056, '������', '900605-1456987', '2014-08-13', '��õ', '010-7549-8654', '������',
   '�븮', 1950000, 200000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1057, '�̹̰�', '880406-2003214', '2008-02-11', '���', '016-6542-7546', '�����',
   '����', 2520000, 160000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1058, '�����', '900709-1321456', '2013-08-08', '��õ', '010-2415-5444', '��ȹ��',
   '�븮', 1950000, 180000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1059, '�Ӽ���', '910809-2121244', '2011-10-10', '����', '011-4151-4154', '���ߺ�',
   '���', 890000 , 102000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1060, '��ž�', '910809-2111111', '2011-10-10', '����', '011-4151-4444', '���ߺ�',
   '���', 900000 , 102000);


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


exec dbo.sh_test1 '��ȹ��'



select * from dbo.TBLINSA with(nolock)

--�ڱ� �̸� , �μ� �̸��� �Է����� ��쿡 �ڱ� ������ ������ �ϴ� ���ν����� ¥����
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

declare @empJikwi varchar(15) -- ���� ����
select @empJikwi = jikwi from dbo.TBLINSA with(nolock) where name = @name and buseo = @buseo;

if (@empJikwi='���')
begin
	select name,buseo,jikwi from dbo.TBLINSA with (nolock) where buseo = @buseo and jiwi
end

	
end




select * from tblinsa

exec dbo.sangsa 'ȫ�浿','��ȹ��'

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
	where t2.name = 'ȫ�浿'



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


--where t1.jikwi = '����'


CREATE INDEX [IDX__TBLINSA__NAME] ON dbo.TBLINSA (name)

DROP INDEX [IDX__TBLINSA__NAME] ON dbo.TBLINSA


CREATE INDEX [IDX__TBLINSA__JIKWI] ON dbo.TBLINSA (jikwi)

DROP INDEX [IDX__TBLINSA__JIKWI] ON dbo.TBLINSA

--,index=IDX__TBLINSA__JIKWI__BUSE__NAME

DROP INDEX [IDX__TBLINSA__JIKWI__BUSE__NAME] ON dbo.TBLINSA

CREATE INDEX [IDX__TBLINSA__JIKWI__BUSE__NAME] ON dbo.TBLINSA (jikwi,buseo,name)


select name from dbo.TBLINSA with(nolock) where buseo = '���ߺ�'


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

INSERT INTO dbo.NISSTAFF VALUES ('ssh9308','BY789*798','�Ž�ȯ','����� ���ı�','DEV','MANAGER')
INSERT INTO dbo.NISSTAFF VALUES ('dsy9206','sy170125','����','��⵵ �����ֽ�','MARKETING','STAFF') 
INSERT INTO dbo.NISSTAFF VALUES ('Iasd8339','ASFHK#$%4345','�豸��','����� ������','DESIGN','LEADER') 
INSERT INTO dbo.NISSTAFF VALUES ('asdwr7895','fjkhdj^5i894','������','��⵵ ������','DEV','STAFF') 
INSERT INTO dbo.NISSTAFF VALUES ('fhkjd82','287965@#$','������','������ ���ʽ�','DEV','MANAGER') 


SELECT * FROM dbo.NISSTAFF WITH(NOLOCK)


go


drop proc dbo.nis_login

create procedure dbo.nis_login
(
	@id varchar(20),--���̵�
	@pw varchar(30)--��й�ȣ
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

INSERT INTO dbo.NISSTAFF VALUES ('admin','1234','������','���� ���ı�','DEV','STAFF')

go

create procedure dbo.nis_staff_info
(
	@id varchar(20)--���̵�
)
AS
BEGIN
SET NOCOUNT ON 
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	select id,name,address,buseo,jikwi from dbo.NISSTAFF with(nolock) where id = @id;
end


exec dbo.nis_staff_info 'ssh9308'

select * from dbo.NISSTAFF with(nolock)

--exec dbo.nis_login 'ssh9308','BY789��*798'


drop table dbo.TBLIP

--������ �α� ���̺� ����
CREATE TABLE dbo.TBLIP
(
	seq int identity(1,1) not null,
	ip_number varchar(100) not null,
	come_date datetime not null
		constraint DF__TBLIP__COME_DATE DEFAULT getdate()
)

select * from dbo.TBLIP

ALTER TABLE dbo.TBLIP ADD CONSTRAINT PK__TBLIP__SEQ PRIMARY KEY CLUSTERED (seq)

--�������� ���� ������ ����Ʈ ����
CREATE TABLE dbo.BANEDIP
(
	seq int identity(1,1) not null,--pk
	banned_ip_number varchar(100) not null--������ ���ϰ��� ip
)

ALTER TABLE dbo.BANEDIP ADD CONSTRAINT PK__BANEDIP__SEQ PRIMARY KEY CLUSTERED (seq)


insert into dbo.BANEDIP values ('211.36.157.252')

select * from dbo.BANEDIP with(nolock)

go


drop proc dbo.nis_banned_ip

create procedure dbo.nis_banned_ip
(
	@banned_ip_number varchar(100)--�Է� ������
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


-- ������ �α� Ȯ���ϴ� ���ν���
create procedure dbo.nis_ip_log
(
	@ip varchar(100)--�����ǹ�ȣ
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
	userid char(8) NOT NULL,--����� ���̵� 
	name varchar(20) NOT NULL,--�̸� 
	birthday int NOT NULL,--����⵵ 
	nation char(2) NOT NULL,--������� 
	mobile1 char(3),--�޴����� ���� 
	mobile2 char(8),--�޴����� ������ ��ȭ��ȣ(������ ����) 
	height smallint,--Ű 
	mdate date--ȸ�� ������ 
	
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
	userid char(8) NOT NULL,--����� ���̵� 
	name varchar(20) NOT NULL,--�̸� 
	birthday int NOT NULL,--����⵵ 
	nation char(2) NOT NULL,--������� 
	mobile1 char(3) NULL,--�޴����� ���� 
	mobile2 char(8) NULL,--�޴����� ������ ��ȭ��ȣ(������ ����) 
	height smallint NULL,--Ű 
	mdate date NULL--ȸ�� ������ 
	CONSTRAINT PK__USERTBL__USERID PRIMARY KEY (userid) 
);

INSERT INTO dbo.USERTBL VALUES ('ssh9308','ssh',1993,'KR','010','51393792',180,'2020-01-01') -- USERTBL �� ������ �ϳ� ����

CREATE TABLE dbo.BUYTBL 
( 
	num int IDENTITY(1,1) NOT NULL,--����(pk) 
	userid char(8) NOT NULL,--���̵�(fk) 
	prodname varchar(10) NOT NULL,--��ǰ�� 
	groupname varchar(10) NULL,--�з� 
	price int NOT NULL,--�ܰ� 
	amount smallint NOT NULL--���� 
	CONSTRAINT FK__BUYTBL__USERTBL__USERID 
		FOREIGN KEY (userid) REFERENCES dbo.USERTBL (userid) 
		ON UPDATE CASCADE 
)

INSERT INTO dbo.BUYTBL VALUES ('ssh9308','ps5','sony',500000,1) -- USERTBL �� �����ϴ� ID�� REFERENCES 

UPDATE dbo.USERTBL SET userid = 'ssh9301' where userid = 'ssh9308' 


SELECT * FROM dbo.USERTBL WITH(NOLOCK)
SELECT * FROM dbo.BUYTBL WITH(NOLOCK)

DROP TABLE dbo.BUYTBL
DROP TABLE dbo.USERTBL


CREATE TABLE dbo.USERTBL
(
	userid char(8) NOT NULL,--����� ���̵�
	name varchar(20) NOT NULL,--�̸�
	birthday int NOT NULL,--����⵵
	nation char(2) NOT NULL,--�������
	mobile1 char(3) NULL,--�޴����� ����
	mobile2 char(8) NULL,--�޴����� ������ ��ȭ��ȣ(������ ����)
	height smallint NULL,--Ű
	mdate date NULL--ȸ�� ������
	CONSTRAINT PK__USERTBL__USERID PRIMARY KEY (userid)
);

INSERT INTO dbo.USERTBL VALUES ('ssh9308','ssh',1993,'KR','010','51393792',180,'2020-01-01') -- USERTBL �� ������ �ϳ� ����

CREATE TABLE dbo.BUYTBL
(
	num int IDENTITY(1,1) NOT NULL,--����(pk)
	userid char(8) NOT NULL,--���̵�(fk)
	prodname varchar(10) NOT NULL,--��ǰ��
	groupname varchar(10) NULL,--�з�
	price int NOT NULL,--�ܰ�
	amount smallint NOT NULL--����
	CONSTRAINT FK__BUYTBL__USERTBL__USERID
		FOREIGN KEY (userid) REFERENCES dbo.USERTBL (userid)
		ON DELETE CASCADE
);

INSERT INTO dbo.BUYTBL VALUES ('ssh9308','ps5','sony',500000,1) -- USERTBL �� �����ϴ� ID�� REFERENCES 

DELETE FROM dbo.USERTBL WHERE userid = 'ssh9308' -- USERTBL �� �����ϴ� ������ ������ ����





--�ӽ����̺� ����
CREATE TABLE #TBL_SH_PRIME
(
    seq int identity(1,1) not null,
    prime_number int not null
);

CREATE PROCEDURE dbo.sh_prime_test 
( 
    @input_num int--sp �Ķ���� : upper bound 
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
         
        -- ���ν��� ������ ���(��ǥ) �˼� �� ��� �߿��Ѱ� UPDATE INSERT DELETE ���� ���Ŀ��� ERROR ó���� �ݵ�� ����� �Ѵ�.
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
    @input_num int--sp �Ķ���� : upper bound 
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
         
        -- ���ν��� ������ ���(��ǥ) �˼� �� ��� �߿��Ѱ� UPDATE INSERT DELETE ���� ���Ŀ��� ERROR ó���� �ݵ�� ����� �Ѵ�.
	if @@error <> 0 
	begin 
		return -1 
	end 
        set @num += 1 
    end 
end;


exec dbo.sh_prime_test 1000 -- 1000 ���� ���� ������ �Ҽ��� ���ڸ� ��� �ӽ����̺� �־��ش�.

drop table #TBL_SH_PRIME

select * from #TBL_SH_PRIME -- �ӽ����̺� �ҷ�����


