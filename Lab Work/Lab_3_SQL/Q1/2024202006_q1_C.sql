use classicmodels;

/*C. List all customers who have placed an order or made a payment. */

SELECT 
    cust.customerNumber, 
    cust.customerName
FROM 
    customers cust
WHERE 
    cust.customerNumber IN (
        SELECT customerNumber 
        FROM orders
    )
OR cust.customerNumber IN (
        SELECT customerNumber 
        FROM payments);