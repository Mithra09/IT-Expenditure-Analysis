USE IT_Expenditure;

SELECT *
FROM it_expenditure_data
LIMIT 10;

USE IT_Expenditure;

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT Country) AS countries,
    COUNT(DISTINCT Region) AS regions,
    COUNT(DISTINCT `Business Area`) AS business_areas,
    COUNT(DISTINCT `IT Sub Area`) AS it_sub_areas,
    COUNT(DISTINCT `IT Area`) AS it_areas,
    COUNT(DISTINCT `Cost element name`) AS cost_elements
FROM it_expenditure_data;

USE IT_Expenditure;

SELECT
    COUNT(*) AS total_rows,
    SUM(Actual) AS total_actual,
    SUM(Forecast) AS total_forecast,
    SUM(Plan) AS total_plan,
    SUM(CASE WHEN Actual IS NULL THEN 1 ELSE 0 END) AS null_actual,
    SUM(CASE WHEN Forecast IS NULL THEN 1 ELSE 0 END) AS null_forecast,
    SUM(CASE WHEN Plan IS NULL THEN 1 ELSE 0 END) AS null_plan
FROM it_expenditure_data;

USE IT_Expenditure;

SELECT
    SUM(Actual) AS total_actual,
    SUM(Forecast) AS total_forecast,
    SUM(Plan) AS total_plan,

    SUM(Forecast) - SUM(Actual) AS actual_vs_forecast_variance,

    SUM(Plan) - SUM(Actual) AS actual_vs_plan_variance,

    ROUND(
        (SUM(Forecast) - SUM(Actual)) / SUM(Forecast) * 100,
        2
    ) AS actual_vs_forecast_pct,

    ROUND(
        (SUM(Plan) - SUM(Actual)) / SUM(Plan) * 100,
        2
    ) AS actual_vs_plan_pct

FROM it_expenditure_data;

USE IT_Expenditure;

SELECT
    Region,
    SUM(Actual) AS total_actual,
    SUM(Forecast) AS total_forecast,
    SUM(Plan) AS total_plan
FROM it_expenditure_data
GROUP BY Region
ORDER BY total_actual DESC;

USE IT_Expenditure;

SELECT
    Region,

    ROUND(SUM(Actual), 2) AS Actual,
    ROUND(SUM(Forecast), 2) AS Forecast,
    ROUND(SUM(Plan), 2) AS Plan,

    ROUND(SUM(Forecast) - SUM(Actual), 2) AS Variance_vs_Forecast,

    ROUND(SUM(Plan) - SUM(Actual), 2) AS Variance_vs_Plan,

    ROUND(
        (SUM(Forecast) - SUM(Actual)) / NULLIF(SUM(Forecast), 0) * 100,
        2
    ) AS Forecast_Variance_Percent,

    ROUND(
        (SUM(Plan) - SUM(Actual)) / NULLIF(SUM(Plan), 0) * 100,
        2
    ) AS Plan_Variance_Percent

FROM it_expenditure_data
GROUP BY Region
ORDER BY Actual DESC;

USE IT_Expenditure;

SELECT
    Country,
    Region,
    ROUND(SUM(Actual), 2) AS Actual,
    ROUND(SUM(Forecast), 2) AS Forecast,
    ROUND(SUM(Plan), 2) AS Plan,

    ROUND(
        (SUM(Forecast) - SUM(Actual)) / NULLIF(SUM(Forecast), 0) * 100,
        2
    ) AS Forecast_Variance_Percent,

    ROUND(
        (SUM(Plan) - SUM(Actual)) / NULLIF(SUM(Plan), 0) * 100,
        2
    ) AS Plan_Variance_Percent

FROM it_expenditure_data
GROUP BY Country, Region
ORDER BY Actual DESC;

USE IT_Expenditure;

SELECT
    `IT Area`,
    COUNT(*) AS total_rows,
    ROUND(SUM(Actual), 2) AS Actual,
    ROUND(SUM(Forecast), 2) AS Forecast,
    ROUND(SUM(Plan), 2) AS Plan,

    ROUND(
        (SUM(Forecast) - SUM(Actual))
        / NULLIF(SUM(Forecast), 0) * 100,
        2
    ) AS Forecast_Variance_Percent,

    ROUND(
        (SUM(Plan) - SUM(Actual))
        / NULLIF(SUM(Plan), 0) * 100,
        2
    ) AS Plan_Variance_Percent

