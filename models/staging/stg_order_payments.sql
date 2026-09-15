with order_payments as (
select * from {{source('olist','order_payments')}}
)
select order_id,
payment_sequential :: integer as payment_sequential,
payment_type,
payment_installments :: integer as payment_installments,
payment_value :: number(8,2) as payment_value
from order_payments