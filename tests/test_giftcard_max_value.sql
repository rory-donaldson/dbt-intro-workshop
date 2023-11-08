-- test no gift cards payment are above max of 5000
{{config(
    severity='warn'
)}}

select
    payment_id
from {{ ref('stg_payments')}} 
where paymentmethod = 'gift_card' 
    and amount > 5000 
    and status = 'success'

