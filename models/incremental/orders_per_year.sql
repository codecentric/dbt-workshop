{{
    config(
        materialized='incremental',
        unique_key='order_year',
        enabled=false
    )
}}

with base as (
    select
        date_part('year', order_date::date) as order_year,
        COUNT(*) as order_count
    from
        {{ ref('stg_orders_incr') }} -- Use the name of your source table
    where
        -- For incremental logic: only select records that are new or updated since the last run
        {% if is_incremental() %}
            date_part('year', order_date::date) > (select MAX(order_year) from {{ this }})
        {% else %}
            TRUE
        {% endif %}
    group by
        date_part('year', order_date::date)
)

select
    order_year,
    SUM(order_count) as total_orders
from
    base
group by
    order_year
