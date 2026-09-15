with products as
(select * from {{ref('stg_products')}}),
product_translation as (
    select * from {{ref('stg_product_category_name_translation')}}
),
joined as (
    select products.*, coalesce(product_translation.product_category_english, 'unknown') as product_category
    from products
    left join product_translation
    on products.product_category_name=product_translation.product_category_name
)

select product_id, product_category, PRODUCT_NAME_LENGTH, product_description_length,PRODUCT_PHOTOS_QTY,PRODUCT_WEIGHT_G, PRODUCT_LENGTH_CM,
PRODUCT_HEIGHT_CM,PRODUCT_WIDTH_CM
from joined
