
--public void 
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
  (1001, '?띻만??, '871212-1022432', '2008-10-11', '?쒖슱', '011-2356-4528', '湲고쉷遺',
   '遺??, 2610000, 200000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1002, '?댁닚??, '901007-1544236', '2010-11-29', '寃쎄린', '010-4758-6532', '珥앸Т遺',
   '?ъ썝', 1320000, 200000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1003, '?댁닚??, '870922-2312547', '2009-02-25', '?몄쿇', '010-4231-1236', '媛쒕컻遺',
   '遺??, 2550000, 160000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1004, '源?뺥썕', '890304-1788896', '2010-10-01', '?꾨턿', '019-5236-4221', '?곸뾽遺',
   '?由?, 1954200, 170000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1005, '?쒖꽍遊?, '911112-1566789', '2014-08-13', '?쒖슱', '018-5211-3542', '珥앸Т遺',
   '?ъ썝', 1420000, 160000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1006, '?닿린??, '880505-2978541', '2012-02-11', '?몄쿇', '010-3214-5357', '媛쒕컻遺',
   '怨쇱옣', 2265000, 150000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1007, '?μ씤泥?, '880506-1625148', '2008-03-16', '?쒖＜', '011-2345-2525', '媛쒕컻遺',
   '?由?, 1250000, 150000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1008, '源?곷뀈', '921011-2362514', '2012-04-30', '?쒖슱', '016-2222-4444', '?띾낫遺',
'?ъ썝', 950000 , 145000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1009, '?섏쑄洹?, '910810-1552147', '2013-10-10', '寃쎄린', '019-1111-2222', '?몄궗遺',
   '?ъ썝', 840000 , 220400);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1010, '源醫낆꽌', '851010-1122233', '2007-08-08', '遺??, '011-3214-5555', '?곸뾽遺',
   '遺??, 2540000, 130000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1011, '?좉???, '901010-2987897', '2010-07-07', '?쒖슱', '010-8888-4422', '?곸뾽遺',
   '?ъ썝', 1020000, 140000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1012, '?뺥븳援?, '860909-1333333', '2009-10-16', '媛뺤썝', '018-2222-4242', '?띾낫遺',
   '?ъ썝', 880000 , 114000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1013, '議곕???, '890102-2777777', '2008-06-07', '寃쎄린', '019-6666-4444', '?띾낫遺',
   '?由?, 1601000, 103000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1014, '?⑹쭊??, '910707-2574812', '2012-02-15', '?몄쿇', '010-3214-5467', '媛쒕컻遺',
   '?ъ썝', 1100000, 130000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1015, '?댄쁽??, '900606-2954687', '2009-07-26', '寃쎄린', '016-2548-3365', '珥앸Т遺',
   '?ъ썝', 1050000, 104000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1016, '?댁긽??, '881010-1666678', '2011-11-29', '寃쎄린', '010-4526-1234', '媛쒕컻遺',
   '怨쇱옣', 2350000, 150000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1017, '?꾩슜??, '920507-1452365', '2010-08-28', '?몄쿇', '010-3254-2542', '媛쒕컻遺',
   '?ъ썝', 950000 , 210000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1018, '?댁꽦湲?, '901028-1849534', '2014-08-08', '?꾨턿', '018-1333-3333', '媛쒕컻遺',
   '?ъ썝', 880000 , 123000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1019, '諛뺣Ц??, '880710-1985632', '2009-12-10', '?쒖슱', '017-4747-4848', '?몄궗遺',
   '怨쇱옣', 2300000, 165000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1020, '?좎쁺??, '900304-2741258', '2013-10-10', '?꾨궓', '011-9595-8585', '?먯옱遺',
   '?ъ썝', 880000 , 140000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1021, '?띻만??, '901010-1111111', '2011-09-07', '寃쎄린', '011-9999-7575', '媛쒕컻遺',
   '?ъ썝', 875000 , 120000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1022, '?댁쁺??, '900501-2312456', '2013-02-25', '?꾨궓', '017-5214-5282', '湲고쉷遺',
   '?由?, 1960000, 180000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1023, '源?몄닔', '831211-1214576', '2005-02-23', '?쒖슱', NULL           , '?곸뾽遺',
   '遺??, 2500000, 170000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1024, '源留먯옄', '930225-2633334', '2009-08-28', '?쒖슱', '011-5248-7789', '湲고쉷遺',
   '?由?, 1900000, 170000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1025, '?곗옱??, '901103-1654442', '2010-10-01', '?쒖슱', '010-4563-2587', '?곸뾽遺',
   '?ъ썝', 1100000, 160000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1026, '源?숇궓', '910907-2015457', '2012-08-28', '寃쎄린', '010-2112-5225', '?곸뾽遺',
   '?ъ썝', 1050000, 150000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1027, '源?곴만', '901216-1898752', '2010-10-18', '?쒖슱', '019-8523-1478', '珥앸Т遺',
   '怨쇱옣', 2340000, 170000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1028, '?대궓??, '910101-1010101', '2011-09-07', '?쒖＜', '016-1818-4848', '?몄궗遺',
   '?ъ썝', 892000 , 110000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1029, '源留먯닕', '900301-2020202', '2010-09-08', '?쒖슱', '016-3535-3636', '珥앸Т遺',
   '?ъ썝', 920000 , 124000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1030, '?뺤젙??, '890210-2101010', '2009-10-17', '遺??, '019-6564-6752', '珥앸Т遺',
   '怨쇱옣', 2304000, 124000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1031, '吏?ы솚', '871115-1687988', '2011-01-21', '?쒖슱', '019-5552-7511', '湲고쉷遺',
   '遺??, 2450000, 160000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1032, '?ъ떖??, '910206-2222222', '2010-05-05', '?꾨턿', '016-8888-7474', '?먯옱遺',
   '?ъ썝', 880000 , 108000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1033, '源誘몃굹', '880505-2999999', '2008-06-07', '?쒖슱', '011-2444-4444', '?곸뾽遺',
   '?ъ썝', 1020000, 104000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1034, '?댁젙??, '920505-1325468', '2015-09-26', '寃쎄린', '011-3697-7412', '湲고쉷遺',
   '?ъ썝', 1100000, 160000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1035, '?뺤쁺??, '931010-2153252', '2012-05-16', '?몄쿇', NULL           , '媛쒕컻遺',
   '?ъ썝', 1050000, 140000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1036, '?댁옱??, '801126-2852147', '2013-08-10', '?쒖슱', '011-9999-9999', '?먯옱遺',
   '?ъ썝', 960400 , 190000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1037, '理쒖꽍洹?, '870129-1456987', '2008-10-15', '?몄쿇', '011-7777-7777', '?띾낫遺',
   '怨쇱옣', 2350000, 187000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1038, '?먯씤??, '891009-2321456', '2009-11-15', '遺??, '010-6542-7412', '?곸뾽遺',
   '?由?, 2000000, 150000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1039, '怨좎닚??, '900504-2000032', '2013-12-28', '寃쎄린', '010-2587-7895', '?곸뾽遺',
   '?由?, 2010000, 160000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1040, '諛뺤꽭??, '890509-1635214', '2010-09-10', '寃쎈턿', '016-4444-7777', '?몄궗遺',
   '?由?, 2100000, 130000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1041, '臾멸만??, '821217-1951357', '2011-12-10', '異⑸궓', '016-4444-5555', '?먯옱遺',
   '怨쇱옣', 2300000, 150000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1042, '梨꾩젙??, '910709-2000054', '2013-10-17', '寃쎄린', '011-5125-5511', '媛쒕컻遺',
   '?ъ썝', 1020000, 200000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1043, '?묐???, '930504-2471523', '2013-09-24', '?쒖슱', '016-8548-6547', '?곸뾽遺',
   '?ъ썝', 1100000, 210000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1044, '吏?섑솚', '920305-1475286', '2014-01-21', '?쒖슱', '011-5555-7548', '?곸뾽遺',
   '?ъ썝', 1060000, 220000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1045, '?띿썝??, '690906-1985214', '2013-03-16', '?꾨턿', '011-7777-7777', '?곸뾽遺',
   '?ъ썝', 960000 , 152000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1046, '?덇꼍??, '860105-1458752', '2009-05-04', '寃쎈궓', '017-3333-3333', '珥앸Т遺',
   '遺??, 2650000, 150000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1047, '?곕쭏猷?, '880505-1234567', '2011-07-15', '?쒖슱', '018-0505-0505', '?곸뾽遺',
   '?由?, 2100000, 112000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1048, '?닿린??, '890604-1415141', '2011-06-07', '?꾨궓', NULL           , '媛쒕컻遺',
   '?由?, 2050000, 106000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1049, '?대???, '930908-2456548', '2010-04-07', '?몄쿇', '010-6654-8854', '媛쒕컻遺',
   '?ъ썝', 1300000, 130000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1050, '?대???, '910403-2828287', '2013-06-07', '寃쎄린', '011-8585-5252', '?띾낫遺',
   '?由?, 1950000, 103000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1051, '沅뚯쁺誘?, '890303-2155554', '2010-06-04', '?쒖슱', '011-5555-7548', '?곸뾽遺',
   '怨쇱옣', 2260000, 104000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1052, '沅뚯삦寃?, '920406-2000456', '2010-10-10', '寃쎄린', '010-3644-5577', '湲고쉷遺',
   '?ъ썝', 1020000, 105000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1053, '源?깆떇', '900715-1313131', '2009-12-12', '?꾨턿', '011-7585-7474', '?먯옱遺',
   '?ъ썝', 960000 , 108000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1054, '?뺤긽??, '910705-1212141', '2009-10-16', '媛뺤썝', '016-1919-4242', '?띾낫遺',
   '?ъ썝', 980000 , 114000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1055, '?뺥븳??, '920506-2425153', '2014-06-07', '?쒖슱', '016-2424-4242', '?곸뾽遺',
   '?ъ썝', 1000000, 104000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1056, '?꾩슜??, '900605-1456987', '2014-08-13', '?몄쿇', '010-7549-8654', '?곸뾽遺',
   '?由?, 1950000, 200000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1057, '?대?寃?, '880406-2003214', '2008-02-11', '寃쎄린', '016-6542-7546', '?먯옱遺',
   '遺??, 2520000, 160000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1058, '源?좎젣', '900709-1321456', '2013-08-08', '?몄쿇', '010-2415-5444', '湲고쉷遺',
   '?由?, 1950000, 180000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1059, '?꾩닔遊?, '910809-2121244', '2011-10-10', '?쒖슱', '011-4151-4154', '媛쒕컻遺',
   '?ъ썝', 890000 , 102000);
