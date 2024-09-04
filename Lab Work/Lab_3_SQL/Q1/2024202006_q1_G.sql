use classicmodels;

/* G. Find the names of customers who have never placed an order.*/

SELECT c.customerNumber, c.customerName
FROM customers c
WHERE c.customerNumber NOT IN (
    SELECT o.customerNumber FROM orders o
);