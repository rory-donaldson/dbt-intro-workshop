with raw_payments as (
    select * from {{ source('jaffleshop', 'payments') }}
),

transformed_payments as (
    select
        id as payment_id,
        orderid as order_id,
        paymentmethod,
        status,
        amount,
        {{convert_currency('amount', 'GBP', 'EUR')}} as amount_eur,
        {{convert_currency('amount', 'GBP', 'USD')}} as amount_usd,
        created
    from
          raw_payments
)

select * from transformed_payments