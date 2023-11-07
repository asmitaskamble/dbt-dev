{{
    config(
        unique_key='listing_id'
    )
}}

with

source  as (

    select * from {{ ref('hosts_snapshot') }}

),

renamed as (
    select
        listing_id as listing_id,
        scraped_date as scraped_date,
        host_id as host_id,
        case when host_name = 'NaN' then 0 else host_name end as host_name,
        case when host_since = 'NaN' then 0 else host_since end as host_since,
        case when host_neighbourhood = 'NaN' then 0 else host_neighbourhood end as host_neighbourhood,
        case when host_is_superhost = 'NaN' then 0 else host_is_superhost end as host_is_superhost,
        case when accommodates = 'NaN' then 0 else accommodates end as accommodates,
        case when listing_neighbourhood = 'NaN' then 0 else listing_neighbourhood end as accommodates,
        case when availability_30 = 'NaN' then 0 else availability_30 end as accommodates
        
    from source
)


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