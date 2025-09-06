select

    o.order_id,
    o.customer_id,
    l.location_name,
    c.customer_name,
    o.order_total,
    o.order_cost,
    o.ordered_at,
    case when is_food_order = true then 'food' else 'beverage' end as product_type

from {{ ref('fct_orders') }} as o

left join {{ ref('dim_locations') }} as l on o.location_id = l.location_id

left join {{ ref('dim_customers') }} as c on o.customer_id = c.customer_id
