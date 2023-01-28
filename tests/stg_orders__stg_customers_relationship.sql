with customers as (
        select * from {{ ref('stg_customers') }}
), 
orders as (
        select * from {{ ref('stg_orders') }}
)
select * 
    from orders 
        left join customers on orders.customer_id = customers.customer_id 
        where customers.customer_id is null 
