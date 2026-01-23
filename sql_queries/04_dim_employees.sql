SELECT
    EmployeeID,
    FirstName + ' ' + LastName AS EmployeeName,
    Title,
    City,
    Country
FROM Employees;
