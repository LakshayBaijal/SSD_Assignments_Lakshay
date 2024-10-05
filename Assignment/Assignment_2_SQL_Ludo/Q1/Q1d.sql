/* Q1 d. By using the Person table, write a SQL query to display data in the following format. (10
Marks) */

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
