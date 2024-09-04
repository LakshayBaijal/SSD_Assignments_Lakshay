use classicmodels;

/* A Find the top 5 employees who have the highest total sales (sum of order amounts) and
work in an office located in the USA. */

/*B. Retrieve the 10 most expensive products, skipping the first 5.*/

SELECT productCode, productName, buyPrice
FROM products
ORDER BY buyPrice DESC
LIMIT 5 OFFSET 5;


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

/*E. Find all employees who do not manage any other employees. */

SELECT e1.employeeNumber, e1.firstName, e1.lastName
FROM employees e1
LEFT JOIN employees e2 ON e1.employeeNumber = e2.reportsTo
WHERE e2.employeeNumber IS NULL;
    
    
/*F. Retrieve a list of all orders along with the product names. Include orders even if the products are not
currently available. */

SELECT o.orderNumber, o.orderDate, p.productName
FROM orders o
LEFT JOIN orderdetails od ON o.orderNumber = od.orderNumber
LEFT JOIN products p ON od.productCode = p.productCode
ORDER BY o.orderNumber;

/* G. Find the names of customers who have never placed an order.*/

SELECT c.customerNumber, c.customerName
FROM customers c
WHERE c.customerNumber NOT IN (
    SELECT o.customerNumber FROM orders o
);

/*H. List all possible combinations of products and offices, regardless of whether a product is available in
an office. */
SELECT p.productName, o.city
FROM products p, offices o;

/* I. Find the total sales per employee and list the top 3 employees by total sales using Common Table
Expressions */


/* J. List the total quantity ordered for each product. */

SELECT p.productCode, p.productName, SUM(od.quantityOrdered) AS totalQuantityOrdered
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productCode, p.productName
ORDER BY totalQuantityOrdered DESC;

/* K. Find products that have been ordered more than 1000 times in total. */

SELECT p.productCode, p.productName
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productCode
HAVING SUM(od.quantityOrdered) > 1000;

/*L. Retrieve the list of customers ordered by their credit limit in descending order*/

SELECT customerName
FROM customers
ORDER BY creditLimit DESC;

/*M. List all distinct cities where either an office or a customer is located*/

SELECT DISTINCT city
FROM (
    SELECT city FROM offices
    UNION
    SELECT city FROM customers
) AS cities;

/*N. Find cities where both an office and a customer are located.*/

SELECT o.city
FROM offices o
JOIN customers c ON o.city = c.city;

/*O. List all customers who have placed at least one order.*/

SELECT DISTINCT c.customerNumber, c.customerName
FROM customers c
INNER JOIN orders o ON c.customerNumber = o.customerNumber;

/*P. Retrieve a list of orders along with the names of the products ordered. */

SELECT o.orderNumber, o.orderDate, p.productName
FROM orders o
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode
ORDER BY o.orderNumber;

/* Q. List all products and their corresponding orders, including those that have not been ordered. */

SELECT p.productCode, p.productName, IFNULL(o.orderNumber, 'No Order') AS orderNumber
FROM products p
LEFT JOIN orderdetails od ON p.productCode = od.productCode
LEFT JOIN orders o ON od.orderNumber = o.orderNumber;

/* R. Retrieve all orders and the corresponding products, including orders with no matching products.*/

SELECT o.orderNumber, IFNULL(p.productName, 'No Product') AS productName
FROM orders o
LEFT JOIN orderdetails od ON o.orderNumber = od.orderNumber
LEFT JOIN products p ON od.productCode = p.productCode;

/* S. List all possible combinations of product lines and offices. */

SELECT pl.productLine, o.city
FROM productlines pl
CROSS JOIN offices o;

/*T. Create a Common Table Expression to find the average sales amount per customer, and then list
customers who have spent more than twice the average. */ 

