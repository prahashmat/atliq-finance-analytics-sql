-- Yearly Report for Croma India Sales
# Fiscal Year
# Total Gross Sales by Year

select fgp.fiscal_year, round(sum(fgp.gross_price*fsm.sold_quantity),2) as gross_price_total
from fact_gross_price fgp
join fact_sales_monthly fsm
on fgp.fiscal_year = get_fiscal_year(fsm.date)
where customer_code = 90002002
group by fgp.fiscal_year;

