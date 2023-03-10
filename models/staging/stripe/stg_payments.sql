with 
payments as (
    select * from {{ source('stripe', 'payment') }}
    ), 
payments_amounts as (
    select
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status,
        -- amount is stored in cents, convert it to dollars
        amount / 100 as amount,
        created as created_at
    from payments 
    ),
final as (
    select * from payments_amounts
    )
select * 
from final 