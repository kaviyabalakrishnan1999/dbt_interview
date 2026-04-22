{{ config(
    materialized='table',
    tags=['fact', 'opportunity', 'salesforce']
) }}

select
    {{ dbt_utils.generate_surrogate_key(['o.opportunity_id']) }} as opportunity_key,
    o.opportunity_id,
    a.account_key,
    o.amount,
    o.stage_name,
    o.is_closed,
    o.close_date,
    o.created_date
from {{ ref('int_opportunities') }} o
left join {{ ref('dim_accounts') }} a
  on o.account_id = a.account_id;
