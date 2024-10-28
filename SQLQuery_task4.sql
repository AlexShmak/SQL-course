USE pet_db;

-- 1
SELECT Pet.Nick, Pet_Type.Name FROM Pet JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID AND Pet.Nick = 'Partizan';
-- 1 (using FROM)
SELECT Pet.Nick, Pet_Type.Name FROM Pet, Pet_Type WHERE Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID AND Pet.Nick = 'Partizan';
-- 2
SELECT Pet.Nick, Pet.Breed, Pet.Age FROM Pet JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID AND Pet_Type.Name = 'DOG';
-- 3
SELECT AVG(convert(decimal, Pet.Age)) AS Cats_Avg_Age FROM Pet JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID AND Pet_Type.Name = 'CAT';
-- 4
SELECT Order1.Time_Order, Person.Last_Name FROM Order1	JOIN Employee ON Order1.Employee_ID = Employee.Employee_ID AND Order1.Is_Done = 0 
														JOIN Person ON Employee.Person_ID = Person.Person_ID;
-- 5
SELECT Person.First_Name, Person.Last_Name, Person.Phone FROM Person	JOIN Owner ON Person.Person_ID = Owner.Person_ID 
																		JOIN Pet ON Owner.Owner_ID = Pet.Owner_ID 
																		JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID AND Pet_Type.Name = 'DOG';
-- 6
SELECT Pet_Type.Name, Pet.Nick FROM Pet RIGHT JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID;
-- 7
SELECT Pet.Age, Pet_Type.Name, COUNT(*) AS Count FROM Pet JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID GROUP BY Age, Name ORDER BY Age ASC;
-- 8
SELECT Person.Last_Name, COUNT(Order1.Is_Done) AS Count_Of_Orders FROM Order1	JOIN Employee ON Order1.Employee_ID = Employee.Employee_ID AND Order1.Is_Done = 1
																				JOIN Person ON Employee.Person_ID = Person.Person_ID
																				GROUP BY Last_Name
																				HAVING COUNT(Order1.Is_Done) > 3;
-- 9: Питомцы, у которых есть прививки. Вывести имя питомца, вид питомца, название прививки
SELECT Pet.Nick, Pet_Type.Name, Vaccine_Type.Name FROM Vaccine	JOIN Pet ON Vaccine.Pet_ID = Pet.Pet_ID 
																JOIN Vaccine_Type ON Vaccine.Vaccine_Type_ID = Vaccine_Type.Vaccine_Type_ID 
																JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID;

