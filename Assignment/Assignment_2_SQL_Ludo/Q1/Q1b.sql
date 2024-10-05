/*
	Q1 B. Create a table called “PersonJoining” with columns {PJoinPK, EmpIDFK, FirstName,
LastName, DateofBirth, Age, DateofJoining, DayofJoining, MonthofJoining,
YearofJoining, WorkExpinDays} with respective reasonable datatypes. Populate
DayofJoining, MonthofJoining, YearofJoining, WorkExp columns using your stored
procedure with employee information. Re-running the stored procedure should delete
the data from existing PersonJoining table and should repopulate the PersonJoining
table. (10 Marks)
Example: If Sai Anirudh’s DateofJoining is 10-10-2011, then DayofJoining is 10,
MonthofJoining is October, YearofJoining is 2011 and WorkExp is 3945 days.
*/



DROP PROCEDURE IF EXISTS UpdatePersonJoining;

DELIMITER $$

CREATE PROCEDURE UpdatePersonJoining()
BEGIN
    DROP TABLE IF EXISTS PersonJoining;
    CREATE TABLE PersonJoining (
        PJoinPK INT AUTO_INCREMENT PRIMARY KEY,
        EmpIDFK INT,
        FirstName TEXT,
        LastName TEXT,
        DateofBirth DATE,
        DateofJoining DATE,
        DayofJoining INT,
        MonthofJoining TEXT,
        YearofJoining INT,
        WorkExpinDays INT,
        WorkExp INT 
    );

    INSERT INTO PersonJoining (EmpIDFK, FirstName, LastName, DateofBirth, DateofJoining, 
                               DayofJoining, MonthofJoining, YearofJoining, WorkExpinDays, WorkExp)
    SELECT p.ID, p.FirstName, p.LastName, 
           STR_TO_DATE(p.DateofBirth, '%m/%d/%Y') AS DateofBirth,  
           STR_TO_DATE(p.DateofJoining, '%m/%d/%Y') AS DateofJoining, 
           DAY(STR_TO_DATE(p.DateofJoining, '%m/%d/%Y')) AS DayofJoining, 
           MONTHNAME(STR_TO_DATE(p.DateofJoining, '%m/%d/%Y')) AS MonthofJoining, 
           YEAR(STR_TO_DATE(p.DateofJoining, '%m/%d/%Y')) AS YearofJoining, 
           DATEDIFF(CURDATE(), STR_TO_DATE(p.DateofJoining, '%m/%d/%Y')) AS WorkExpinDays, 
           TIMESTAMPDIFF(YEAR, STR_TO_DATE(p.DateofBirth, '%m/%d/%Y'), CURDATE()) AS WorkExp 
    FROM Person p;

END $$

DELIMITER ;

CALL UpdatePersonJoining();
Select * from PersonJoining;


