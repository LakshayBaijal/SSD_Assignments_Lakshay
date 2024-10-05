use Lakshay_Assignment1;

-- Q1a

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



-- Q1 b

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


-- Q1 C

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


-- Q1 D

DROP PROCEDURE IF EXISTS GenerateEmployeeRegionReport;

DELIMITER $$

CREATE PROCEDURE GenerateEmployeeRegionReport()
BEGIN
    SELECT 
        p.Region AS EmployeeRegion,  -- Selecting region from empdetails
        SUM(CASE 
            WHEN TIME(STR_TO_DATE(p.TimeOfBirth, '%h:%i:%s %p')) BETWEEN '00:00:00' AND '09:00:00' THEN 1 ELSE 0 
        END) AS No_Of_Employees_Born_Between_00_09,
        SUM(CASE 
            WHEN TIME(STR_TO_DATE(p.TimeOfBirth, '%h:%i:%s %p')) BETWEEN '09:01:00' AND '16:00:00' THEN 1 ELSE 0 
        END) AS No_Of_Employees_Born_Between_09_16,
        SUM(CASE 
            WHEN TIME(STR_TO_DATE(p.TimeOfBirth, '%h:%i:%s %p')) > '16:01:00' AND TIME(STR_TO_DATE(p.TimeOfBirth, '%h:%i:%s %p')) <= '22:59:00' THEN 1 ELSE 0 
        END) AS No_Of_Employees_Born_After_16
    FROM 
        Person p
    GROUP BY 
        p.Region;
END $$

DELIMITER ;

CALL GenerateEmployeeRegionReport();
