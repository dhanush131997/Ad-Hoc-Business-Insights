select
	get_fiscal_quarter(date) as fiscal_quarter,
	sum(sold_quantity) as total_sold_quantity
from fact_sales_monthly 
where fiscal_year = 2020
group by fiscal_quarter
order by total_sold_quantity desc