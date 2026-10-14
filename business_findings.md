Retail Business Intelligence: Sales Analysis and Business Findings

1. Executive Summary

This project analyses historical retail transaction data to understand revenue trends, product performance, geographic sales distribution, and customer purchasing behaviour. Python was used for data cleaning, exploratory data analysis, and visualisation, while SQL with DuckDB was used to perform structured business queries.

The analysis focuses on identifying patterns that can support sales monitoring, product planning, customer relationship management, and data-driven business decisions.

The reported findings indicate that November 2011 recorded the highest monthly revenue in the analysis, while February 2011 recorded substantially lower revenue. The report also examines country-level performance, product revenue concentration, and order value distribution.

Important: Revenue represents sales value, not profit. The analysis does not account for product costs, operating expenses, or other costs required to calculate profitability.

2. Project Objectives

The primary objectives were to:

Assess overall retail sales performance using key performance indicators (KPIs).

Examine monthly revenue trends and identify high- and low-performing periods.

Identify products generating the highest revenue.

Compare sales performance across countries.

Analyse order value distribution and customer purchasing behaviour.

Use SQL to validate and summarise business metrics.

Translate analytical results into practical business recommendations.

3. Tools and Technologies

Tool

Purpose

Python

Data analysis and calculations

Pandas

Data cleaning and transformation

NumPy

Numerical operations

Matplotlib

Data visualisation

Seaborn

Statistical visualisation

DuckDB SQL

Business queries and aggregation

Google Colab

Cloud-based development environment

GitHub

Version control and project portfolio

4. Dataset and Methodology

4.1 Dataset

The project uses the Online Retail transaction dataset, containing historical transactions from a retail business. The analysis covers transactions from 2010–2011.

The dataset includes fields such as invoice number, product description, quantity, invoice date, unit price, customer identifier, and country.

4.2 Data Cleaning

The following cleaning and preparation steps were applied:

Inspected the dataset structure, column types, missing values, and duplicate records.

Removed duplicate transaction records.

Identified cancellation invoices using invoice numbers beginning with the cancellation prefix.

Removed records with missing essential transaction fields.

Excluded cancellations and non-positive quantity or unit-price records from the sales analysis.

Calculated revenue at the transaction-line level.

Revenue was calculated as:

Revenue = Quantity × Unit Price

Additional time-based fields were created to support monthly and day-of-week analysis.

4.3 Analytical Approach

The analysis combined descriptive statistics, grouped aggregations, SQL queries, and visualisations to examine:

Overall revenue and order-related KPIs.

Monthly revenue performance.

Top-performing products.

Country-level sales and revenue.

Order value distribution.

Customer purchasing patterns.

5. Key Business Findings

5.1 Monthly Revenue Performance

The reported analysis identified the following monthly revenue figures:

Month

Revenue

November 2011

£1,503,866.78

February 2011

£522,545.56

November 2011 recorded substantially higher revenue than February 2011 in the analysed dataset.

Business interpretation: Monthly revenue differences may reflect seasonal demand, promotional activity, product availability, or changes in transaction volume. These are possible explanations rather than confirmed causes.

Business implication: Retail managers should compare monthly revenue with order counts, average order value, product mix, and previous-year performance before making inventory or staffing decisions.

5.2 Product Performance

The analysis ranked products by revenue to identify the products contributing the most to recorded sales.

Business interpretation: Product-level revenue analysis helps distinguish high-value products from products that contribute less to total sales. Revenue rankings alone, however, do not establish which products are most profitable.

Business implication:

Monitor the availability of consistently high-revenue products.

Review demand patterns before making inventory decisions.

Compare revenue with units sold and product costs.

Investigate low-performing products before deciding whether to change pricing, promotion, or product assortment.

The exact top products and their revenue values should be taken from outputs/top_products.csv.

5.3 Country-Level Performance

Country-level aggregation was used to compare revenue across geographic markets. The reported analysis indicates that the United Kingdom accounts for a substantial share of recorded revenue.

Business interpretation: Revenue concentration in one country may indicate a strong established market, but it can also create dependence on that market.

Business implication:

Maintain service quality and product availability in major markets.

Compare order frequency and average order value across countries.

Investigate smaller markets for potential growth opportunities.

Assess shipping, returns, and operational costs before prioritising geographic expansion.

Country-level revenue should be interpreted alongside the number of orders and customers. A high revenue figure does not necessarily mean a country has the highest number of customers.

5.4 Order Value Distribution

The reported average order value was £533.17, while the median order value was £303.30.

