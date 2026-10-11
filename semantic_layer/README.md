# semantic_layer

dbt project (Databricks) that exposes customer metrics through the dbt Semantic Layer.

## Lineage

`sample_ci_cd.gold.dim_customers` / `fact_customer_metrics`
→ `stg_customers` / `stg_customer_metrics` (views)
→ `customer_360` (one row per customer)
→ `customer_kpis`, `customer_semantic_check`, and the `customer` semantic model

`time_spine` is the daily spine MetricFlow needs for time-based queries.

## Metrics

`total_customers`, `active_customers`, `inactive_customers`, `valid_email_customers`,
`total_lifetime_value`, `avg_lifetime_value`, `max_lifetime_value`, `min_lifetime_value`,
`active_customer_pct`, `valid_email_pct` (ratios are 0-1 fractions).

Dimensions: `signup_date` (time), `customer_segment`, `status`, `city`, `state`, `country`, `is_email_valid`.

## Running

Run commands from this `semantic_layer/` directory with a `semantic_layer` profile in `~/.dbt/profiles.yml`:

```
dbt build                                   # models + tests
mf query --metrics total_customers --group-by customer__status
```
