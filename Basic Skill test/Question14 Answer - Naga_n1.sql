
--First method
 select*from Employee where EmpId in (select top 1 EmpId from Employee
	where JoinDate is not null
	order by JoinDate asc)  
	or EmpId in (select top 1 EmpId from Employee
	where JoinDate is not null
	order by JoinDate desc) 

--Second method
;WITH CTE_OUTPUT AS
(SELECT *
	,ROW_NUMBER() OVER (ORDER BY JoinDate ASC) SrAsc
	,ROW_NUMBER() OVER (ORDER BY JoinDate DESC) SrDesc
FROM Employee where joindate is not null)

SELECT * FROM CTE_OUTPUT
WHERE (SrAsc = 1 OR SrDesc = 1) order by EmpId
