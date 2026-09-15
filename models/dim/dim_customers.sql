with customers as (
    select * from {{ref('int_customers_deduplicated')}}
)
select customer_unique_id,
    customer_city,
        customer_state,
        customer_zip_code_prefix,
        order_purchase_timestamp as purchased_at
from customers