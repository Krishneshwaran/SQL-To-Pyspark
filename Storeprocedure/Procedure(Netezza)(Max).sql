
DELIMITER $$

CREATE OR REPLACE PROCEDURE update_bonus_and_list_employees()
RETURNS TABLE (
    EmployeeID INT,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Position VARCHAR(255),
    Salary DECIMAL(10,2),
    Bonus DOUBLE
)
LANGUAGE NZPLSQL
AS
BEGIN
    -- Update bonus for employees based on position and salary
    -- Higher positions receive larger bonuses
    
    -- Update for Developers
    UPDATE employees
    SET Bonus = Salary * 0.10  -- 10% bonus for Developers
    WHERE Position = 'Developer'
    AND Salary > 50000;

    -- Update for Managers
    UPDATE employees
    SET Bonus = Salary * 0.15  -- 15% bonus for Managers
    WHERE Position = 'Manager'
    AND Salary > 70000;

    -- Update for Analysts
    UPDATE employees
    SET Bonus = Salary * 0.08  -- 8% bonus for Analysts
    WHERE Position = 'Analyst'
    AND Salary > 40000;

    -- After bonus update, return a list of all employees with updated bonuses
    RETURN QUERY
    SELECT 
        EmployeeID, FirstName, LastName, Position, Salary, Bonus
    FROM 
        employees
    WHERE 
        Bonus > 0
    ORDER BY 
        Salary DESC;
    
    -- Note: If necessary, add more conditional logic for other positions
    -- or update criteria as needed. This example uses basic positions
    -- and applies a percentage-based bonus depending on the employee's salary.

END;

DELIMITER ;


