with orders as (
select * from {{source('olist','orders')}}
)
select 
order_id,
customer_id,
order_status,
order_purchase_timestamp :: timestamp_ntz as order_purchase_timestamp,
order_approved_at :: timestamp_ntz as order_approved_at,
order_delivered_carrier_date :: timestamp_ntz as order_delivered_carrier_date,
order_delivered_customer_date :: timestamp_ntz as order_delivered_customer_date,
order_estimated_delivery_date :: timestamp_ntz as order_estimated_delivery_date
from orders