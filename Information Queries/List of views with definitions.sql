# This query returns list of database views with their definition SQL and a comment.
# Resource: https://dataedo.com/blog/useful-sql-server-data-dictionary-queries-every-dba-should-have#toc_1
# https://dataedo.com/asset/img/blog/sql_server_data_dictionary_views_query_results.png

select schema_name(v.schema_id) as schema_name,
       v.name as view_name,
       v.create_date as created,
       v.modify_date as last_modified,
       m.definition,
       ep.value as comments
  from sys.views v
       left join sys.extended_properties ep 
           on v.object_id = ep.major_id
          and ep.name = 'MS_Description'
          and ep.minor_id = 0
          and ep.class_desc = 'OBJECT_OR_COLUMN'
       inner join sys.sql_modules m 
           on m.object_id = v.object_id
 order by schema_name,
          view_name
