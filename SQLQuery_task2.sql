USE pet_db;

--- Create Tables

CREATE TABLE Vaccine(
    Vaccine_ID				INTEGER			NOT NULL,
    Vaccine_Type_ID			INTEGER			NOT NULL,
    Date					DATE,
	Scan_Name				VARCHAR(50),
	Pet_ID					INTEGER			NOT NULL,
CONSTRAINT Vaccine_PK PRIMARY KEY (Vaccine_ID)
)

CREATE TABLE Vaccine_Type(
    Vaccine_Type_ID			INTEGER			NOT NULL,
	Name					VARCHAR(50),
CONSTRAINT Vaccine_Type_PK PRIMARY KEY (Vaccine_Type_ID)
)

--- Add Foreign Keys

ALTER TABLE Vaccine ADD CONSTRAINT FK_Pet_ID 
    FOREIGN KEY (Pet_ID)
    REFERENCES Pet(Pet_ID)
;

ALTER TABLE Vaccine ADD CONSTRAINT FK_Vaccine_Type_ID 
    FOREIGN KEY (Vaccine_Type_ID)
    REFERENCES Vaccine_Type(Vaccine_Type_ID)
;

--- Insert Test Data

USE pet_db;

INSERT INTO Vaccine_Type(Vaccine_Type_ID, Name) 
       VALUES (1, 'first_vaccine');

INSERT INTO Vaccine_Type(Vaccine_Type_ID, Name) 
       VALUES (2, 'second_vaccine');

INSERT INTO Vaccine(Vaccine_ID, Vaccine_Type_ID, Scan_Name, Pet_ID) 
       VALUES (1,1,'first_scan',1);

INSERT INTO Vaccine(Vaccine_ID, Vaccine_Type_ID, Scan_Name, Pet_ID) 
       VALUES (2,2,'second_scan',2);