with

    source as (select * from {{ source('ecom', 'products') }}),

    renamed as (

        select

            -- --------  ids
            sku as product_id,

            -- -------- text
            case
                lower(trim(name))
                when 'adele-ade'
                then 'Lemonade'
                when 'chai and mighty'
                then 'Chai Latte'
                when 'tangaroo'
                then 'Orange Juice'
                when 'vanilla ice'
                then 'Vanilla Iced Coffee'
                when 'for richer or pourover'
                then 'Pour-over Coffee'
                when 'nutellaphone who dis?'
                then 'Nutella Jaffle'
                when 'doctor stew'
                then 'Beef Stew Jaffle'
                when 'the krautback'
                then 'Reuben Jaffle'
                when 'mel-bun'
                then 'Ham & Cheese Jaffle'
                when 'flame impala'
                then 'Spicy Beef Jaffle'
                else name
            end as product_name,
            type as product_type,
            description as product_description,

            -- -------- numerics
            {{ cents_to_dollars('price') }} as product_price,

            -- -------- booleans
            coalesce(type = 'jaffle', false) as is_food_item,

            coalesce(type = 'beverage', false) as is_drink_item

        from source

    )

select *
from renamed
