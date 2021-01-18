set arithabort off 
set STATISTICS IO on
set STATISTICS TIME on
	
			


			--dbo.QOOUSERTBL
			--dbo.APPLEINC
			--dbo.APPLEBUYTBL
			--DROP INDEX IDX__QOOUSERTBL__TEST ON DBO.QOOUSERTBL
			--DROP INDEX IDX__APPLEINC__TEST ON dbo.APPLEINC
			--DROP INDEX IDX__APPLEBUYTBL__TEST ON dbo.APPLEBUYTBL



			--select userseq,quantity from dbo.APPLEBUYTBL with(nolock) where prodserial >= 1 and prodserial <= 10
			
			--drop index IDX__APPLEBUYTBL__PRODSERIAL on dbo.APPLEBUYTBL
			--create index IDX__APPLEBUYTBL__PRODSERIAL on dbo.APPLEBUYTBL include ()

			--create index IDX__QOOUSERTBL_NATION ON dbo.QOOUSERTBL (nation) INCLUDE (id,email) 

			--select 
			--	q.id,
			--	q.email,
			--	q.nation,
			--	q.ipaddress
			--from dbo.QOOUSERTBL q with(nolock,forceseek)
			--inner join dbo.APPLEBUYTBL a with(nolock,forceseek) on q.idseq = a.userseq
			--where a.prodserial = 1 and q.nation = 'SG'
			
			--create index IDX__QOOUSERTBL__PRODSERIAL ON dbo.APPLEBUYTBL (prodserial,userseq)
			
			--create index IDX__QOOUSERTBL__NATION ON dbo.QOOUSERTBL (nation) include (id,email,ipaddress)
			
			--drop index IDX__QOOUSERTBL__NATION ON dbo.QOOUSERTBL
			--drop index IDX__QOOUSERTBL_NATION on dbo.QOOUSERTBL
			--drop index IDX__QOOUSERTBL__GENDER on dbo.QOOUSERTBL

			--drop index IDX__QOOUSERTBL__PRODSERIAL on dbo.APPLEBUYTBL


			select 
				ac.prodname,
				ac.price,
				a.userseq,
				a.quantity
			from dbo.APPLEINC ac with(nolock)
			inner hash join dbo.APPLEBUYTBL a with(nolock) on a.prodserial = ac.serial
			where ac.serial = 13 and a.buydate >= '2012-12-03' and a.buydate <= '2014-11-03'
			--and 


			--create index IDX__APPLEINC__TEST ON dbo.APPLEBUYTBL (prodserial,buydate,userseq)
			--create index IDX__APPLEINC__TEST2 ON dbo.APPLEBUYTBL (prodserial,buydate,userseq,quantity)

set STATISTICS IO off
set STATISTICS TIME off