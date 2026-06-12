with Product_sold as(
	select 
		p.division,
		p.product_code,
        p.product,
		sum(sold_quantity) as total_sold_quantity
    from dim_product p
    join fact_sales_monthly s
		on p.product_code = s.product_code
    where s.fiscal_year = 2021
    group by p.product_code,p.product,p.division),
product_sold_per_division as(
			select 
				*,
                dense_rank() over(partition by division order by total_sold_quantity desc) as drnk
                from Product_sold)
                select * from product_sold_per_division where drnk <= 3
                