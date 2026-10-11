select
    customer_id,
    lifetime_value,
    is_email_valid
from {{ source('gold', 'fact_customer_metrics') }}