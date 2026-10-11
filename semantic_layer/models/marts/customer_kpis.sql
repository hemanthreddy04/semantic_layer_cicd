select

    count(distinct customer_id) as total_customers,

    sum(lifetime_value) as total_lifetime_value,

    avg(lifetime_value) as avg_lifetime_value,

    max(lifetime_value) as max_lifetime_value,

    min(lifetime_value) as min_lifetime_value,

    count(distinct case when status = 'Active' then customer_id end) as active_customers,

    count(distinct case when status = 'Inactive' then customer_id end) as inactive_customers,

    -- nullif avoids a divide-by-zero error under ANSI mode when there are no customers
    round(
        count(distinct case when status = 'Active' then customer_id end) * 100.0
        / nullif(count(distinct customer_id), 0),
        2
    ) as active_customer_pct,

    round(
        count(distinct case when is_email_valid = true then customer_id end) * 100.0
        / nullif(count(distinct customer_id), 0),
        2
    ) as valid_email_pct,

    count(distinct customer_segment) as total_segments

from {{ ref('customer_360') }}
