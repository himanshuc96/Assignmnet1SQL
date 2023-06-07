--Q1  Create two tables: EmployeeDetails and EmployeeSalary.

       --Create EmployeeDetails table

CREATE TABLE EmployeeDetails (EmpId INT PRIMARY KEY, FullName VARCHAR(255), ManagerId INT, DateOfJoining DATE, City VARCHAR(255));

       -- Create EmployeeSalary table

CREATE TABLE EmployeeSalary (EmpId INT, Project VARCHAR(255), Salary DECIMAL(10,2), Variable DECIMAL(10,2), FOREIGN KEY (EmpId) REFERENCES EmployeeDetails(EmpId));

--Q2 SQL Query to fetch records that are present in one table but not in another table.

SELECT EmployeeDetails.* FROM EmployeeDetails LEFT JOIN EmployeeSalary ON EmployeeDetails.EmpId = EmployeeSalary.EmpId WHERE EmployeeSalary.EmpId IS NULL;

--Q3 SQL query to fetch all the employees who are not working on any project.

SELECT EmployeeDetails.* FROM EmployeeDetails LEFT JOIN EmployeeSalary ON EmployeeDetails.EmpId = EmployeeSalary.EmpId WHERE EmployeeSalary.Project IS NULL;

--Q4 SQL query to fetch all the Employees from EmployeeDetails who joined in the Year 2020.

SELECT * FROM EmployeeDetails WHERE YEAR(DateOfJoining) = 2020;

--Q5 Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary.

SELECT EmployeeDetails.* FROM EmployeeDetails INNER JOIN EmployeeSalary ON EmployeeDetails.EmpId = EmployeeSalary.EmpId;

--Q6 Write an SQL query to fetch a project-wise count of employees.

SELECT Project, COUNT(*) AS EmployeeCount FROM EmployeeSalary GROUP BY Project;

--Q7 Fetch employee names and salaries even if the salary value is not present for the employee.

SELECT FullName, (SELECT Salary FROM EmployeeSalary WHERE EmployeeSalary.EmpId = EmployeeDetails.EmpId) AS Salary FROM EmployeeDetails;

--Q8 Write an SQL query to fetch all the Employees who are also managers.

SELECT * FROM EmployeeDetails WHERE EmpId IN (SELECT ManagerId FROM EmployeeDetails);

--Q9 Write an SQL query to fetch duplicate records from EmployeeDetails.

SELECT EmpId, COUNT(*) AS DuplicateCount FROM EmployeeDetails GROUP BY EmpId HAVING COUNT(*) > 1;

--Q10 Write an SQL query to fetch only odd rows from the table.

SELECT * FROM EmployeeDetails WHERE EmpId % 2 = 1;

--Q11 Write a query to find the 3rd highest salary from a table without top or limit keyword.

SELECT MAX(Salary) AS ThirdHighestSalary FROM EmployeeSalary WHERE Salary < (SELECT MAX(Salary) FROM EmployeeSalary)