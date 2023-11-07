{{
    config(
        unique_key='listing_id'
    )
}}

with

source  as (

    select * from {{ ref('room_snapshot') }}

),

renamed as (
    select
        listing_id as listing_id,
        scraped_date as scraped_date,
        room_type as room_type,
        price as price,
        case when accommodates = 'NaN' then 0 else accommodates end as accommodates,
        case when availability_30 = 'NaN' then 0 else availability_30 end as accommodates
        number_of_reviews as number_of_reviews,
        review_scores_rating as review_scores_rating
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