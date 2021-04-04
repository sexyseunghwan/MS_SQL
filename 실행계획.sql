set arithabort off 
set STATISTICS IO on
set STATISTICS TIME on
           
		  

		   select * from dbo.QOOUSERXML with(nolock) where user_data.exist('/row[@qoouser_id="onfyu878596"]') = 1

		  

set STATISTICS IO off
set STATISTICS TIME off




--CREATE PRIMARY XML INDEX IDX__QOOUSERXML__USER_DATA ON dbo.QOOUSERXML (user_data)