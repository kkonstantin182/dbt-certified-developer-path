with
    locations as (select * from {{ ref('stg_locations') }}),

    orders as (
        select

            location_id,
            count(distinct order_id) as count_orders,
            sum(count_order_items) as count_order_items,
            sum(order_total - order_cost) as revenue,
            min(ordered_at) as first_ordered_at,
            max(ordered_at) as last_ordered_at

        from {{ ref('fct_orders') }}
        group by location_id
    ),

    joined as (

        select
            locations.*,
            orders.count_orders,
            orders.count_order_items,
            orders.first_ordered_at,
            orders.last_ordered_at,
            orders.revenue
        from locations
        left join orders on locations.location_id = orders.location_id
    )

select *
from joined
