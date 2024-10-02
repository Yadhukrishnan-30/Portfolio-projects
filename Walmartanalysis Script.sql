select *
from walmartsalesdata;

SELECT STR_TO_DATE(`Time`, '%H:%i:%s') AS Time_Formatted
FROM walmartsalesdata;
;
select `time`, case 
when `time` between "00:00:00" and "12:00:00"then "Morning"
when `time` between "12:01:00" and "16:00:00" then "Afternoon"
else "Evening"
end as `Time_of_day`
from walmartsalesdata
;

alter table walmartsalesdata 
add column Time_of_day VARCHAR(20)
;

UPDATE walmartsalesdata 
set Time_of_day =  (case 
when `time` between "00:00:00" and "12:00:00"then "Morning"
when `time` between "12:01:00" and "16:00:00" then "Afternoon"
else "Evening"
end);

alter table walmartsalesdata
add column Day_name VARCHAR(20)
;
select dayname(date)
from walmartsalesdata
;
update walmartsalesdata
set Day_name= dayname(date)
;
select monthname(date)
from walmartsalesdata
;
alter table walmartsalesdata
add column month_name VARCHAR(20)
;
update walmartsalesdata
set month_name = monthname(date)
;
-- Unique cities 
select distinct(city)
from walmartsalesdata
;
select distinct(Branch), City
from walmartsalesdata
order by Branchselect 
;
select count(distinct `Product Line`)
from walmartsalesdata
;
select Payment, count(*) as Count_of_payment
from walmartsalesdata
group by Payment
order by Count_of_payment desc
limit 1
;
select `Product line`, Count(*) as Count_of_product
from walmartsalesdata
group by `Product line`
order by Count_of_product desc
limit 1
;
select month_name, round(sum(Total),2) as Monthly_revenue
from walmartsalesdata 
group by month_name
;
select month_name, round(sum(COGS),2) as Monthly_total_COGS
from walmartsalesdata
group by month_name
;
select month_name, round(sum(Total),2) as Monthly_revenue
from walmartsalesdata 
group by month_name
order by Monthly_revenue desc
limit 1
;
select City, round(sum(Total),2) as city_revenue
from walmartsalesdata 
group by city
order by city_revenue desc
limit 1
;
select City, round(sum(Total),2) as city_revenue
from walmartsalesdata 
group by city
order by city_revenue desc
limit 1
;
select `Product line`, round(sum(`Tax 5%`),2) as Total_VAT
from walmartsalesdata
group by `Product line` 
order by Total_VAT desc
limit 1
;
select Branch, sum(Quantity) as qty
from walmartsalesdata
group by Branch
having sum(Quantity) > (select avg(Quantity) from walmartsalesdata)
;
select Branch, sum(Quantity) as qty, avg(Quantity)
from walmartsalesdata
group by Branch
;
select Gender, `Product line`, count(*) as Product_count
from walmartsalesdata
group by gender, `Product line`
order by  gender, Product_count
;
select Gender, `Product line`, Product_count, max(Product_count) as MAX
from 
(select Gender, `Product line`, count(*) as Product_count
from walmartsalesdata
group by gender, `Product line`
order by  gender, Product_count) as Product
group by Gender, `Product line`,Product_count
having gender = "Male" and MAX= "88" or Gender="Female" and MAX= "96"
;
select `Product line`, round(avg(Rating),2) as Avg_rating
from walmartsalesdata
group by `Product line`
order by Avg_rating
;
with CTE as(
select `Product Line`, sum(Total) as Total_sum, avg(Total) as Total_avg 
from walmartsalesdata
group by `Product Line`
)

select `Product Line`, Total_avg, case 
when Total_avg > 322.97 then "Good"
else "Bad"
end as Performance
from CTE
order by `Product Line`
;
alter table walmartsalesdata
drop column `Product_line_avg_sales`
;
select Time_of_day, Day_name, count(Total) as Number_of_sales
from walmartsalesdata
where Day_name IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')
group by Time_of_day, Day_name
order by Day_name, Time_of_day
;
select `Customer type`, round(sum(Total),2)
from walmartsalesdata
group by `Customer type`
;
select City, round(sum(`Tax 5%`),2) as Total_tax
from walmartsalesdata
group by City
order by Total_tax desc
limit 1
;
select `Customer type`, round(Sum( `Tax 5%`),2) as Total_tax
from walmartsalesdata
Group by `Customer type`
Order by `Customer type` 
limit 1
;
select distinct `Customer type`
from walmartsalesdata
;
select distinct Payment
from walmartsalesdata
;
select `Customer type`, count(*)
from walmartsalesdata
Group by `Customer type`
Order by `Customer type` 
;
select `Customer type`, round(avg( Total),2) as Total_tax
from walmartsalesdata
Group by `Customer type`
Order by `Customer type` 
;
select Gender, count(*)
from walmartsalesdata
group by Gender
;
select Branch, Gender, count(*)
from walmartsalesdata
group by Branch, Gender
order by Branch, Gender
;
select Time_of_day, count(Rating) as Ratings
from walmartsalesdata
group by Time_of_day
order by Ratings desc
;
select Branch, Time_of_day, count(Rating) as Ratings
from walmartsalesdata
group by Branch, Time_of_day
order by Branch,Ratings desc
;
select Day_name ,round(avg(Rating),2) as Avg_ratings
from walmartsalesdata
group by Day_name
order by Avg_ratings desc
;
select Branch, Day_name ,round(avg(Rating),2) as Avg_ratings
from walmartsalesdata
group by Branch,Day_name
order by Branch,Day_name
;




















































