{{ config(
    materialized='table',
    tags=['intermediate', 'salesforce']
) }}

with source as (
    select *
    from {{ ref('stg_salesforce__opportunity') }}
),

renamed as (
    select
        id            as opportunity_id,
        account_id,
        owner_id,
        amount,
        stage_name,
        is_closed,
        close_date,
        created_date
    from source
)

select * from renamed;
