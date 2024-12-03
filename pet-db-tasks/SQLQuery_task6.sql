USE pet_db;

-- UPDATE Order1 SET Comments = CONCAT('(S)',Order1.Comments) WHERE Order1.Employee_ID IN (SELECT Employee_ID FROM Employee WHERE Employee.Spec = 'student');
SELECT * FROM Order1 JOIN Employee ON Order1.Employee_ID = Employee.Employee_ID AND Employee.Spec = 'student';

-- DELETE FROM Order1 WHERE Order1.Service_ID IN (SELECT Service_ID FROM Service WHERE Service.Name = 'combing') AND Order1.Is_Done = 0;
SELECT * FROM Order1 JOIN Service ON Order1.Service_ID = Service.Service_ID AND Service.Name = 'combing';

-- INSERT INTO Person (Person_ID, Last_Name, First_Name, Phone, Address) SELECT MAX(Person.Person_ID) + 1, 'Shmakov', 'Aleksandr', '88005553535', 'Tut' FROM Person;
SELECT * FROM Person;

--CREATE TABLE Document (
--  Document_ID		INTEGER ,
--  Person_ID			INTEGER NOT NULL,
--  Document_Type		VARCHAR(50) NOT NULL,
--  Document_Number	VARCHAR(50) NOT NULL,
-- CONSTRAINT Document_PK PRIMARY KEY (Document_ID)
--);

--ALTER TABLE Document
--ADD CONSTRAINT FK_Document_Person FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID) ON UPDATE CASCADE ON DELETE CASCADE;
INSERT INTO Document (Person_ID, Document_Type, Document_Number) VALUES (11, 'doc1', '001')
INSERT INTO Document (Person_ID, Document_Type, Document_Number) VALUES (11, 'doc2', '002')

SELECT * FROM Document;

--UPDATE Person SET Person.Person_ID = Person.Person_ID + 1 WHERE Person.First_Name = 'Aleksandr'
SELECT * FROM Person WHERE Person.First_Name = 'Aleksandr';

--DELETE FROM Person WHERE Person.First_Name = 'Aleksandr';
SELECT * FROM Person;