use classicmodels;

/*M. List all distinct cities where either an office or a customer is located*/

SELECT DISTINCT city
FROM (
    SELECT city FROM offices
    UNION
    SELECT city FROM customers
) AS cities;