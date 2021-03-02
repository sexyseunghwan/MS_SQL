# MS_SQL 연습


/* 
	Author      : Seunghwan Shin 
	Create date : 2021-02-26  
	Description : 상품 구매 
	     
    History	: 2021-02-26 Seunghwan Shin #최초 생성 
*/ 
create proc [dbo].[sh_test_first]
	@nation char(2),--국가코드
	@gender char(1),--성별
	@number int --상위 몇명 가져올건지 체크
as 
set nocount on 
set transaction isolation level read uncommitted 
begin
		
	select top (@number) qu.id,sum(ac.price) as summ from dbo.QOO10USER qu with(nolock,index=IDX__QOO10USER__NATION__GENDER)
	inner join dbo.APPLEBUYTBL ab with(nolock) on qu.idseq = ab.userseq
	inner join dbo.APPLEINC ac with(nolock) on ac.prodserial = ab.prodserial
	where qu.nation = @nation and qu.gender = @gender
	group by qu.id
	order by summ desc

end 
