
/* Q1)Write a stored procedure for adding a new show to the database*/

DELIMITER $$

Create Procedure Question_1(
    IN Procedure_ShowID INT, 
    IN Procedure_Title VARCHAR(100), 
    IN Procedure_Genre VARCHAR(50), 
    IN Procedure_ReleaseYear INT
)
BEGIN
    INSERT INTO Shows (ShowID, Title, Genre, ReleaseYear)
    VALUES (Procedure_ShowID, Procedure_Title, Procedure_Genre, Procedure_ReleaseYear);
END $$

DELIMITER ;

Call Question_1(8,"Lakshay Baijal","Real Life",2024);

/* Q2 Write a stored procedure to retrieve all the users */



DELIMITER $$

Create Procedure Question_2()
Begin 
	Select * from Subscribers;
END $$

DELIMITER ;

Call Question_2;


/* Q3 Write a stored procedure to show cumulative watch time of each user */

DELIMITER $$

CREATE PROCEDURE Question_3()
BEGIN
    -- Query to compute the cumulative watch time for each subscriber
    SELECT sub.SubscriberName AS Subscriber, SUM(watch.WatchTime) AS TotalWatchTime
    FROM Subscribers sub
    JOIN WatchHistory watch ON sub.SubscriberID = watch.SubscriberID
    GROUP BY sub.SubscriberName;
END $$

DELIMITER ;
Call Question_3;





/* Q4 Write a stored procedure to retrieve all the users using a cursor */

DELIMITER $$

CREATE PROCEDURE Question_4()
BEGIN
    DECLARE v_subID INT;
    DECLARE v_exitLoop INT DEFAULT 0;
    DECLARE v_subscriberName VARCHAR(100); 
    DECLARE v_subscriptionDate DATE;

    DECLARE subscriberCursor CURSOR FOR 
    SELECT SubscriberID, SubscriberName, SubscriptionDate FROM Subscribers;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_exitLoop = 1;
    
    CREATE TEMPORARY TABLE IF NOT EXISTS temp (
        id INT,
        name VARCHAR(100),
        subscription_date DATE
    );
    
    OPEN subscriberCursor;

    fetchLoop: LOOP
        FETCH subscriberCursor INTO v_subID, v_subscriberName, v_subscriptionDate;
        
        IF v_exitLoop = 1 THEN LEAVE fetchLoop;
        END IF;
        
        INSERT INTO temp(id, name, subscription_date) 
        VALUES (v_subID, v_subscriberName, v_subscriptionDate);
    END LOOP;
    
    SELECT * FROM temp;
    
    CLOSE subscriberCursor;

END $$

DELIMITER ;


Call Question_4();



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
