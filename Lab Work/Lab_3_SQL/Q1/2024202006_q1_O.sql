use classicmodels;

/*O. List all customers who have placed at least one order.*/

SELECT DISTINCT c.customerNumber, c.customerName
FROM customers c
INNER JOIN orders o ON c.customerNumber = o.customerNumber;