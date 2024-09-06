/* Q2 Write a stored procedure to retrieve all the users */



DELIMITER $$

Create Procedure Question_2()
Begin 
	Select * from Subscribers;
END $$

DELIMITER ;

Call Question_2;
