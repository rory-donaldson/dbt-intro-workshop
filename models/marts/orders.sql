{{ config(
    materialized='incremental',
    unique_key='order_id'
)}}

select
    o.order_date,
    o.order_id,
    c.customer_id,
    c.first_name,
    c.last_name,
    p.amount
from {{ ref('stg_orders') }} o
left join {{ ref('stg_customers') }} c
    on o.customer_id = c.customer_id
left join {{ ref('stg_payments') }} p
    on p.order_id = o.order_id

{% if is_incremental() %}

where o.loaded_at > current_date()

{% endif %}