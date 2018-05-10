
Update Employee
set Gender = case when Gender='M' then 'F'
				  when Gender='F' then 'M'
				  End

select * from Employee

Update Employee
set Gender = case when Gender='F' then 'M'
				  when Gender='M' then 'F'
				  End

select * from Employee
