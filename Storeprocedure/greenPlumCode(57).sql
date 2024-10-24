CREATE OR REPLACE FUNCTION get_it_employees()
RETURNS TABLE (
    EmployeeID INT,
    FirstName VARCHAR,
    LastName VARCHAR,
    FullName VARCHAR,
    Email VARCHAR,
    PhoneNumber VARCHAR,
    Department VARCHAR,
    Position VARCHAR,
    Salary DECIMAL(10, 2),
    HireDate DATE,
    City VARCHAR
)
AS
$$
BEGIN
    -- Select all IT employees with a FullName column
    RETURN QUERY
    SELECT 
        EmployeeID,
        FirstName,
        LastName,
        FirstName || ' ' || LastName AS FullName,
        Email,
        PhoneNumber,
        Department,
        Position,
        Salary,
        HireDate,
        City
    FROM employees
    WHERE Department = 'IT';

    -- Select IT employees with salary > 90000 in Washington
    RETURN QUERY
    SELECT 
        EmployeeID,
        FirstName,
        LastName,
        FirstName || ' ' || LastName AS FullName,
        Email,
        PhoneNumber,
        Department,
        Position,
        Salary,
        HireDate,
        City
    FROM employees
    WHERE Department = 'IT'
    AND Salary > 90000
    AND City = 'Washington';
END;
$$ LANGUAGE plpgsql;