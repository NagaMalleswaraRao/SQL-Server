WITH Plant_map (Plant_CD, WHSE, EDW2_WHSE, WHSE_Name) as
(
Select 'MX01', 'FWH', 'FDC', 'Juarez' UNION
Select 'US01', 'RDC', 'RDC', 'Algona' UNION
Select 'US11', 'RDC', 'RDC', 'Dallas' UNION
Select 'US21', 'RDC', 'RDC', 'Denver' 
)

Select * from Plant_map
