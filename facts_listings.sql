{{
    config(
        unique_key='listing_id'
    )
}}

with check_dimensions as
(select 
	order_id,
	date,
	case when scrape_id in (select distinct scrape_id from {{ ref('scrape_id') }}) then scrape_id else 0 end as scrape_id,
	case when host_id in (select distinct host_id from {{ ref('host_id') }}) then host_id else 0 end as host_id
from {{ ref('listings_stg') }})

select 
	a.scrape_id, 
	a.host_id,
	-- b.brand_description, 
	-- c.category_description, 
	-- d.sub_category_description,
	-- a.price
-- from check_dimensions a 
-- left join census_2016_g01_stg on lga_code = lga_code 
-- left join census_2016_g01_stg on lga_code = lga_code 
-- left join census_2016_g01_stg on lga_code = lga_code 
-- left join staging.category_stg c  on a.category_id = c.category_id and a.date::timestamp between b.dbt_valid_from and coalesce(b.dbt_valid_to, '9999-12-31'::timestamp) 
-- left join staging.sub_category_stg d  on a.sub_category_id = d.sub_category_id and a.date::timestamp between b.dbt_valid_from and coalesce(b.dbt_valid_to, '9999-12-31'::timestamp) 
