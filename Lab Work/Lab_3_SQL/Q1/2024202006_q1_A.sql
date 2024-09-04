use classicmodels;

/* A Find the top 5 employees who have the highest total sales (sum of order amounts) and
work in an office located in the USA. */

SELECT 
    e.employeeNumber, 
    e.firstName, 
    e.lastName, 
    e.officeCode,
    SUM(od.priceEach * od.quantityOrdered) AS totalSales
FROM 
    employees e
JOIN 
    customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN 
    orders o ON c.customerNumber = o.customerNumber
JOIN 
    orderdetails od ON o.orderNumber = od.orderNumber
WHERE 
    e.officeCode IN (SELECT officeCode FROM offices WHERE country = 'USA')
GROUP BY 
    e.employeeNumber, e.firstName, e.lastName, e.officeCode
ORDER BY 
    totalSales DESC
LIMIT 5;
