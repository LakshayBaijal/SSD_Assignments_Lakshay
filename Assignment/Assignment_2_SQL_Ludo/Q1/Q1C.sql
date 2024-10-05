/*
Q1 C
Create a table called “PersonTransfer” with columns {PTPK, EmpIDFK, FirstName,
LastName, Gender, DateofJoining, CurrentRegion, NewRegion} with respectivereasonable datatypes. Populate NewRegion column to “DC” using your stored procedure
for employees with Gender “F” whose Work Experience is more than 10 years. Populate
the NewRegion column to “Capitol” using the same stored procedure for employees with
Gender “M” whose Work Experience is more than 20 years. Re-running the stored
procedure should delete the data from existing PersonTransfer table and should
repopulate the PersonTransfer table. (10 Marks)
Example: If Sai Anirudh’s Gender is “M” and his Work Experience is more than 20 years, update
his NewRegion entry to “Capitol”.
*/
DROP PROCEDURE IF EXISTS UpdatePersonTransfer;

DELIMITER $$

CREATE PROCEDURE UpdatePersonTransfer()
BEGIN
    DROP TABLE IF EXISTS PersonTransfer;

    CREATE TABLE PersonTransfer (
        PTPK INT AUTO_INCREMENT PRIMARY KEY,
        EmpIDFK INT,
        FirstName TEXT,
        LastName TEXT,
        Gender TEXT,
        DateofJoining DATE,
        CurrentRegion TEXT,  
        NewRegion TEXT
    );

    INSERT INTO PersonTransfer (EmpIDFK, FirstName, LastName, Gender, DateofJoining, CurrentRegion, NewRegion)
    SELECT p.ID, p.FirstName, p.LastName, p.Gender, 
           STR_TO_DATE(p.DateofJoining, '%m/%d/%Y') AS DateofJoining, 
           'DefaultRegion' AS CurrentRegion, 
           CASE 
               WHEN p.Gender = 'F' AND TIMESTAMPDIFF(YEAR, STR_TO_DATE(p.DateofJoining, '%m/%d/%Y'), CURDATE()) > 10 
                   THEN 'DC'
               WHEN p.Gender = 'M' AND TIMESTAMPDIFF(YEAR, STR_TO_DATE(p.DateofJoining, '%m/%d/%Y'), CURDATE()) > 20 
                   THEN 'Capitol'
               ELSE NULL
           END AS NewRegion
    FROM Person p
    WHERE (p.Gender = 'F' AND TIMESTAMPDIFF(YEAR, STR_TO_DATE(p.DateofJoining, '%m/%d/%Y'), CURDATE()) > 10) 
       OR (p.Gender = 'M' AND TIMESTAMPDIFF(YEAR, STR_TO_DATE(p.DateofJoining, '%m/%d/%Y'), CURDATE()) > 20);

END $$

DELIMITER ;

CALL UpdatePersonTransfer();

SELECT * FROM PersonTransfer;