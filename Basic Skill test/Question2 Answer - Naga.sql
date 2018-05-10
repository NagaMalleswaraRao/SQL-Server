select DeptId, AVG(Score) as AvgScore
from [NagaDB].[dbo].[Employee] E
group by DeptId
having AVG(Score)>75