INSERT INTO tblInsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1060, '源?좎븷', '910809-2111111', '2011-10-10', '?쒖슱', '011-4151-4444', '媛쒕컻遺',
   '?ъ썝', 900000 , 102000);


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


exec dbo.sh_test1 '湲고쉷遺'



select * from dbo.TBLINSA with(nolock)

--?먭린 ?대쫫 , 遺???대쫫???낅젰?덉쓣 寃쎌슦???먭린 ?곸궗?ㅼ씠 ?섏삤寃??섎뒗 ?꾨줈?쒖?瑜?吏쒕낫??
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

declare @empJikwi varchar(15) -- 吏곸썝 吏??
select @empJikwi = jikwi from dbo.TBLINSA with(nolock) where name = @name and buseo = @buseo;

if (@empJikwi='?ъ썝')
begin
	select name,buseo,jikwi from dbo.TBLINSA with (nolock) where buseo = @buseo and jiwi
end

	
end




select * from tblinsa

exec dbo.sangsa '?띻만??,'湲고쉷遺'

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
	where t2.name = '?띻만??



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


--where t1.jikwi = '遺??


CREATE INDEX [IDX__TBLINSA__NAME] ON dbo.TBLINSA (name)

DROP INDEX [IDX__TBLINSA__NAME] ON dbo.TBLINSA


