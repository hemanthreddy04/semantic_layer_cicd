-- One row per customer. Left join so customers without a metrics row are
-- still counted; their metric columns come through as null.
select
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.phone,
    c.city,
    c.state,
    c.country,
    c.signup_date,
    c.customer_segment,
    c.status,
    m.lifetime_value,
    m.is_email_valid
from {{ ref('stg_customers') }} c
left join {{ ref('stg_customer_metrics') }} m
    on c.customer_id = m.customer_id
