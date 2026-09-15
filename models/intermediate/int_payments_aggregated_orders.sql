with payments as (
    select * from {{ref('stg_order_payments')}}
)
select order_id, sum(payment_value) as total_payment_value, count(*) as payment_count
from payments
group by 1