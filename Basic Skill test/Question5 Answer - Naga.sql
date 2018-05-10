select EmpId,EmpName 
from Employee
where score in (select max(score) 
			 from Employee
			group by DeptId)