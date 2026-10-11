select

    count(*) as total_customers,

    sum(lifetime_value) as total_lifetime_value,

    avg(lifetime_value) as avg_lifetime_value,

    max(lifetime_value) as max_lifetime_value,

    min(lifetime_value) as min_lifetime_value,

    sum(
        case
            when status = 'Active' then 1
            else 0
        end
    ) as active_customers,

    sum(
        case
            when status = 'Inactive' then 1
            else 0
        end
    ) as inactive_customers,

    round(
        (
            sum(case when status = 'Active' then 1 else 0 end) * 100.0
        ) / count(*),
        2
    ) as active_customer_pct,

    round(
        (
            sum(case when is_email_valid = true then 1 else 0 end) * 100.0
        ) / count(*),
        2
    ) as valid_email_pct,

    count(distinct customer_segment) as total_segments

from {{ ref('customer_360') }}