FROM it_expenditure_data
GROUP BY `IT Area`
ORDER BY Actual DESC;

USE IT_Expenditure;

SELECT
    `IT Sub Area`,
    COUNT(*) AS total_rows,
    ROUND(SUM(Actual), 2) AS Actual,
    ROUND(SUM(Forecast), 2) AS Forecast,
    ROUND(SUM(Plan), 2) AS Plan,

    ROUND(
        (SUM(Forecast) - SUM(Actual))
        / NULLIF(SUM(Forecast), 0) * 100,
        2
    ) AS Forecast_Variance_Percent,

    ROUND(
        (SUM(Plan) - SUM(Actual))
        / NULLIF(SUM(Plan), 0) * 100,
        2
    ) AS Plan_Variance_Percent

FROM it_expenditure_data
GROUP BY `IT Sub Area`
ORDER BY Actual DESC;

USE IT_Expenditure;

SELECT
    `Cost element name`,
    COUNT(*) AS total_rows,
    ROUND(SUM(Actual), 2) AS Actual,
    ROUND(SUM(Forecast), 2) AS Forecast,
    ROUND(SUM(Plan), 2) AS Plan,

    ROUND(
        (SUM(Forecast) - SUM(Actual))
        / NULLIF(SUM(Forecast), 0) * 100,
        2
    ) AS Forecast_Variance_Percent,

    ROUND(
        (SUM(Plan) - SUM(Actual))
        / NULLIF(SUM(Plan), 0) * 100,
        2
    ) AS Plan_Variance_Percent

FROM it_expenditure_data
GROUP BY `Cost element name`
ORDER BY Actual DESC;

USE IT_Expenditure;

SELECT
    Date,
    COUNT(*) AS total_rows,
    ROUND(SUM(Actual), 2) AS Actual,
    ROUND(SUM(Forecast), 2) AS Forecast,
    ROUND(SUM(Plan), 2) AS Plan,

    ROUND(
        (SUM(Forecast) - SUM(Actual))
        / NULLIF(SUM(Forecast), 0) * 100,
        2
    ) AS Forecast_Variance_Percent,

    ROUND(
        (SUM(Plan) - SUM(Actual))
        / NULLIF(SUM(Plan), 0) * 100,
        2
    ) AS Plan_Variance_Percent

FROM it_expenditure_data
GROUP BY Date
ORDER BY
    CASE Date
        WHEN 'Jan' THEN 1
        WHEN 'Feb' THEN 2
        WHEN 'Mar' THEN 3
        WHEN 'Apr' THEN 4
        WHEN 'May' THEN 5
        WHEN 'Jun' THEN 6
        WHEN 'Jul' THEN 7
        WHEN 'Aug' THEN 8
        WHEN 'Sep' THEN 9
        WHEN 'Oct' THEN 10
        WHEN 'Nov' THEN 11
        WHEN 'Dec' THEN 12
        ELSE 13
    END;
    
    USE IT_Expenditure;

SELECT
    Date,
    COUNT(*) AS total_rows,
    COUNT(Actual) AS actual_non_null_rows,
    SUM(CASE WHEN Actual = 0 THEN 1 ELSE 0 END) AS actual_zero_rows,
    ROUND(SUM(Actual), 2) AS total_actual
FROM it_expenditure_data
GROUP BY Date
ORDER BY
    CASE Date
        WHEN 'Jan' THEN 1
        WHEN 'Feb' THEN 2
        WHEN 'Mar' THEN 3
        WHEN 'Apr' THEN 4
        WHEN 'May' THEN 5
        WHEN 'Jun' THEN 6
        WHEN 'Jul' THEN 7
        WHEN 'Aug' THEN 8
        WHEN 'Sep' THEN 9
        WHEN 'Oct' THEN 10
        WHEN 'Nov' THEN 11
        WHEN 'Dec' THEN 12
        ELSE 13
    END;
    
    USE IT_Expenditure;

