use classicmodels;

/* R. Retrieve all orders and the corresponding products, including orders with no matching products.*/

SELECT o.orderNumber, IFNULL(p.productName, 'No Product') AS productName
FROM orders o
LEFT JOIN orderdetails od ON o.orderNumber = od.orderNumber
LEFT JOIN products p ON od.productCode = p.productCode;