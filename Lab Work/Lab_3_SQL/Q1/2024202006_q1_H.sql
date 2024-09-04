use classicmodels;

/*H. List all possible combinations of products and offices, regardless of whether a product is available in
an office. */
SELECT p.productName, o.city
FROM products p, offices o;
