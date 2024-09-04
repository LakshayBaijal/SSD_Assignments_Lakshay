use classicmodels;

/*L. Retrieve the list of customers ordered by their credit limit in descending order*/

SELECT customerName
FROM customers
ORDER BY creditLimit DESC;