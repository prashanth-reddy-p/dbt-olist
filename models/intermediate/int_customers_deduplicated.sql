with customers as
(
    select * from {{ref('stg_customers')}}
),

orders as (
    select customer_id, order_purchase_timestamp from {{ref('stg_orders')}}
),
joined as (
    select 
    c.customer_unique_id,
    c.customer_city,
        c.customer_state,
        c.customer_zip_code_prefix,
        o.order_purchase_timestamp
    from customers c
    join orders o on c.customer_id = o.customer_id
),
latest as (
    select *
    from joined
    qualify row_number() over(partition by customer_unique_id order by order_purchase_timestamp desc) = 1

)

select * from latest
