CREATE OR REPLACE PROCEDURE FetchEmployeesFromCities
IS
    -- Cursors for employees from different cities
    CURSOR city1_cursor IS
        SELECT EmployeeID, FirstName || ' ' || LastName AS FullName, Department, Position, Salary, HireDate
        FROM Employees
        WHERE City = 'New York';

    CURSOR city2_cursor IS
        SELECT EmployeeID, FirstName || ' ' || LastName AS FullName, Department, Position, Salary, HireDate
        FROM Employees
        WHERE City = 'Los Angeles';

    CURSOR city3_cursor IS
        SELECT EmployeeID, FirstName || ' ' || LastName AS FullName, Department, Position, Salary, HireDate
        FROM Employees
        WHERE City = 'Chicago';

    CURSOR city4_cursor IS
        SELECT EmployeeID, FirstName || ' ' || LastName AS FullName, Department, Position, Salary, HireDate
        FROM Employees
        WHERE City = 'Houston';
        
BEGIN
    -- Fetch employees from New York
    DBMS_OUTPUT.PUT_LINE('Employees from New York:');
    FOR rec IN city1_cursor LOOP
        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || rec.EmployeeID || 
                             ', Name: ' || rec.FullName || 
                             ', Department: ' || rec.Department || 
                             ', Position: ' || rec.Position || 
                             ', Salary: ' || rec.Salary || 
                             ', Hire Date: ' || rec.HireDate);
    END LOOP;

    IF city1_cursor%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employees found in New York.');
    END IF;

    -- Fetch employees from Los Angeles
    DBMS_OUTPUT.PUT_LINE('Employees from Los Angeles:');
    FOR rec IN city2_cursor LOOP
        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || rec.EmployeeID || 
                             ', Name: ' || rec.FullName || 
                             ', Department: ' || rec.Department || 
                             ', Position: ' || rec.Position || 
                             ', Salary: ' || rec.Salary || 
                             ', Hire Date: ' || rec.HireDate);
    END LOOP;

    IF city2_cursor%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employees found in Los Angeles.');
    END IF;

    -- Fetch employees from Chicago
    DBMS_OUTPUT.PUT_LINE('Employees from Chicago:');
    FOR rec IN city3_cursor LOOP
        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || rec.EmployeeID || 
                             ', Name: ' || rec.FullName || 
                             ', Department: ' || rec.Department || 
                             ', Position: ' || rec.Position || 
                             ', Salary: ' || rec.Salary || 
                             ', Hire Date: ' || rec.HireDate);
    END LOOP;

    IF city3_cursor%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employees found in Chicago.');
    END IF;

    -- Fetch employees from Houston
    DBMS_OUTPUT.PUT_LINE('Employees from Houston:');
    FOR rec IN city4_cursor LOOP
        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || rec.EmployeeID || 
                             ', Name: ' || rec.FullName || 
                             ', Department: ' || rec.Department || 
                             ', Position: ' || rec.Position || 
                             ', Salary: ' || rec.Salary || 
                             ', Hire Date: ' || rec.HireDate);
    END LOOP;

    IF city4_cursor%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employees found in Houston.');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END FetchEmployeesFromCities;
/
