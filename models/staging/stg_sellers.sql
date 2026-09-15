with sellers as (
select * from {{source('olist','sellers')}}
)
select seller_id,
seller_zipcode_prefix,
seller_city,
seller_state
from sellers