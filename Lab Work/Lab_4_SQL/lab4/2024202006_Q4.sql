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

