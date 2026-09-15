with order_items as (
select * from {{source('olist','order_items')}}
)
select order_id,
order_item_id,
product_id,
seller_id,
shipping_limit_date :: timestamp_ntz as shipping_limit_date,
price :: number(8,2) as price,
freight_value :: number(8,2) as freight_value
from order_items