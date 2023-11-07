{{
    config(
        unique_key='lga_code_2016'
    )
}}

with

source  as (

    select * from {{ ref('census_2016_g02') }}

),

renamed as (
    select
       lga_code_2016 as lga_code_2016,
       median_age_persons as median_age_persons,
       median_mortgage_repay_monthly as median_mortgage_repay_monthly, 
       median_tot_prsnl_inc_weekly as median_tot_prsnl_inc_weekly,
       median_rent_weekly as median_rent_weekly,
       median_tot_fam_inc_weekly as median_tot_fam_inc_weekly,
       average_num_psns_per_bedroom as average_num_psns_per_bedroom,
       median_tot_hhd_inc_weekly as median_tot_hhd_inc_weekly,
       average_household_size as average_household_size
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