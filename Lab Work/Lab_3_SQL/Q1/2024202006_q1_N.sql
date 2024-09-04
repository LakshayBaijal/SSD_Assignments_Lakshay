use classicmodels;

/*N. Find cities where both an office and a customer are located.*/

SELECT o.city
FROM offices o
JOIN customers c ON o.city = c.city;