CREATE INDEX [IDX__TBLINSA__JIKWI] ON dbo.TBLINSA (jikwi)

DROP INDEX [IDX__TBLINSA__JIKWI] ON dbo.TBLINSA

--,index=IDX__TBLINSA__JIKWI__BUSE__NAME

DROP INDEX [IDX__TBLINSA__JIKWI__BUSE__NAME] ON dbo.TBLINSA

CREATE INDEX [IDX__TBLINSA__JIKWI__BUSE__NAME] ON dbo.TBLINSA (jikwi,buseo,name)


select name from dbo.TBLINSA with(nolock) where buseo = '媛쒕컻遺'


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

INSERT INTO dbo.NISSTAFF VALUES ('ssh9308','BY789*798','?좎듅??,'?쒖슱???≫뙆援?,'DEV','MANAGER')
INSERT INTO dbo.NISSTAFF VALUES ('dsy9206','sy170125','怨좎꽌??,'寃쎄린???⑥뼇二쇱떆','MARKETING','STAFF') 
INSERT INTO dbo.NISSTAFF VALUES ('Iasd8339','ASFHK#$%4345','源援щ씪','?쒖슱??媛뺣궓援?,'DESIGN','LEADER') 
INSERT INTO dbo.NISSTAFF VALUES ('asdwr7895','fjkhdj^5i894','媛뺣┝??,'寃쎄린???깅궓??,'DEV','STAFF') 
INSERT INTO dbo.NISSTAFF VALUES ('fhkjd82','287965@#$','媛뺤썝吏?,'媛뺤썝???띿큹??,'DEV','MANAGER') 


SELECT * FROM dbo.NISSTAFF WITH(NOLOCK)


go


drop proc dbo.nis_login

create procedure dbo.nis_login
(
	@id varchar(20),--?꾩씠??
	@pw varchar(30)--鍮꾨?踰덊샇
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

INSERT INTO dbo.NISSTAFF VALUES ('admin','1234','愿由ъ옄','?쒖슱 ?≫뙆援?,'DEV','STAFF')

go

create procedure dbo.nis_staff_info
(
	@id varchar(20)--?꾩씠??
)
AS
BEGIN
SET NOCOUNT ON 
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	select id,name,address,buseo,jikwi from dbo.NISSTAFF with(nolock) where id = @id;
end


exec dbo.nis_staff_info 'ssh9308'

select * from dbo.NISSTAFF with(nolock)

--exec dbo.nis_login 'ssh9308','BY789??798'


drop table dbo.TBLIP

--?꾩씠??濡쒓렇 ?뚯씠釉??앹꽦
CREATE TABLE dbo.TBLIP
(
	seq int identity(1,1) not null,
	ip_number varchar(100) not null,
	come_date datetime not null
		constraint DF__TBLIP__COME_DATE DEFAULT getdate()
)

select * from dbo.TBLIP

ALTER TABLE dbo.TBLIP ADD CONSTRAINT PK__TBLIP__SEQ PRIMARY KEY CLUSTERED (seq)

--?묎렐?섏? 紐삵븷 ?꾩씠??由ъ뒪???앹꽦
CREATE TABLE dbo.BANEDIP
(
	seq int identity(1,1) not null,--pk
	banned_ip_number varchar(100) not null--?ㅼ뼱?ㅼ? 紐삵븯寃뚰븷 ip
)

ALTER TABLE dbo.BANEDIP ADD CONSTRAINT PK__BANEDIP__SEQ PRIMARY KEY CLUSTERED (seq)


insert into dbo.BANEDIP values ('211.36.157.252')

select * from dbo.BANEDIP with(nolock)

go


drop proc dbo.nis_banned_ip

create procedure dbo.nis_banned_ip
(
	@banned_ip_number varchar(100)--?낅젰 ?꾩씠??
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


-- ?꾩씠??濡쒓렇 ?뺤씤?섎뒗 ?꾨줈?쒖?
create procedure dbo.nis_ip_log
(
	@ip varchar(100)--?꾩씠?쇰쾲??
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
	userid char(8) NOT NULL,--?ъ슜???꾩씠??
	name varchar(20) NOT NULL,--?대쫫 
	birthday int NOT NULL,--異쒖깮?꾨룄 
	nation char(2) NOT NULL,--異쒖깮援?? 
	mobile1 char(3),--?대??곗쓽 援?쾲 
	mobile2 char(8),--?대??곗쓽 ?섎㉧吏 ?꾪솕踰덊샇(?섏씠???쒖쇅) 
	height smallint,--??
	mdate date--?뚯썝 媛?낆씪 
	
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
	userid char(8) NOT NULL,--?ъ슜???꾩씠??
	name varchar(20) NOT NULL,--?대쫫 
	birthday int NOT NULL,--異쒖깮?꾨룄 
	nation char(2) NOT NULL,--異쒖깮援?? 
	mobile1 char(3) NULL,--?대??곗쓽 援?쾲 
	mobile2 char(8) NULL,--?대??곗쓽 ?섎㉧吏 ?꾪솕踰덊샇(?섏씠???쒖쇅) 
	height smallint NULL,--??
	mdate date NULL--?뚯썝 媛?낆씪 
	CONSTRAINT PK__USERTBL__USERID PRIMARY KEY (userid) 
);

INSERT INTO dbo.USERTBL VALUES ('ssh9308','ssh',1993,'KR','010','51393792',180,'2020-01-01') -- USERTBL ???곗씠???섎굹 ?쎌엯

CREATE TABLE dbo.BUYTBL 
( 
	num int IDENTITY(1,1) NOT NULL,--?쒕쾲(pk) 
	userid char(8) NOT NULL,--?꾩씠??fk) 
	prodname varchar(10) NOT NULL,--臾쇳뭹紐?
	groupname varchar(10) NULL,--遺꾨쪟 
	price int NOT NULL,--?④? 
	amount smallint NOT NULL--?섎웾 
	CONSTRAINT FK__BUYTBL__USERTBL__USERID 
		FOREIGN KEY (userid) REFERENCES dbo.USERTBL (userid) 
		ON UPDATE CASCADE 
)

INSERT INTO dbo.BUYTBL VALUES ('ssh9308','ps5','sony',500000,1) -- USERTBL ??議댁옱?섎뒗 ID瑜?REFERENCES 

UPDATE dbo.USERTBL SET userid = 'ssh9301' where userid = 'ssh9308' 


SELECT * FROM dbo.USERTBL WITH(NOLOCK)
SELECT * FROM dbo.BUYTBL WITH(NOLOCK)

DROP TABLE dbo.BUYTBL
DROP TABLE dbo.USERTBL


CREATE TABLE dbo.USERTBL
(
	userid char(8) NOT NULL,--?ъ슜???꾩씠??
	name varchar(20) NOT NULL,--?대쫫
	birthday int NOT NULL,--異쒖깮?꾨룄
	nation char(2) NOT NULL,--異쒖깮援??
	mobile1 char(3) NULL,--?대??곗쓽 援?쾲
	mobile2 char(8) NULL,--?대??곗쓽 ?섎㉧吏 ?꾪솕踰덊샇(?섏씠???쒖쇅)
	height smallint NULL,--??
	mdate date NULL--?뚯썝 媛?낆씪
	CONSTRAINT PK__USERTBL__USERID PRIMARY KEY (userid)
);

INSERT INTO dbo.USERTBL VALUES ('ssh9308','ssh',1993,'KR','010','51393792',180,'2020-01-01') -- USERTBL ???곗씠???섎굹 ?쎌엯

CREATE TABLE dbo.BUYTBL
(
	num int IDENTITY(1,1) NOT NULL,--?쒕쾲(pk)
	userid char(8) NOT NULL,--?꾩씠??fk)
	prodname varchar(10) NOT NULL,--臾쇳뭹紐?
	groupname varchar(10) NULL,--遺꾨쪟
	price int NOT NULL,--?④?
	amount smallint NOT NULL--?섎웾
	CONSTRAINT FK__BUYTBL__USERTBL__USERID
		FOREIGN KEY (userid) REFERENCES dbo.USERTBL (userid)
		ON DELETE CASCADE
);

INSERT INTO dbo.BUYTBL VALUES ('ssh9308','ps5','sony',500000,1) -- USERTBL ??議댁옱?섎뒗 ID瑜?REFERENCES 

DELETE FROM dbo.USERTBL WHERE userid = 'ssh9308' -- USERTBL ??議댁옱?섎뒗 ?쒗뻾???곗씠????젣


SELECT * FROM dbo.BUYTBL WITH(NOLOCK)


--?꾩떆?뚯씠釉??ㅼ젙
CREATE TABLE #TBL_SH_PRIME
(
    seq int identity(1,1) not null,
    prime_number int not null
);

CREATE PROCEDURE dbo.sh_prime_test 
( 
    @input_num int--sp ?뚮씪誘명꽣 : upper bound 
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
         
        -- ?꾨줈?쒖? ?앹꽦??寃쎌슦(以?? 寃????寃쎌슦 以묒슂?쒓쾬 UPDATE INSERT DELETE 援щЦ 吏곹썑?먮뒗 ERROR 泥섎━瑜?諛섎뱶???댁쨾???쒕떎.
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
    @input_num int--sp ?뚮씪誘명꽣 : upper bound 
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
         
        -- ?꾨줈?쒖? ?앹꽦??寃쎌슦(以?? 寃????寃쎌슦 以묒슂?쒓쾬 UPDATE INSERT DELETE 援щЦ 吏곹썑?먮뒗 ERROR 泥섎━瑜?諛섎뱶???댁쨾???쒕떎.
	if @@error <> 0 
	begin 
		return -1 
	end 
        set @num += 1 
    end 
end;


exec dbo.sh_prime_test 1000 -- 1000 蹂대떎 ?묒? ?뺤닔以??뚯닔???レ옄瑜?紐⑤몢 ?꾩떆?뚯씠釉붿뿉 ?ｌ뼱以??

drop table #TBL_SH_PRIME

select * from #TBL_SH_PRIME -- ?꾩떆?뚯씠釉?遺덈윭?ㅺ린


create table dbo.WANDS
(
	id int identity(1,1) not null,
	code int not null,
	coins_needed int not null,
	power int not null
)


insert into dbo.WANDS values (4,3688,8)
insert into dbo.WANDS values (3,9365,3)
insert into dbo.WANDS values (3,7187,10)
insert into dbo.WANDS values (3,734,8)
insert into dbo.WANDS values (1,6020,2)
insert into dbo.WANDS values (2,6773,7)
insert into dbo.WANDS values (3,9873,9)
insert into dbo.WANDS values (3,7721,7)
insert into dbo.WANDS values (1,1647,10)
insert into dbo.WANDS values (4,504,5)
insert into dbo.WANDS values (2,7587,5)
insert into dbo.WANDS values (5,9897,10)
insert into dbo.WANDS values (3,4651,8)
insert into dbo.WANDS values (2,5408,1)
insert into dbo.WANDS values (2,6018,7)
insert into dbo.WANDS values (4,7710,5)
insert into dbo.WANDS values (2,8798,7)
insert into dbo.WANDS values (2,3312,3)
insert into dbo.WANDS values (4,7651,6)
insert into dbo.WANDS values (5,5689,3)

select count(*) from dbo.WANDS


create table dbo.WANDS_PROPERTY
(
	code int not null,
	age int not null,
	is_evil int not null
)

insert into dbo.WANDS_PROPERTY values (1,45,0)
insert into dbo.WANDS_PROPERTY values (2,40,0)
insert into dbo.WANDS_PROPERTY values (3,4,1)
insert into dbo.WANDS_PROPERTY values (4,20,0)
insert into dbo.WANDS_PROPERTY values (5,17,0)


select * from dbo.WANDS



select w.id,wp.age,w.coins_needed,w.power from dbo.wands w
    inner join dbo.wands_property wp on w.code = wp.code
    where wp.is_evil = 0
    order by w.power desc, wp.age desc 


--w.id,wp.age,w.coins_needed,w.power

with CTE_SH_TBL
as
(
	select w.code,w.id,wp.age,min(w.coins_needed),w.power from wands w
    inner join wands_property wp on w.code = wp.code
    where wp.is_evil = 0
	group by w.code,w.id,wp.age,w.power
)

select * from CTE_SH_TBL


-- select h.hacker_id,h.name from Hackers h
--     inner join Challenge c on h.hacker

--select hacker_id from Submission s

-- select 
--     s.submission_id,--?쒖텧?꾩씠??
--     h.name,--?댁빱 ?대쫫
--     s.score,-- ?대떦 ?쒖텧 ?꾩씠?붾줈 ?살? ?먯닔
--     s.hacker_id,--?댁빱?꾩씠??
--     s.challenge_id,--?꾩쟾怨쇱젣?꾩씠??
--     c.difficulty_level,--?쒖씠??
--     d.score--?쒖씠???鍮?留뚯젏 ?먯닔
-- from Submissions s
--     inner join Challenges c on s.challenge_id = c.challenge_id
--     inner join Difficulty d on d.difficulty_level = c.difficulty_level
--     inner join Hackers h on h.hacker_id = s.hacker_id
-- group by s.challenge_id

--with cte_tbl(c_id,s_id,min_score,d_score)
--as
--(
--select s.challenge_id,s.hacker_id,min(s.score),d.score from Submissions s
--    inner join Challenges c on c.challenge_id = s.challenge_id
--    inner join Difficulty d on d.difficulty_level = c.difficulty_level
--    where s.score = d.score
--    group by s.challenge_id,s.hacker_id,d.score
--)    
--select s_id from cte_tbl
--having count(s_id) > 1 

--inner join ? ??긽 援먯쭛?⑹씤嫄??앷컖?섎㈃ ?명븯??吏꾩쭨濡??뗣뀑 ?몃컻 

select * from CHALLENGES c
	inner join DIFFICULTY d on c.difficulty_level = d.difficulty_level


create table dbo.HACKERS
(
	hacker_id int,
	name varchar(20)
)

insert into dbo.HACKERS values (5580,'Rose')
insert into dbo.HACKERS values (8439,'Angela')
insert into dbo.HACKERS values (27205,'Frank')
insert into dbo.HACKERS values (52243,'Patrick')
insert into dbo.HACKERS values (52348,'Lisa')
insert into dbo.HACKERS values (57645,'Kimberly')
insert into dbo.HACKERS values (77726,'Bonnie')
insert into dbo.HACKERS values (83082,'Michael')
insert into dbo.HACKERS values (86870,'Todd')
insert into dbo.HACKERS values (90411,'Joe')


select * from dbo.HACKERS


create table dbo.DIFFICULTY
(
	difficulty_level int identity(1,1),
	score int
)

insert into dbo.DIFFICULTY values (20)
insert into dbo.DIFFICULTY values (30)
insert into dbo.DIFFICULTY values (40)
insert into dbo.DIFFICULTY values (60)
insert into dbo.DIFFICULTY values (80)
insert into dbo.DIFFICULTY values (100)
insert into dbo.DIFFICULTY values (120)



select * from dbo.DIFFICULTY

create table dbo.CHALLENGES
(
	challenge_id int,
	hacker_id int,
	difficulty_level int
)

insert into dbo.CHALLENGES values (4810,77726,4)
insert into dbo.CHALLENGES values (21089,27205,1)
insert into dbo.CHALLENGES values (36566,5580,7)
insert into dbo.CHALLENGES values (66730,52243,6)
insert into dbo.CHALLENGES values (71055,52243,2)



create table dbo.SUBMISSIONS
(
	submission_id int,
	hacker_id int,
	challenge_id int,
	score int
)

insert into dbo.SUBMISSIONS values (68628,77726,36566,30)
insert into dbo.SUBMISSIONS values (65300,77726,21089,10)
insert into dbo.SUBMISSIONS values (40326,52243,36566,77)
insert into dbo.SUBMISSIONS values (8941,27205,4810,4)
insert into dbo.SUBMISSIONS values (83554,77726,66730,30)
insert into dbo.SUBMISSIONS values (43353,52243,66730,0)
insert into dbo.SUBMISSIONS values (55385,52348,71055,20)
insert into dbo.SUBMISSIONS values (39784,27205,71055,23)
insert into dbo.SUBMISSIONS values (94613,86870,71055,30)
insert into dbo.SUBMISSIONS values (45788,52348,36566,0)
insert into dbo.SUBMISSIONS values (93058,86870,36566,30)
insert into dbo.SUBMISSIONS values (7344,8439,66730,92)
insert into dbo.SUBMISSIONS values (2721,8439,4810,36)
insert into dbo.SUBMISSIONS values (523,5580,71055,4)
insert into dbo.SUBMISSIONS values (49105,52348,66730,0)
insert into dbo.SUBMISSIONS values (55877,57645,66730,80)
insert into dbo.SUBMISSIONS values (38355,27205,66730,35)
insert into dbo.SUBMISSIONS values (3924,8439,36566,80)
insert into dbo.SUBMISSIONS values (97397,90411,66730,100)
insert into dbo.SUBMISSIONS values (84162,83082,4810,40)
insert into dbo.SUBMISSIONS values (97431,90411,71055,30)






select s.challenge_id,s.hacker_id,min(s.score),d.score from Submissions s
    inner join Challenges c on c.challenge_id = s.challenge_id
    inner join Difficulty d on d.difficulty_level = c.difficulty_level
    where s.score = d.score
    group by s.challenge_id,s.hacker_id,d.score


/*
select s.challenge_id,s.hacker_id,s.score,d.score from Submissions s
	inner join Challenges c on c.challenge_id = s.challenge_id
	inner join Difficulty d on d.difficulty_level = c.difficulty_level
	 where s.score = d.score

*/


go

--	inner join Hackers h on h.hacker_id = s.hacker_id

with cte_tbl(s_id,d_score)
as
(
select s.hacker_id,count(d.score) as cnt from Submissions s
	inner join Challenges c on c.challenge_id = s.challenge_id
	inner join Difficulty d on d.difficulty_level = c.difficulty_level
	 where s.score = d.score
	 group by s.hacker_id 
)	 
select ct.s_id, h.name from cte_tbl ct
	inner join Hackers h on h.hacker_id = ct.s_id
where ct.d_score > 1 
order by ct.d_score desc ,ct.s_id


<<<<<<< HEAD
=======
/*
?뺣떟由ъ뒪??
27232 Phillip 
28614 Willie 
15719 Christina 
43892 Roy 
14246 David 
14372 Michelle 
18330 Lawrence 
26133 Jacqueline 
26253 John 
30128 Brandon 
35583 Norma 
13944 Victor 
17295 Elizabeth 
19076 Matthew 
26895 Evelyn 
32172 Jonathan 
41293 Robin 
45386 Christina 
45785 Jesse 
49652 Christine 
13391 Robin 
14366 Donna 
14777 Gerald 
16259 Brandon 
17762 Joseph 
28275 Debra 
36228 Nancy 
37704 Keith 
40226 Anna 
49307 Brian 
12539 Paul 
14363 Joyce 
14658 Stephanie 
19448 Jesse 
20504 John 
20534 Martha 
22196 Anthony 
23678 Kimberly 
28299 David 
30721 Ann 
32254 Dorothy 
46205 Joyce 
47641 Patricia 
13122 James 
13762 Gloria 
14863 Walter 
18690 Marilyn 
18983 Lori 
21212 Timothy 
25732 Antonio 
28250 Evelyn 
30755 Emily 
38852 Benjamin 
42052 Andrew 
44188 Diana 
48984 Gregory 
13380 Kelly 
13523 Ralph 
21463 Christine 
24663 Louise 
26243 Diana 
26289 Dorothy 
39277 Charles 
23278 Paula 
25184 Martin 
32121 Dorothy 
36322 Andrew 
39782 Tammy 
40257 James 
41319 Jean 
10857 Kevin 
25238 Paul 
34242 Marilyn 
39771 Alan 
49789 Lillian 
57947 Justin 
74413 Harry
>>>>>>> 04a745c8959dd38c13f1459e3c037b8918246746

SELECT COUNT(*) FROM dbo.APPLEBUYTBL WITH(NOLOCK)
--APPLEBUYTBL
--APPLEINC
--QOO10USER

SELECT * FROM dbo.QOO10USER WITH(NOLOCK) 


CREATE TABLE dbo.BANKBOOK
(
	uname nvarchar(10),
	umoney int
)

ALTER TABLE dbo.BANKBOOK ADD CONSTRAINT CK__BANKBOOK__UMONEY CHECK(umoney >= 0)

INSERT INTO dbo.BANKBOOK VALUES (N'구매자',1000);
INSERT INTO dbo.BANKBOOK VALUES (N'판매자',0);


UPDATE dbo.BANKBOOK SET umoney = umoney - 500 WHERE uname = N'구매자'
UPDATE dbo.BANKBOOK SET umoney = umoney + 500 WHERE uname = N'판매자'


UPDATE dbo.BANKBOOK SET umoney = umoney - 600 WHERE uname = N'구매자'
UPDATE dbo.BANKBOOK SET umoney = 500 WHERE uname = N'판매자'


BEGIN TRAN 
	UPDATE dbo.BANKBOOK SET umoney = umoney - 600 WHERE uname = N'구매자'
	UPDATE dbo.BANKBOOK SET umoney = umoney + 600 WHERE uname = N'판매자'
COMMIT TRAN


SELECT * FROM dbo.BANKBOOK WITH(NOLOCK)


BEGIN TRY
	BEGIN TRAN
		UPDATE dbo.BANKBOOK SET umoney = umoney - 600 WHERE uname = N'구매자'
		UPDATE dbo.BANKBOOK SET umoney = umoney + 600 WHERE uname = N'판매자'
	COMMIT TRAN
END TRY
BEGIN CATCH
	ROLLBACK TRAN
END CATCH



UPDATE dbo.BANKBOOK SET umoney = umoney - 600 WHERE uname = N'구매자'
UPDATE dbo.BANKBOOK SET umoney = umoney + 600 WHERE uname = N'판매자'

UPDATE dbo.BANKBOOK SET umoney = umoney - 600 WHERE uname = N'구매자'
PRINT(@@ERROR)


if (@@ERROR > 1)
BEGIN
	ROLLBACK TRAN
END


CREATE TABLE dbo.TEST1 (num int)
CREATE TABLE dbo.TEST2 (num int)

INSERT INTO dbo.TEST1 VALUES (1)
INSERT INTO dbo.TEST2 VALUES (2)

SAVE TRAN [tranPoint1]
BEGIN TRAN
	UPDATE dbo.TEST1 SET num = 111;
	SAVE TRAN [tranPoint2]
	BEGIN TRAN 
		UPDATE dbo.TEST2 SET num = 222
		SELECT * FROM dbo.TEST1;
		SELECT * FROM dbo.TEST2;
	ROLLBACK TRAN [tranPoint2]
	SELECT * FROM dbo.TEST1;
	SELECT * FROM dbo.TEST2;
ROLLBACK TRAN [tranPoint1]

SELECT * FROM dbo.TEST1;
SELECT * FROM dbo.TEST2;



BEGIN TRAN
	UPDATE dbo.TEST1 SET num = 111;
ROLLBACK TRAN

DROP TABLE dbo.TEST4


CREATE TABLE dbo.TEST4 (num int)


insert into dbo.TEST4 values (3)

SELECT * FROM dbo.TEST4 WITH(NOLOCK)
