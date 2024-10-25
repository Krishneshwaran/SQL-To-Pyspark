
DELIMITER $$

-- Create a procedure to manage employee data
CREATE PROCEDURE ManageEmployees()
BEGIN
    -- Declare variables for employee details
    DECLARE v_Employee_ID INT;
    DECLARE v_First_Name VARCHAR(50);
    DECLARE v_Last_Name VARCHAR(50);
    DECLARE v_Salary DECIMAL(10, 2);
    DECLARE v_Hire_Date DATE;

    -- Select and display all employee records
    SELECT * FROM Employees;

    -- Update salary for a specific employee
    SET v_Employee_ID = 1;  -- Example Employee_ID to update
    SET v_Salary = 52000.00;  -- New salary value
    UPDATE Employees
    SET Salary = v_Salary
    WHERE Employee_ID = v_Employee_ID;

    -- Select to confirm the update
    SELECT * FROM Employees WHERE Employee_ID = v_Employee_ID;

    -- Delete an employee record
    SET v_Employee_ID = 4;  -- Example Employee_ID to delete
    DELETE FROM Employees WHERE Employee_ID = v_Employee_ID;

    -- Select to confirm the deletion
    SELECT * FROM Employees;

    -- Aggregate data: calculate average salary
    SELECT AVG(Salary) AS Average_Salary FROM Employees;

    -- Count number of employees
    SELECT COUNT(*) AS Total_Employees FROM Employees;

    -- Display details of employees hired after a specific date
    SET v_Hire_Date = DATE '2023-01-01';  -- Example hire date
    SELECT * FROM Employees WHERE Hire_Date > v_Hire_Date;

    -- Display all employees sorted by hire date
    SELECT * FROM Employees ORDER BY Hire_Date;

    -- Log operations to a log table (assumes a log table exists)
    INSERT INTO OperationLog (Operation, Timestamp) VALUES ('ManageEmployees executed', CURRENT_TIMESTAMP);
END;

DELIMITER ;


