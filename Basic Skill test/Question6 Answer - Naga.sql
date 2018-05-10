select EmpId,year([JoinDate]) as JoiningYear 
from Employee
where year([JoinDate])>=2016