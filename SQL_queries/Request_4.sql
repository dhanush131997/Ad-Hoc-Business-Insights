with 
product_by_segment as
	(select 
	    p.segment,
	    count(distinct CASE WHEN f.fiscal_year = 2020 THEN f.product_code END) as product_count_2020,
		count(distinct CASE WHEN f.fiscal_year = 2021 THEN f.product_code END) as product_count_2021
		from dim_product p
		join fact_sales_monthly f
		on p.product_code = f.product_code
		group by segment)
        
        select
			*,
            (product_count_2021-product_count_2020) as difference
            from product_by_segment
            order by difference desc;