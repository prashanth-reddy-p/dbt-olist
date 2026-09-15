with orders as (
    select * from {{ref('stg_orders')}}
),
 customers as (
    select customer_id, customer_unique_id from {{ref('stg_customers')}}
),
payments as (
    select * from {{ref('int_payments_aggregated_orders')}}
),
items_agg as (
    select order_id,
    sum(price)        as total_price,
    sum(freight_value) as total_freight,
    sum(item_total)   as order_total,
    count(*)          as item_count,
    count(distinct product_id) as distinct_products,
    count(distinct seller_id)  as distinct_sellers
from {{ref('fct_order_items')}}
group by 1
),
reviews as (
    select order_id, review_score, review_creation_date
    from {{ ref('int_reviews_deduplicated') }}
),
final as (
    select o.order_id,
    c.customer_unique_id,
    i.distinct_sellers,
    o.order_status,
    o.order_purchase_timestamp,
    i.total_price,
    i.total_freight,
    coalesce(i.item_count, 0)  as item_count,
    coalesce(i.order_total, 0) as order_total,
    p.total_payment_value,
    p.payment_count,
    r.review_score,
    r.review_creation_date,
    from orders o
    left join customers c  on o.customer_id = c.customer_id
    left join items_agg i  on o.order_id = i.order_id
    left join payments p   on o.order_id = p.order_id
    left join reviews r on o.order_id = r.order_id)

select * from final

