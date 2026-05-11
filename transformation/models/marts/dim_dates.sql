-- DIMENSION TABLE
-- Grain: one row per date
-- Purpose: provides a reusable calendar dimension for time-based analysis
-- Note: included as a standard analytics pattern, not required for core logic

{{ config(
    materialized='table',
    tags=['dimension', 'date']
) }}

select
    date_day as date_key,
    year,
    month,
    day_of_month,
    day_of_week
from {{ dbt_date.get_date_dimension(
    start_date='2015-01-01',
    end_date='2025-12-31'
) }}
