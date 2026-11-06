-- Finance Analytics
-- Croma India Product Wise Sales Report for FY 2021
#Report should have
-- Month
-- Product Name
-- Variaant
-- Sold Quantity
-- Gross Price Per Item
-- Gross Price Total
-- AtliQ FY starts in September every year 

# Croma : 90002002
#Q1 = 9,10,11
#Q2 = 12,1,2
#Q3 = 3,4,5
#Q4 = 6,7,8

select fsm.date, fsm.product_code, dp.product,dp.variant, fsm.sold_quantity, fgp.gross_price, round(fgp.gross_price*fsm.sold_quantity,2) as gross_price_total
from fact_sales_monthly fsm
join dim_product dp
using (product_code)
join fact_gross_price fgp
on fgp.product_code = fsm.product_code and fgp.fiscal_year = get_fiscal_year(fsm.date)
where customer_code = 90002002 and get_fiscal_year(date)=2021
order by date asc
limit 1000000
