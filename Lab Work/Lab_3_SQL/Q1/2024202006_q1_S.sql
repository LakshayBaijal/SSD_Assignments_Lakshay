use classicmodels;

/* S. List all possible combinations of product lines and offices. */

SELECT pl.productLine, o.city
FROM productlines pl
CROSS JOIN offices o;
