--Returns 6 records out of 11
select * from [Employee] E
where E.DeptId <> 40

--Returns 9 records out of 11
select * from [Employee] E
where E.DeptId is not null

--Returns 2 records out of 11
select * from [Employee] E
where E.DeptId is null