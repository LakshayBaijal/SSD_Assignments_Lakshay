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