SELECT
    `Cost element name`,
    ROUND(SUM(Actual), 2) AS Actual,
    ROUND(SUM(Forecast), 2) AS Forecast,
    ROUND(SUM(Plan), 2) AS Plan,
    ROUND(SUM(Forecast) - SUM(Actual), 2) AS Forecast_Gap,
    ROUND(SUM(Plan) - SUM(Actual), 2) AS Plan_Gap
FROM it_expenditure_data
GROUP BY `Cost element name`
ORDER BY Actual DESC
LIMIT 10;

USE IT_Expenditure;

SELECT
    `Cost element name`,
    ROUND(SUM(Actual), 2) AS Actual,
    ROUND(SUM(Forecast), 2) AS Forecast,
    ROUND(SUM(Plan), 2) AS Plan,

    ROUND(SUM(Forecast) - SUM(Actual), 2) AS Forecast_Gap,

    ROUND(SUM(Plan) - SUM(Actual), 2) AS Plan_Gap

FROM it_expenditure_data

GROUP BY `Cost element name`

ORDER BY ABS(SUM(Plan) - SUM(Actual)) DESC

LIMIT 10;

USE IT_Expenditure;

SELECT
    `Cost element name`,
    ROUND(SUM(Actual), 2) AS Actual,
    ROUND(SUM(Plan), 2) AS Plan,
    ROUND(SUM(Actual) - SUM(Plan), 2) AS Overspend

FROM it_expenditure_data

GROUP BY `Cost element name`

HAVING SUM(Actual) > SUM(Plan)

ORDER BY Overspend DESC

LIMIT 10;

USE IT_Expenditure;

SELECT
    Region,
    `Cost element name`,
    ROUND(SUM(Actual), 2) AS Actual,
    ROUND(SUM(Plan), 2) AS Plan,
    ROUND(SUM(Actual) - SUM(Plan), 2) AS Overspend

FROM it_expenditure_data

GROUP BY Region, `Cost element name`

HAVING SUM(Actual) > SUM(Plan)

ORDER BY Overspend DESC

LIMIT 15;


USE IT_Expenditure;

SELECT
    Country,
    `Business Area`,
    `IT Area`,
    ROUND(SUM(Actual), 2) AS Actual,
    ROUND(SUM(Plan), 2) AS Plan,
    ROUND(SUM(Actual) - SUM(Plan), 2) AS Overspend

FROM it_expenditure_data

WHERE Region = 'USA'
  AND `Cost element name` = 'Telephone'

GROUP BY Country, `Business Area`, `IT Area`

HAVING SUM(Actual) > SUM(Plan)

ORDER BY Overspend DESC

LIMIT 15;


USE IT_Expenditure;

SELECT
    `IT Sub Area`,
    `IT Area`,
    ROUND(SUM(Actual), 2) AS Actual,
    ROUND(SUM(Plan), 2) AS Plan,
    ROUND(SUM(Actual) - SUM(Plan), 2) AS Overspend

FROM it_expenditure_data

WHERE Region = 'USA'
  AND `Cost element name` = 'Telephone'
  AND `Business Area` = 'Infrastructure'
  AND `IT Area` = 'Infrastructure'

GROUP BY `IT Sub Area`, `IT Area`

HAVING SUM(Actual) > SUM(Plan)

ORDER BY Overspend DESC;

USE IT_Expenditure;

SELECT
    `Cost Element Group`,
    `Cost Element Sub Group`,
    ROUND(SUM(Actual), 2) AS Actual,
    ROUND(SUM(Plan), 2) AS Plan,
    ROUND(SUM(Actual) - SUM(Plan), 2) AS Overspend

FROM it_expenditure_data

WHERE Region = 'USA'
  AND `Cost element name` = 'Telephone'
  AND `Business Area` = 'Infrastructure'
  AND `IT Area` = 'Infrastructure'
  AND `IT Sub Area` = 'Networking'

GROUP BY
    `Cost Element Group`,
    `Cost Element Sub Group`

HAVING SUM(Actual) > SUM(Plan)

ORDER BY Overspend DESC;


USE IT_Expenditure;

