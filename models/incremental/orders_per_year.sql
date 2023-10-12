{{
    config(
        materialized='incremental',
        unique_key='order_year',
        enabled=false
    )
}}

with base as (
    select
        EXTRACT(year from order_date) as order_year,
        COUNT(*) as order_count
    from
        {{ ref('raw_orders_copy') }} -- Use the name of your source table
    where
        -- For incremental logic: only select records that are new or updated since the last run
        {% if is_incremental() %}
            EXTRACT(year from order_date) > (select MAX(order_year) from {{ this }})
        {% else %}
            TRUE
        {% endif %}
    group by
        EXTRACT(year from order_date)
)

select
    order_year,
    SUM(order_count) as total_orders
from
    base
group by
    order_year
