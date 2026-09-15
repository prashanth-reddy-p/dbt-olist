with product_category_name_translation as (
select * from {{source('olist','product_category_name_translation')}}
)
select 
product_category_name, 
product_category_english
from product_category_name_translation