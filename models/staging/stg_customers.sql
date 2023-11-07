with raw_customer as (
    select * from {{ source('jaffleshop', 'customers') }}
),
transformed_customer as (
    select
        id as customer_id,
        first_name,
        last_name
    from
        raw_customer
)
select * from transformed_customer