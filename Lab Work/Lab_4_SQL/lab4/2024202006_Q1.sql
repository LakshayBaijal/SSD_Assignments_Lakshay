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