SELECT
    Date,
    COUNT(*) AS total_rows,
    ROUND(SUM(Actual), 2) AS Actual,
    ROUND(SUM(Plan), 2) AS Plan,
    ROUND(SUM(Actual) - SUM(Plan), 2) AS Overspend

FROM it_expenditure_data

WHERE Region = 'USA'
  AND `Cost element name` = 'Telephone'
  AND `Business Area` = 'Infrastructure'
  AND `IT Area` = 'Infrastructure'
  AND `IT Sub Area` = 'Networking'
  AND `Cost Element Group` = 'Other'
  AND `Cost Element Sub Group` = 'Telecomm'

GROUP BY Date

ORDER BY Overspend DESC;

USE IT_Expenditure;

SELECT
    Date,
    COUNT(*) AS total_rows,
    ROUND(SUM(Actual), 2) AS Actual,
    ROUND(SUM(Forecast), 2) AS Forecast,
    ROUND(SUM(Plan), 2) AS Plan,
    ROUND(SUM(Actual) - SUM(Forecast), 2) AS Actual_vs_Forecast,
    ROUND(SUM(Actual) - SUM(Plan), 2) AS Actual_vs_Plan

FROM it_expenditure_data

GROUP BY Date

ORDER BY
    CASE Date
        WHEN 'Jan' THEN 1
        WHEN 'Feb' THEN 2
        WHEN 'Mar' THEN 3
        WHEN 'Apr' THEN 4
        WHEN 'May' THEN 5
        WHEN 'Jun' THEN 6
        WHEN 'Jul' THEN 7
        WHEN 'Aug' THEN 8
        WHEN 'Sep' THEN 9
        WHEN 'Oct' THEN 10
        WHEN 'Nov' THEN 11
        WHEN 'Dec' THEN 12
    END;
    
    USE IT_Expenditure;

SELECT
    ROUND(SUM(Actual), 2) AS Total_Actual,
    ROUND(SUM(Forecast), 2) AS Total_Forecast,
    ROUND(SUM(Plan), 2) AS Total_Plan,

    ROUND(SUM(Actual) - SUM(Forecast), 2) AS Actual_vs_Forecast,

    ROUND(SUM(Actual) - SUM(Plan), 2) AS Actual_vs_Plan,

    ROUND(
        SUM(Actual) / NULLIF(SUM(Forecast), 0) * 100,
        2
    ) AS Actual_as_Pct_of_Forecast,

    ROUND(
        SUM(Actual) / NULLIF(SUM(Plan), 0) * 100,
        2
    ) AS Actual_as_Pct_of_Plan

FROM it_expenditure_data

WHERE Date IN
(
    'Jan','Feb','Mar','Apr',
    'May','Jun','Jul','Aug'
);


USE IT_Expenditure;

SELECT
    `Cost element name`,
    ROUND(SUM(Actual), 2) AS Actual,
    ROUND(SUM(Forecast), 2) AS Forecast,
    ROUND(SUM(Plan), 2) AS Plan,
    ROUND(SUM(Actual) - SUM(Plan), 2) AS Actual_vs_Plan
FROM it_expenditure_data
WHERE Date IN
(
    'Jan','Feb','Mar','Apr',
    'May','Jun','Jul','Aug'
)
GROUP BY `Cost element name`
ORDER BY Actual DESC
LIMIT 15;

USE IT_Expenditure;

SELECT
    `Cost element name`,
    ROUND(SUM(Actual), 2) AS Actual,
    ROUND(SUM(Plan), 2) AS Plan,
    ROUND(SUM(Actual) - SUM(Plan), 2) AS Overspend
FROM it_expenditure_data
WHERE Date IN
(
    'Jan','Feb','Mar','Apr',
    'May','Jun','Jul','Aug'
)
GROUP BY `Cost element name`
HAVING SUM(Actual) > SUM(Plan)
ORDER BY Overspend DESC
LIMIT 10;

USE IT_Expenditure;

SELECT
    Region,
    `Cost element name`,
    ROUND(SUM(Actual), 2) AS Actual,
    ROUND(SUM(Plan), 2) AS Plan,
    ROUND(SUM(Actual) - SUM(Plan), 2) AS Overspend
