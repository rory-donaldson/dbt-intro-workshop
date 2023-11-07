with raw_orders as (
    select * from  {{ source('jaffleshop', 'orders') }}
),

transformed_orders as (
    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status,
        _ETL_LOADED_AT as loaded_at
    from
        raw_orders
)

select * from transformed_orders