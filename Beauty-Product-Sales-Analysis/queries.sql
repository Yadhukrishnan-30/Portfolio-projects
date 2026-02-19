select *
from supply_chain_data
;
SELECT `Product_type`,SUM(`Revenue_generated`) AS total_revenue
from supply_chain_data
GROUP BY `Product_type`;

SELECT SKU, product_sold
FROM supply_chain_data
ORDER BY  product_sold DESC
LIMIT 5;

SELECT Shipping_carriers, round(AVG(Shipping_costs),2) AS avg_shipping_cost
FROM supply_chain_data
GROUP BY `Shipping_carriers`;

#Products with high defect rates
select SKU, round(sum(Defect_rates),2) as defect_rates
from supply_chain_data
where defect_rates > 3
group by SKU
order by Defect_rates desc
;

#Carrier performance: average delivery time
select Shipping_carriers, avg(Shipping_times) as avg_shipping_times
from supply_chain_data
group by Shipping_carriers
order by Shipping_carriers
;
#9) Manufacturing cost vs inspection failures

select SKU, Manufacturing_costs, Inspection_results
from supply_chain_data
where Inspection_results="Pending"
order by Manufacturing_costs desc
;

#This shows how stock levels change with longer or shorter lead times.

select SKU, Stock_levels, Lead_times
from supply_chain_data
order by Stock_levels;
select *
from supply_chain_data
;
SELECT 
  AVG(`Stock_levels`) AS avg_stock,
  `Lead_times`
FROM supply_chain_data
GROUP BY `Lead_times`
ORDER BY `Lead_times`;


select product_type, round(avg(Lead_times), 
2) as avg_lead_time, round(avg(Stock_levels),
2) as avg_stock_level, round(avg(Availability),
2) as avg_availablity
from supply_chain_data
group by product_type
order by product_type
;

SELECT AVG(`Stock_levels`) AS avg_stock, `Lead_times`
FROM supply_chain_data
GROUP BY `Lead_times`
ORDER BY `Lead_times`;

#2. Top performing products by sales volume and revenue
select SKU, product_type, 
round(sum(Product_sold),2) as sales_volume
from supply_chain_data
group by SKU, product_type
order by sales_volume desc
;

select SKU, product_type, 
round(sum(revenue_generated),2) as revenue_generated
from supply_chain_data
group by SKU, product_type
order by revenue_generated desc;

select product_type, sum(Product_sold) as sales_volume, round(sum(revenue_generated),2) as revenue_generated
from supply_chain_data
group by product_type
order by sales_volume
;

#Is there a correlation between product pricing and sales volume?

#Comparison between gender sales quantity

select Customer_demographics, round(sum(product_sold)) as total_products_sold
from supply_chain_data
group by Customer_demographics
order by total_products_sold desc
;













