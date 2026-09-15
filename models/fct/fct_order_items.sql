with order_items as (
    select * from {{ ref('stg_order_items') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['order_id', 'order_item_id']) }} as order_item_key,
    order_id,
    order_item_id,
    product_id,
    seller_id,
    shipping_limit_date,
    price,
    freight_value,
    price + freight_value as item_total
from order_items