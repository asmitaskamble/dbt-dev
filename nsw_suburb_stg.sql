{{
    config(
        unique_key='nsw-suburb'
    )
}}

with

source  as (

    select * from {{ ref('nsw_suburb') }}

),

renamed as (
    select
        lga_name as lga_name,
        suburb_name as suburb_name
),

-- unknown as (
--     select 
--         0 as brand_id,
--         'unknown' as brand_description,
--         '1900-01-01'::timestamp  as dbt_valid_from,
--         null::timestamp as dbt_valid_to

-- )
-- select * from unknown
-- union all 
select * from renamed