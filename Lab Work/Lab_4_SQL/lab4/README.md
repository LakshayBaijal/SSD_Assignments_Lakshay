Lab 4 SSD
Lakshay Baijal 2024202006

SQL Stored Procedures and Cursors - Lab 4


Question 1 - Adding a Add Show:
This script will create a stored procedure to add a new show to the Shows table.
Parameters:
Procedure_ShowID INT: The unique identifier for the show.
Procedure_Title VARCHAR(100): The title of the show.
Procedure_Genre VARCHAR(50): The genre of the show.
Procedure_ReleaseYear INT: The year the show was released.
Logic:
The procedure inserts the provided values into the Shows table.
If a show with the same ShowID already exists, the procedure will fail due to the primary key constraint.

Question 2 - Retrieve All Users:
Purpose: This procedure retrieves all records from the Subscribers table.
Logic:
A simple SELECT statement is used to fetch all rows from the Subscribers table.


Question 3 - Cumulative Watch Time:
This script will create a stored procedure to calculate and display the cumulative watch time for each subscriber.
Purpose: This procedure calculates and returns the total watch time for each subscriber.
Logic:
The procedure uses a GROUP BY clause on SubscriberID to aggregate the watch time.
The result displays the SubscriberID, SubscriberName, and the total WatchTime.

Question 4 - Retrieve All Users Using a Cursor:
This script will create a stored procedure that uses a cursor to retrieve and display all subscribers.
Purpose: This procedure retrieves all subscribers using a cursor and inserts the results into a temporary table.
Logic:
A cursor is declared to select all data from the Subscribers table.
The procedure loops through each row, inserting the data into a temporary table.
After processing all rows, the temporary table is selected to display the data, and then it is dropped.

Question 5 - Update Subscribers with/without Cursor:

These scripts will create stored procedures to update the AGE column in the Subscribers table using both cursor and non-cursor methods.

Q5a 
Purpose: 
This procedure updates the AGE column in the Subscribers table without using a cursor.
Logic:
The AGE column is updated using a single UPDATE statement that applies to all rows.

Q5b
Purpose: 
This procedure updates the AGE column in the Subscribers table using a cursor.
Logic:
A cursor is used to iterate over each subscriber, calculating and updating the AGE based on the SubscriptionDate.
