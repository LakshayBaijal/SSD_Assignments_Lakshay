use classicmodels;

/*P. Retrieve a list of orders along with the names of the products ordered. */

SELECT o.orderNumber, o.orderDate, p.productName
FROM orders o
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode
ORDER BY o.orderNumber;