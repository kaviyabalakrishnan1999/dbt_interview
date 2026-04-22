{{ config(
    materialized='table',
    tags=['dimension', 'account', 'salesforce']
) }}

select
    {{ dbt_utils.generate_surrogate_key(['account_id']) }} as account_key,
    account_id,
    name,
    industry,
    billing_country,
    created_date
from {{ ref('stg_salesforce__account') }};
