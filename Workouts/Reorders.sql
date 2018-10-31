'Data:
'CustID	      OrderDate
 'A	      2018-04-01
 'A	      2018-04-28
 'A	      2018-04-15
 'B	      2018-04-02
 'B    	      2018-05-15
 'C	      2018-04-15
 'C           2018-04-17
 
 'Get the number of Reorders during Apr 1st and 30 days after
 
 Select distinct CustID, max(repeat_no)-1 as Reorders
 from
	(SELECT CustID,
		RANK() over(partition by CustID
		Order by  OrderDate) as repeat_no
		FROM [TestDB].[dbo].[Orders]
		where OrderDate between '2018-04-01' and dateadd(dd,30,'2018-04-01')) as A
  where A.repeat_no>1
  group by CustID
