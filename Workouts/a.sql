--The table has 3 columns: Zip Code, State, Population
--There is no PK as such, so ZipCodes will repeat. The records:
--ZipCode	State	Population
--A1	A	100
--A2	A	200
--A3	A	200
--B1	B	250
--B2	B	250
--A1	A	300
--A2	A	200
--B1	B	1000

-- Find the proportion of people in Zip code w.r.t State
Select Z.*, cast(Zip_Pop*100.0/State_Pop as Decimal(4,2)) as Proportion
from (SELECT distinct [ZipCode] ,[State]
	    ,sum([Population]) over(partition by [ZipCode]) as Zip_Pop
      ,sum([Population]) over(partition by [State]) as State_Pop	  
	    FROM [NagaDB].[dbo].[Zip_Population]) Z
