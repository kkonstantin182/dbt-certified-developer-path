with
    products as (select * from {{ ref('stg_products') }}),

    products_orders as (

        select oi.product_id, count(distinct oi.order_id) as count_orders

        from {{ ref('stg_order_items') }} as oi
        inner join {{ ref('fct_orders') }} as o on oi.order_id = o.order_id
        group by oi.product_id

    ),

    joined as (

        select
            products.product_id,
            products.product_name,
            products.product_type,
            products.product_price,
            products_orders.count_orders

        from products
        left join products_orders on products.product_id = products_orders.product_id
    )

select *
from joined