The mean is higher than the median, suggesting that the order value distribution may be positively skewed, with some high-value orders pulling the average upward.

Business interpretation: The average alone may not represent the typical customer's order. The median provides a useful complementary measure because it is less sensitive to unusually large orders.

Business implication:

Monitor both mean and median order values.

Examine unusually large orders separately.

Segment customers by purchasing behaviour where suitable identifiers are available.

Avoid basing typical customer spending estimates on the mean alone.

These figures should be interpreted according to the order definition and aggregation method used in the notebook.

5.5 Customer Purchasing Behaviour

Customer-level analysis was used to examine purchasing activity and identify customers with high recorded spending.

Business interpretation: Differences in spending can help distinguish occasional buyers from customers who contribute a large proportion of sales. High spending does not necessarily indicate customer loyalty, since purchase frequency and the period of activity also matter.

Business implication:

Monitor repeat-purchase frequency.

Identify customers with declining activity where the data permits.

Consider customer segmentation based on order frequency and spending.

Evaluate retention initiatives using measurable outcomes.

Customer identifiers should be handled carefully, and personal information should not be published in the repository.

6. Business Recommendations

Based on the analytical approach and reported results, the following actions are recommended for further investigation.

Recommendation 1: Strengthen Monthly Sales Monitoring

Develop a monthly sales dashboard displaying revenue, order count, average order value, and month-on-month growth.

This would help management distinguish revenue changes caused by more orders from changes caused by higher spending per order.

Recommendation 2: Improve Product Planning

Use the product revenue rankings to identify products that warrant closer monitoring. Combine revenue with units sold, product costs, and inventory availability before making purchasing decisions.

This prevents high revenue from being mistaken for high profitability.

Recommendation 3: Evaluate Geographic Concentration

Compare each country's share of total revenue and its order volume. Investigate whether the business depends heavily on one market and assess other markets for potential expansion.

Any expansion decision should also account for fulfilment costs, returns, and customer demand.

Recommendation 4: Use Multiple Measures of Order Value

Track mean order value, median order value, and the distribution of order values together.

This provides a more complete understanding of typical purchases and unusually large transactions.

Recommendation 5: Develop Customer Segments

Where the data supports reliable customer-level analysis, group customers according to purchasing frequency and spending. Use these segments to inform retention initiatives and measure whether repeat purchasing improves over time.

Recommendation 6: Extend the Analysis to Profitability

The current analysis focuses on revenue. A future version should incorporate product costs, discounts, shipping expenses, and return-related costs where reliable data is available.

This would allow the business to compare gross margin and contribution rather than relying on sales value alone.

7. Limitations

The findings have several limitations:

The dataset covers historical transactions from 2010–2011 and may not represent current retail conditions.

Revenue is not equivalent to profit.

Missing customer identifiers may limit customer-level analysis.

Excluding cancellation invoices and non-positive transactions may affect comparisons with reports that use different treatment rules.

The analysis is descriptive and does not establish the causes of revenue changes.

Country-level revenue does not independently measure market profitability or growth potential.

The reported results depend on the data-cleaning rules and aggregation definitions used in the notebook.

These limitations should be considered before using the results to make operational or strategic decisions.

8. Conclusion

This project demonstrates how Python and SQL can be combined to transform raw retail transactions into structured business insights.

The analysis examines monthly revenue, product performance, country-level sales, order value distribution, and customer purchasing behaviour. It also demonstrates the importance of data cleaning, KPI selection, and careful interpretation of descriptive statistics.

The project provides a foundation for further work in retail performance dashboards, customer segmentation, demand forecasting, and profitability analysis.

9. Project Deliverables

Retail_Business_Intelligence.ipynb — Python data preparation, analysis, and visualisation.

analysis_queries.sql — SQL queries for business analysis using DuckDB.

outputs/monthly_revenue.csv — Monthly revenue summary.

outputs/country_revenue.csv — Country-level revenue summary.

outputs/country_sales.csv — Country-level sales summary.

outputs/top_products.csv — Product revenue ranking.

outputs/order_summary.csv — Order-related summary.

outputs/kpi_summary.csv — Key performance indicators.

reports/business_findings.md — Written findings and recommendations.

10. Reproducibility

The analysis was developed in Google Colab. To reproduce it, open the notebook, provide the required dataset, and execute the cells in order.

The SQL queries use DuckDB and require the relevant cleaned data table to be available before execution.

Refer to the notebook for the precise cleaning rules, aggregation definitions, and calculations used to generate the results.
