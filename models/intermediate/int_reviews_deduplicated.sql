
with reviews as (
    select * from {{ ref('stg_order_reviews') }}
)

select *
from reviews
qualify row_number() over (
    partition by order_id
    order by review_creation_date desc
) = 1