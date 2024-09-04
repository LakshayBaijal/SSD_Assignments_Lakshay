use classicmodels;

/*B. Retrieve the 10 most expensive products, skipping the first 5.*/

SELECT productCode, productName, buyPrice
FROM products
ORDER BY buyPrice DESC
LIMIT 10 OFFSET 5;