FROM it_expenditure_data
WHERE Date IN
(
    'Jan','Feb','Mar','Apr',
    'May','Jun','Jul','Aug'
)
GROUP BY Region, `Cost element name`
HAVING SUM(Actual) > SUM(Plan)
ORDER BY Overspend DESC
LIMIT 15;

USE IT_Expenditure;

SELECT
    `IT Area`,
    ROUND(SUM(Actual), 2) AS Actual,
    ROUND(SUM(Plan), 2) AS Plan,
    ROUND(SUM(Actual) - SUM(Plan), 2) AS Overspend
FROM it_expenditure_data
WHERE Date IN
(
    'Jan','Feb','Mar','Apr',
    'May','Jun','Jul','Aug'
)
GROUP BY `IT Area`
HAVING SUM(Actual) > SUM(Plan)
ORDER BY Overspend DESC;

USE IT_Expenditure;

SELECT
    `IT Area`,
    ROUND(SUM(Actual), 2) AS Actual,
    ROUND(SUM(Plan), 2) AS Plan,
    ROUND(SUM(Actual) - SUM(Plan), 2) AS Variance
FROM it_expenditure_data
WHERE Date IN
(
    'Jan','Feb','Mar','Apr',
    'May','Jun','Jul','Aug'
)
GROUP BY `IT Area`
ORDER BY Variance DESC;


USE IT_Expenditure;

SELECT
    Date,
    ROUND(SUM(Actual), 2) AS Actual,
    ROUND(SUM(Plan), 2) AS Plan,
    ROUND(SUM(Actual) - SUM(Plan), 2) AS Variance,
    ROUND(
        CASE
            WHEN SUM(Plan) <> 0
            THEN ((SUM(Actual) - SUM(Plan)) / SUM(Plan)) * 100
            ELSE NULL
        END,
        2
    ) AS Variance_Percent
FROM it_expenditure_data
WHERE Date IN
(
    'Jan','Feb','Mar','Apr',
    'May','Jun','Jul','Aug'
)
GROUP BY Date
ORDER BY
    CASE Date
        WHEN 'Jan' THEN 1
        WHEN 'Feb' THEN 2
        WHEN 'Mar' THEN 3
        WHEN 'Apr' THEN 4
        WHEN 'May' THEN 5
        WHEN 'Jun' THEN 6
        WHEN 'Jul' THEN 7
        WHEN 'Aug' THEN 8
    END;
    
    
    USE IT_Expenditure;

SELECT
    Country,
    ROUND(SUM(Actual), 2) AS Actual,
    ROUND(SUM(Plan), 2) AS Plan,
    ROUND(SUM(Actual) - SUM(Plan), 2) AS Overspend
FROM it_expenditure_data
WHERE Date IN
(
    'Jan','Feb','Mar','Apr',
    'May','Jun','Jul','Aug'
)
GROUP BY Country
HAVING SUM(Actual) > SUM(Plan)
ORDER BY Overspend DESC
LIMIT 10;

USE IT_Expenditure;

SELECT
    COUNT(*) AS Total_Rows,

    ROUND(SUM(Actual), 2) AS Total_Actual,

    ROUND(SUM(Forecast), 2) AS Total_Forecast,

    ROUND(SUM(Plan), 2) AS Total_Plan,

    ROUND(SUM(Actual) - SUM(Forecast), 2) AS Actual_vs_Forecast,

    ROUND(SUM(Actual) - SUM(Plan), 2) AS Actual_vs_Plan,

    ROUND(
        (SUM(Actual) / NULLIF(SUM(Forecast), 0)) * 100,
        2
    ) AS Actual_as_Pct_of_Forecast,

    ROUND(
        (SUM(Actual) / NULLIF(SUM(Plan), 0)) * 100,
        2
    ) AS Actual_as_Pct_of_Plan,

    COUNT(DISTINCT Country) AS Countries,

    COUNT(DISTINCT Region) AS Regions,

    COUNT(DISTINCT `IT Area`) AS IT_Areas,

    COUNT(DISTINCT `Cost element name`) AS Cost_Elements

FROM it_expenditure_data
WHERE Date IN
(
    'Jan','Feb','Mar','Apr',
    'May','Jun','Jul','Aug'
);
