{{
    config(
        unique_key='listing_id'
    )
}}

with

source  as (

    select * from {{ ref('property_snapshot') }}

),

renamed as (
    select
        l.listing_id,
        l.scraped_date,
        property_type as property_type,
        room_type as room_type,
        case when accommodates = 'NaN' then 0 else accommodates end as accommodates,
        case when availability_30 = 'NaN' then 0 else availability_30 end as accommodates
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
-- select * from renamed