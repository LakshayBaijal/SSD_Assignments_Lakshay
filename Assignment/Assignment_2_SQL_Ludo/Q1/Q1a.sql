/*
	Q1 A. Create a table called “hike2024” with columns {HikePK, EmpIDFK, FirstName,
LastName, Gender, WeightInKg, LastHike, LastSalary, NewHike, NewSalary} with
respective reasonable datatypes. Populate NewHike, NewSalary columns using your
stored procedure with employee information whose weight is less than 55kg only.
NewHike column should be populated with 12% increase to LastHike and recalculate the
NewSalary using LastSalary column based on the hike percentage. Re-running the
stored procedure should delete the data from existing hike2024 table and should
repopulate the hike2024 table
*/


DROP PROCEDURE IF EXISTS updateHike2024;

DELIMITER $$

CREATE PROCEDURE updateHike2024()
BEGIN
    DROP TABLE IF EXISTS hike2024;

    CREATE TABLE hike2024(
        HikePK INT AUTO_INCREMENT PRIMARY KEY,
        EmpIDFK INT,
        FirstName TEXT,
        LastName TEXT,
        Gender TEXT,
        Weight INT,
        LastHike INT,
        LastSalary INT,
        NewHike INT,
        NewSalary INT
    );

    INSERT INTO hike2024 (EmpIDFK, FirstName, LastName, Gender, Weight, LastHike, LastSalary, NewHike, NewSalary)
    SELECT p.ID, p.FirstName, p.LastName, p.Gender, p.weight, p.LastHike, p.Salary, 
           p.LastHike + 12 AS NewHike,
           p.Salary * (1 + (p.LastHike + 12) / 100) AS NewSalary
    FROM Person p
    WHERE p.weight < 55;

END $$

DELIMITER ;

CALL updateHike2024();
Select * from hike2024;

