select
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.customer_segment,
    c.status,
    m.lifetime_value,
    m.is_email_valid
from {{ ref('stg_customers') }} c
inner join {{ ref('stg_customer_metrics') }} m
    on c.customer_id = m.customer_id