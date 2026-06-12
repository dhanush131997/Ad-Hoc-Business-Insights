SELECT 
    p.product as product,
    p.product_code as product_code,
    concat("$", round(m.manufacturing_cost,2)) as manufacturing_cost
FROM gdb023.dim_product p
join fact_manufacturing_cost m
on p.product_code = m.product_code
where manufacturing_cost in (
(select 
	max(manufacturing_cost)
    from fact_manufacturing_cost),
(select 
	min(manufacturing_cost)
    from fact_manufacturing_cost))
    order by manufacturing_cost desc;