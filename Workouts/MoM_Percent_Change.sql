With data_cte as
(
Select  
	   left(S.[OrderDateKey],4) as Order_year,
	   substring(cast(([OrderDateKey])as varchar(10)),5,2) as Order_month,	
	   Count(S.[ProductKey]) as Qty
     
From [AdventureWorksDW2017].[dbo].[FactInternetSales] S
    Left join [AdventureWorksDW2017].[dbo].[DimProduct] P
    on S.ProductKey=P.ProductKey

Where left(S.[OrderDateKey],4)='2013'

Group by 
      left(S.[OrderDateKey],4),
      substring(cast(([OrderDateKey])as varchar(10)),5,2)	
)

Select 
    Order_year, Order_month, Qty,
    Lag(Qty,1) over(order by Order_year,Order_month) as Prior_mth_qty,
    (Qty-Lag(Qty,1) over(order by Order_year,Order_month)) as MoM_change,
    cast(((Qty-Lag(Qty,1) over(order by Order_year,Order_month))*100.0/(Lag(Qty,1) over(order by Order_year,Order_month))) as decimal(7,2))as MoM_pct_change,
    (Qty-Lag(Qty,1) over(order by Order_year,Order_month))*100.0/(Lag(Qty,1) over(order by Order_year,Order_month)) as MoM_pct_change2

From data_cte
