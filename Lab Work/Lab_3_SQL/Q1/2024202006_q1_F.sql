use classicmodels;

/*F. Retrieve a list of all orders along with the product names. Include orders even if the products are not
currently available. */

SELECT o.orderNumber, o.orderDate, p.productName
FROM orders o
LEFT JOIN orderdetails od ON o.orderNumber = od.orderNumber
LEFT JOIN products p ON od.productCode = p.productCode
ORDER BY o.orderNumber;