{{
    config(
        unique_key='host_id'
    )
}}

select * from {{ ref('census_2016_g02_stg') }}