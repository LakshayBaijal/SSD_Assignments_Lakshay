use classicmodels;

/* J. List the total quantity ordered for each product. */

SELECT p.productCode, p.productName, SUM(od.quantityOrdered) AS totalQuantityOrdered
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productCode, p.productName
ORDER BY totalQuantityOrdered DESC;