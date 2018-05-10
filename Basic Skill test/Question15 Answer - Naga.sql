select [EmpId]
      ,upper([EmpName]) as [EmpName]
      ,[Gender]
      ,[DeptId]
      ,[Score]
      ,[JoinDate]
from Employee
where Datediff(m,JoinDate,getdate())>24
and Gender='M'