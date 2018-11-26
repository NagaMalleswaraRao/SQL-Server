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

-- Primitive method                      
select Top 1 * from
[NagaDB].[dbo].[Item_Price]
where [Selling_Price]< (select max([Selling_Price]) from
					[NagaDB].[dbo].[Item_Price])
order by Selling_Price desc

--Using Offset and Fetch Next                     
select Item, [Selling_Price] 
from [NagaDB].[dbo].[Item_Price]
order by  Selling_Price desc, Item desc
offset 1 rows
fetch next 1 rows only
                     
                     
