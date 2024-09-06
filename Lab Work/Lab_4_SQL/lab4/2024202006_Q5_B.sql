
/* 5b) Add a new ‘AGE’ column to the table ‘Subscriber’. Write a stored procedure to update all the
users b) with cursor */

DELIMITER //

CREATE PROCEDURE Question_5_B()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE subID INT;
    DECLARE cur CURSOR FOR SELECT SubscriberID FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
       
    read_loop: LOOP
        FETCH cur INTO subID;
        IF done THEN
            LEAVE read_loop;
        END IF;
        UPDATE Subscribers 
        SET Age = FLOOR(DATEDIFF(CURDATE(), SubscriptionDate) / 365)
        WHERE SubscriberID = subID;
    END LOOP;

    CLOSE cur;
END //

DELIMITER ;

CALL Question_5_B();
