--Data
--EmpId	EmpName	Gender	DeptId	Score	JoinDate
--1	Aditya	M         	10        	80	2014-08-10
--2	John	M         	20        	78	 2014-11-11
--3	Ramya	F         	30        	95	 2015-01-25
--4	Keerti	F         	40        	89	2015-04-17
--5	Madhu	M         	NULL	       83	 2017-03-31
--6	Sohan	M         	40        	 67	 2015-10-12
--7	Shobha	F         	20        	76	2016-02-08
--8	Laksman	M         	10        	92	2016-03-15
--9	Joseph	M         	20        	92	2016-12-18
--10  Rehman M         	NULL	      89	 2017-01-10
--11  Hut	NULL	        40        	78	 NULL

--DeptId	DeptName
--10       	HR
--20       	Engineering
--30       	Finance
--40       	Operations
--50       	Administration

select E.EmpId, E.EmpName, E.Gender, 
case when E.DeptId is null then 'Not Assigned' else D.DeptName end as DeptName, 
E.Score, E.JoinDate
from [NagaDB].[dbo].[Employee] E
left join [NagaDB].[dbo].[Department] D
on E.DeptId=D.DeptId
