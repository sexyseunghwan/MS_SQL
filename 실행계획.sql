set arithabort off 
set STATISTICS IO on
set STATISTICS TIME on
           
		   

		 --  	SELECT * from dbo.QOO10USER qu with(nolock) 
			--inner MERGE join dbo.APPLEBUYTBL ab with(nolock) on qu.usercode = ab.userseq 
			--where qu.id = 'udlbo861332'

			--SELECT * FROM dbo.APPLEBUYTBL ab with(nolock) 
			--LEFT OUTER LOOP JOIN dbo.QOO10USER qu with(nolock) on qu.usercode = ab.userseq
			--where qu.id = 'udlbo861332'

			--CREATE INDEX IDX__APPLEBUYTBL__USERSEQ ON dbo.APPLEBUYTBL (userseq)


				--select qu.id,qu.pw,qu.email from dbo.QOO10USER qu with(nolock) 
				--inner join dbo.APPLEBUYTBL ab with(nolock) on qu.usercode = ab.userseq 
				--inner join dbo.APPLEINC ac with(nolock) on ac.prodserial = ab.prodserial 
				--where qu.nation = 'KR'
				--and qu.gender = 'F'  
				--and ac.prodname = 'ipad mini 3th' 

				--dbo.APPLEBUYTBL ab with(nolock)

				-- dbo.APPLEBUYTBL ab
				--dbo.APPLEINC ac

				--select qu.id,qu.pw,qu.email from dbo.APPLEINC ac with(nolock) 
				--inner join dbo.APPLEBUYTBL ab with(nolock) on ac.prodserial = ab.prodserial 
				--left join dbo.QOO10USER qu with(nolock) on qu.usercode = ab.userseq 
				--where qu.nation = 'KR'
				--and qu.gender = 'F'  
				--and ac.prodname = 'ipad mini 3th'



set STATISTICS IO off
set STATISTICS TIME off