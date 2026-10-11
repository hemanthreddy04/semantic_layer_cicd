select
    customer_segment,
    status,
    count(*) as total_customers,
    sum(lifetime_value) as total_lifetime_value,
    avg(lifetime_value) as avg_lifetime_value
from {{ ref('customer_360') }}
group by
    customer_segment,
    status