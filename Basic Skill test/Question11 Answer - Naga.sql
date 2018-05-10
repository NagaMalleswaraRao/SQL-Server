select * from Employee
where DATEDIFF(M,Joindate,'2017-08-01')<10 


--select cast(getdate() as date), MONTH(cast(getdate() as date))
