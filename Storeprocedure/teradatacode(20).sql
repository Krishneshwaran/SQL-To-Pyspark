CREATE PROCEDURE Get_Average_Salary_After_Date (IN hire_date_param DATE)
BEGIN
    DECLARE avg_salary DECIMAL(10, 2);

    SELECT AVG(Salary) INTO avg_salary
    FROM Employees
    WHERE Hire_Date > hire_date_param;

    -- Display the average salary
    CALL Display_Average_Salary(avg_salary);
END;

-- Procedure to display the average salary
CREATE PROCEDURE Display_Average_Salary (IN avg_salary DECIMAL(10, 2))
BEGIN
    -- This will display the average salary as an output
    -- Note: Adjust your output method according to your requirements
    SELECT 'Average Salary: ' || avg_salary AS Result;
END;
