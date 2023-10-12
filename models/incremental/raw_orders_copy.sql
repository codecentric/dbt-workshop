{{
    config(
        materialized="table",
        enabled=false,
        append_data=false
    )
}}

with base as (
    select *
    from {{ source('raw','raw_orders') }}
),

max_id as (  -- noqa: L045 , false positive
    select max(id) as max_existing_id
    from base
)

-- Select original records
select
    id,
    user_id,
    order_date,
    status
from
    base

{% if config.get('append_data', default=false) %}
UNION ALL

-- Select records with updated ID and date if append_data is true
SELECT
    id + max_existing_id as id,
    user_id,
    date_add(order_date, INTERVAL 1 YEAR) as order_date,
    status
FROM
    base
CROSS JOIN
    max_id
{% endif %}
