Lab 3 SSD
Lakshay Baijal 2024202006

SQL Queries and Commands


Joining and Aggregating Data:

For queries involving sales data and employee performance (e.g., top employees by sales or total sales per employee), you’ll join tables like employees, orders, orderdetails, and products. Use aggregate functions like SUM() to calculate totals and GROUP BY to summarize data by employees or products.

Filtering and Ranking:

For ranking queries most expensive products or top employees, you will sort data using ORDER BY and apply limits using LIMIT or OFFSET to skip and select specific ranges.

Combining Data:
To find unique or combined data (e.g., customers with orders or payments, all product and office combinations), use UNION to merge datasets and JOIN operations to link related tables. Cross joins can generate all possible combinations between tables.

Handling Missing Data:
Use LEFT JOIN to include all entries from one table and match them with another table, even if there is no corresponding data (e.g., orders with products, including those not currently available).

Finding Unique Entries:

To retrieve distinct cities or customers who have not placed orders, use DISTINCT or subqueries to filter out unwanted results and ensure uniqueness.

