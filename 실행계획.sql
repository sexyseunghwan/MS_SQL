set arithabort off 
set STATISTICS IO on
set STATISTICS TIME on
           
		   --declare @num int = 0
		   --exec dbo.qoo10_total_login '123.123.123','asd','1231wsfd',@num output
		   
		   declare @num int = 0
		   exec dbo.qoo10_total_login '123.123.123','tzvjh073520','Dr^/@7KOm]pM',@num output



set STATISTICS IO off
set STATISTICS TIME off

--dbo.QOO10USERENC 

--create index IDX__QOO10USERENC__ID__PW_ENCRYPTION ON dbo.QOO10USERENC (id,pw_encryption)

--dbo.QOO10_USER_REAL 

--create index IDX__QOO10_USER_REAL__QOOUSER_ID__QOOUSER_PW ON dbo.QOO10_USER_REAL (qoouser_id,qoouser_pw)