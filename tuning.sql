set arithabort off 
set STATISTICS IO on
set STATISTICS TIME on
	
	--exec dbo.sh_test_tuning 777,'airpod 1th','2016-08-07','2018-08-07'

	--exec dbo.sh_test_tuning_basic 777,'airpod 1th','2016-08-07','2018-08-07'


		select  
			qu.id,
			sum(ac.price*ab.quantity) as totalsum
		from dbo.QOO10USER qu with(nolock) 
		inner join dbo.APPLEBUYTBL ab with(nolock) on qu.usercode = ab.userseq 
		inner join dbo.APPLEINC ac with(nolock) on ac.prodserial = ab.prodserial
	where ab.buydate between '2015-01-01' and '2019-01-01'
	group by qu.id
	order by totalsum desc

set STATISTICS IO off
set STATISTICS TIME off