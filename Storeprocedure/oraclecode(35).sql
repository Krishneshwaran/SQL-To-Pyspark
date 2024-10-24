CREATE OR REPLACE PROCEDURE FetchEmployeesAutomatically
IS
    CURSOR emp_cursor IS
        SELECT 
            EmployeeID, 
            FirstName || ' ' || LastName AS FullName, 
            Department, 
            Position, 
            Salary, 
            HireDate
        FROM Employees
        WHERE City = 'New York'
        ORDER BY Salary DESC;
BEGIN
    -- Open the cursor and fetch employee details for New York
    FOR rec IN emp_cursor LOOP
        -- Output employee details
        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || rec.EmployeeID || 
                             ', Name: ' || rec.FullName || 
                             ', Department: ' || rec.Department || 
                             ', Position: ' || rec.Position || 
                             ', Salary: ' || rec.Salary || 
                             ', Hire Date: ' || rec.HireDate);
    END LOOP;

    -- Check if no employees found
    IF emp_cursor%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employees found in New York.');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END FetchEmployeesAutomatically;
/
