
/* Q5a) Add a new ‘AGE’ column to the table ‘Subscriber’. Write a stored procedure to update all the
users a) without cursor */

ALTER TABLE Subscribers ADD Age INT;

DELIMITER //

CREATE PROCEDURE Question_5_A()
BEGIN
    UPDATE Subscribers
    SET Age = FLOOR(DATEDIFF(CURDATE(), SubscriptionDate) / 365);
END //

DELIMITER ;
SET SQL_SAFE_UPDATES = 0;

CALL Question_5_A();

SET SQL_SAFE_UPDATES = 1;
	
Select * from Subscribers;
