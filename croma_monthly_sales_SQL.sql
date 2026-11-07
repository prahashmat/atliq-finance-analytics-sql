select fsm.date, sum(gross_price*sold_quantity) as gross_price_total
from fact_sales_monthly fsm
join fact_gross_price fgp
on fsm.product_code = fgp.product_code and fgp.fiscal_year = get_fiscal_year(fsm.date)
where customer_code = 90002002
group by date
