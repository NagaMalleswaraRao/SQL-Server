-- create backup of original table containing duplicates
create table edw.bkp_dup_sales_20221205
as
(
select * from edw.sales
);

-- create deduped table based on original table without duplicates
create table edw.sales_dedup
as
(
select distinct * from edw.sales
);

truncate edw.sales;

-- insert deduped rows into truncated original table
insert into edw.sales
(
select * from edw.sales_dedup
);

-- create backup of deduped original table
create table edw.bkp_sales_20221205
as
(
select * from edw.sales
);

-- leaving a backup of deduped original table, drop the other tables
drop table edw.sales_dedup;
drop table edw.bkp_dup_sales_20221205;
