use classicmodels;

/* Q. List all products and their corresponding orders, including those that have not been ordered. */

SELECT p.productCode, p.productName, IFNULL(o.orderNumber, 'No Order') AS orderNumber
FROM products p
LEFT JOIN orderdetails od ON p.productCode = od.productCode
LEFT JOIN orders o ON od.orderNumber = o.orderNumber;