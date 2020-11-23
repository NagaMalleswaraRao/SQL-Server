WITH Plant_map (Plant_CD, WHSE, EDW2_WHSE, WHSE_Name) as
(
Select 'MX01', 'FWH', 'FDC', 'Juarez' UNION
Select 'US01', 'RDC', 'RDC', 'Algona' UNION
Select 'US11', 'RDC', 'RDC', 'Dallas' UNION
Select 'US21', 'RDC', 'RDC', 'Denver' 
)

Select * from Plant_map

------------------------------------------------

With dataz (id,[subject],[from],[to],[timestamp]) as
(
select '1', 'Yosemite','zach@g.com','thomas@g.com', cast('2018-01-02 12:45:03' as datetime) Union
select '2', 'Big Sur','sarah@g.com','thomas@g.com', cast('2018-01-02 16:30:01' as datetime) Union
select '3', 'Yosemite','thomas@g.com','zach@g.com', cast('2018-01-02 16:35:04' as datetime) Union
select '4', 'Running','jill@g.com','zach@g.com', cast('2018-01-03 08:12:45' as datetime) Union
select '5', 'Yosemite','zach@g.com','thomas@g.com', cast('2018-01-03 14:02:01' as datetime) Union
select '6', 'Yosemite','thomas@g.com','zach@g.com', cast('2018-01-03 15:01:05' as datetime) 
)

Select * from dataz
