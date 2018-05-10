--If all the Scores are distinct 
with Scores as 
(select ROW_NUMBER() over(order by Score desc) as 'row',* 
 from [NagaDB].[dbo].[Employee])

select * from Scores
where row=3

--If some Scores repeat
with Scores as 
(select Dense_rank() over(order by Score desc) as 'row',* 
 from [NagaDB].[dbo].[Employee])

select * from Scores
where row=3
