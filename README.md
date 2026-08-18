IT Expenditure Analysis
Project Overview

This project analyzes IT expenditure data using MySQL to evaluate actual spending against forecast and planned budgets.

The analysis focuses on identifying expenditure patterns, budget variances, overspending areas, and business segments that require attention.

The objective is to transform raw IT expenditure data into meaningful financial and operational insights that can support better budget monitoring and decision-making.

Business Objectives

The analysis was designed to answer key business questions such as:

How does Actual expenditure compare with the Forecast?
How does Actual expenditure compare with the Plan?
Which IT areas have the largest budget variances?
Which IT sub-areas contribute most to expenditure?
Which cost elements are driving overspending?
Which regions and countries have the highest overspend?
How does expenditure vary across months?
Which areas require closer budget monitoring?
Dataset

The analysis was performed on the it_expenditure_data table.

The dataset contains expenditure information across different organizational and financial dimensions, including:

Date
Business Area
IT Area
IT Sub Area
Region
Country
Cost Element
Cost Element Group
Cost Element Sub Group
Actual
Forecast
Plan

The analysis contains 62,887 records across:

23 countries
6 regions
5 IT areas
205 cost elements
Key Analysis Performed
1. Actual vs Forecast Analysis

Calculated the difference between Actual and Forecast expenditure to identify whether spending was above or below the expected forecast.

2. Actual vs Plan Analysis

Compared Actual expenditure with the planned budget to identify budget variances.

3. IT Area Analysis

Aggregated expenditure by IT Area to identify areas with significant financial impact.

4. IT Sub-Area Analysis

Analyzed IT Sub Areas to identify detailed spending patterns within each IT function.

5. Cost Element Analysis

Ranked individual cost elements based on expenditure and overspend.

6. Regional Analysis

Compared Actual, Plan and Overspend across regions.

7. Country Analysis

Identified countries with the highest expenditure and overspend.

8. Monthly Analysis

Analyzed expenditure trends by month and compared Actual against Plan and Forecast.

9. Overspend Analysis

Calculated:

Overspend = Actual - Plan

Positive values indicate expenditure above the planned amount.

10. Variance Percentage Analysis

Calculated percentage variances to make comparisons between different areas easier.

SQL Techniques Used

The project demonstrates practical SQL skills including:

SELECT
SUM()
COUNT()
CASE WHEN
GROUP BY
ORDER BY
HAVING
WHERE
Aggregate calculations
Percentage calculations
Variance calculations
NULL and zero-value checks
Month ordering using CASE
Aliasing
LIMIT
Conditional aggregation
Key Findings
Overall Financial Performance

The analysis produced the following overall results:

Metric	Value
Total Actual	555,731,161.69
Total Forecast	574,819,678.81
Total Plan	611,305,937.70
Actual vs Forecast	-19,088,517.12
Actual vs Plan	-55,574,776.01
Actual as % of Forecast	96.68%
Actual as % of Plan	90.91%

Overall, Actual expenditure was approximately 96.68% of Forecast and 90.91% of Plan.

This indicates that total expenditure was below both the forecast and planned budget based on the analyzed data.

Important Insights
Cost Element

Telephone showed the highest overspend in the cost-element analysis, with approximately:

22.48M

in expenditure above plan.

Other significant overspend contributors included:

Software
Payroll Taxes - Salaries
Insurance
Retirement Plan Match
Bonuses
Outside Services
Recurring
Purchased Software
Sub Contract Labor
IT Area

The analysis identified expenditure differences across:

Functional
BU Support
Infrastructure
Governance
Enablement

The IT Area analysis shows that all five areas had Actual expenditure below Plan overall, although individual cost elements within these areas could still show significant overspending.

Country

Countries with notable positive overspend included:

Germany
Spain
United Kingdom
Switzerland
Czech Republic

Germany showed approximately 1.79M in overspend, while Spain showed approximately 1.74M.

Region & Cost Element

The regional analysis identified several high-overspend combinations.

For example, USA – Telephone showed approximately 19.12M in overspend.

The analysis also identified Europe – Telephone as another significant contributor.

Monthly Analysis

Actual expenditure was available through August in the analyzed monthly results.

From September through December, Actual expenditure appeared as zero while Forecast and Plan values continued to exist.

This is an important data-quality/business-context observation because those zero Actual values may represent months where actual expenditure had not yet been recorded rather than genuine zero spending.

Sample Business Questions Answered

The SQL analysis helps answer questions such as:

Which cost element has the highest overspend?

Telephone.

Is total Actual expenditure above or below the Plan?

Below the Plan by approximately 55.57M.

How does Actual compare with Forecast?

Actual is approximately 19.09M below Forecast.

What percentage of Forecast has been spent?

Approximately 96.68%.

What percentage of Plan has been spent?

Approximately 90.91%.

Which country shows the highest overspend among the displayed results?

Germany.

Which regional/cost-element combination has significant overspending?

USA – Telephone is one of the most significant examples identified.

Project Structure
IT-Expenditure-Analysis/
│
├── README.md
│
├── sql/
│   └── IT_Expenditure_Analysis.sql
│
└── screenshots/
    ├── ...
    └── ...

The sql folder contains the complete SQL analysis, while the screenshots folder contains supporting screenshots of the executed queries and results.

Screenshots

Screenshots of the SQL analysis results are available in the screenshots folder.

They demonstrate:

Monthly expenditure analysis
IT Area analysis
IT Sub Area analysis
Cost Element analysis
Regional analysis
Country analysis
Overspend analysis
Actual vs Forecast
Actual vs Plan
Overall expenditure summary
Tools & Technologies

Database: MySQL
SQL Environment: MySQL Workbench
Version Control: Git / GitHub

Conclusion

This project demonstrates how SQL can be used to transform IT expenditure data into actionable financial insights.

The analysis highlights the relationship between Actual, Forecast and Plan expenditure, identifies major overspending areas, and provides multiple levels of analysis across IT areas, cost elements, regions, countries and months.

The findings can help organizations improve budget monitoring, expenditure control and financial decision-making.
