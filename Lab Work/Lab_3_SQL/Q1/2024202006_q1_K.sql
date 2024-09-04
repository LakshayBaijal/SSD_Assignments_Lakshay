use classicmodels;

/* K. Find products that have been ordered more than 1000 times in total. */

SELECT p.productCode, p.productName
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productCode
HAVING SUM(od.quantityOrdered) > 1000;