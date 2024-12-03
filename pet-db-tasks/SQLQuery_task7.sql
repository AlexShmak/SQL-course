USE pet_db;
GO

/*
CREATE VIEW Dogs AS 
SELECT
	Pet.Nick, 
	Pet.Breed, 
	Pet.Age, 
	Person.Last_Name, 
	Person.First_Name 
FROM 
	Pet 
JOIN 
	Owner ON Pet.Owner_ID = Owner.Owner_ID 
JOIN 
	Person ON Person.Person_ID = Owner.Person_ID;
*/
SELECT Dogs.Nick, Dogs.Last_name FROM Dogs WHERE Dogs.Breed = 'poodle';

/*
CREATE VIEW employeeRating AS
SELECT 
    Person.Last_Name, 
    Person.First_Name, 
    COUNT(Done_Orders.Order_ID) AS CNT, 
    AVG(CAST(Done_Orders.Mark AS FLOAT)) AS Avg_Mark
FROM 
    Person
JOIN 
    Employee ON Person.Person_ID = Employee.Person_ID
JOIN 
    (SELECT * FROM Order1 WHERE Order1.Is_Done = 1) AS Done_Orders 
    ON Done_Orders.Employee_ID = Employee.Employee_ID
GROUP BY 
    Person.Last_Name, Person.First_Name;
*/
SELECT * FROM employeeRating ORDER BY Avg_Mark DESC;

/*
CREATE VIEW customers AS 
SELECT 
	Person.Last_Name,
	Person.First_Name,
	Person.Phone,
	Person.Address
FROM 
	Owner
JOIN 
	Person ON Person.Person_ID = Owner.Person_ID;
*/

--UPDATE customers SET Address = '?' WHERE Address = '';

SELECT * FROM customers;

