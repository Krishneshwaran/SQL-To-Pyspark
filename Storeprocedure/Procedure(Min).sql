
DELIMITER $$

CREATE OR REPLACE PROCEDURE list_it_employees()
RETURNS TABLE (
    EmployeeID INT,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Department VARCHAR(255),
    Position VARCHAR(255)
)
LANGUAGE NZPLSQL
AS
BEGIN
    -- Return all employees from the IT department
    RETURN QUERY
    SELECT EmployeeID, FirstName, LastName, Department, Position
    FROM employees
    WHERE Department = 'IT';
END;


DELIMITER ;


