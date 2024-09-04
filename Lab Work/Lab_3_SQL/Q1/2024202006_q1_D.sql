use classicmodels;

/*D. List customers who have both placed an order and made a payment. */

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
AND cust.customerNumber IN (
        SELECT customerNumber 
        FROM payments);
