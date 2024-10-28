USE pet_db;

-- 1
SELECT Mark FROM Order1 WHERE Is_Done = 1 AND Employee_ID IN (SELECT Employee_ID FROM Employee WHERE Spec = 'student');
-- 2
SELECT Last_Name FROM Person, Employee WHERE Person.Person_ID = Employee.Person_ID AND Employee_ID NOT IN (SELECT Employee_ID FROM Order1);
-- 3 
SELECT Service.Name AS Service_Name, Order1.Time_Order, p1.Last_Name AS Employee_Lst_Name, Pet.Nick, p2.Last_Name AS Owner_Last_Name 
FROM Order1 
	JOIN Service ON Order1.Service_ID = Service.Service_ID 
	JOIN Employee ON Order1.Employee_ID = Employee.Employee_ID 
	JOIN Person as p1 ON Employee.Person_ID = p1.Person_ID
	JOIN Owner ON Order1.Owner_ID = Owner.Owner_ID
	JOIN Person as p2 ON Owner.Person_ID = p2.Person_ID 
	JOIN Pet ON Order1.Pet_ID = Pet.Pet_ID
-- 4
SELECT
	Order1.Comments FROM Order1 
WHERE Comments IS NOT NULL AND Comments != ''
UNION
SELECT 
	Pet.Description FROM Pet
WHERE Description IS NOT NULL AND Description != ''
UNION
SELECT 
	Owner.Description FROM Owner
WHERE Description IS NOT NULL AND Description != '';
-- 5
SELECT 
	temp.First_Name, temp.Last_Name
FROM 
	(SELECT * FROM Person WHERE Person_ID IN 
		(SELECT Person_ID FROM Employee WHERE Employee_ID IN 
			(SELECT Employee_ID FROM Order1 WHERE EXISTS 
				( SELECT * FROM Order1 WHERE Employee.Employee_ID = Order1.Employee_ID AND Mark = 4)))) temp;
-- 6
SELECT 
	temp.First_Name, temp.Last_Name
FROM 
	(SELECT * FROM Person WHERE Person_ID IN 
		(SELECT Person_ID FROM Employee WHERE Employee_ID IN 
			(SELECT Employee_ID FROM Order1 WHERE Employee.Employee_ID = Order1.Employee_ID))) temp
WHERE
	4 = ANY(SELECT Mark FROM Order1 WHERE Order1.Employee_ID IN 
		(SELECT Employee_ID FROM Employee WHERE Employee.Person_ID = temp.Person_ID));
