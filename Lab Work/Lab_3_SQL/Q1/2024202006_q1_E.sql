use classicmodels;

/*E. Find all employees who do not manage any other employees. */

SELECT e1.employeeNumber, e1.firstName, e1.lastName
FROM employees e1
LEFT JOIN employees e2 ON e1.employeeNumber = e2.reportsTo
WHERE e2.employeeNumber IS NULL;
    