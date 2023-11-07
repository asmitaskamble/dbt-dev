{{
    config(
        unique_key='lga_code'
    )
}}

with

source  as (

    select * from {{ ref('nsw_code') }}

),

renamed as (
    select
        lga_code as lga_code,
        lga_name as lga_name
    from source
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