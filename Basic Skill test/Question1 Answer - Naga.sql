select E.EmpId, E.EmpName, E.Gender, 
case when E.DeptId is null then 'Not Assigned' else D.DeptName end as DeptName, 
E.Score, E.JoinDate
from [NagaDB].[dbo].[Employee] E
left join [NagaDB].[dbo].[Department] D
on E.DeptId=D.DeptId
