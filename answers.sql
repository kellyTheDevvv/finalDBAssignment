CREATE DATABASE clinic; -- Create a database named clinic

USE clinic;

-- Create tables for the clinic database
CREATE TABLE patients(  -- Create a table named patients
PatientID INT PRIMARY KEY, -- Unique identifier for each patient
FirstName VARCHAR(20) NOT NULL,
LastName VARCHAR(20) NOT NULL,
DateOfBirth DATE NOT NULL,
Gender VARCHAR(1) NOT NULL,
Telephone INT NOT NULL UNIQUE -- Unique telephone number for each patient
);

CREATE TABLE doctors( -- Create a table named doctors
DoctorID INT PRIMARY KEY, -- Unique identifier for each doctor
FirstName VARCHAR(20) NOT NULL,
LastName VARCHAR(20) NOT NULL,
Speciality VARCHAR(50) NOT NULL,
Telephone INT NOT NULL UNIQUE, -- Unique telephone number for each doctor
RoomNumber INT NOT NULL
);

CREATE TABLE appointments( -- Create a table named appointments
AppointmentID INT PRIMARY KEY, -- Unique identifier for each appointment
AppointmentDate DATE NOT NULL,
AppointmentTime TIME NOT NULL UNIQUE, -- Unique appointment time
Status VARCHAR(20) NOT NULL, 
PatientID INT,
DoctorID INT,
FOREIGN KEY(PatientID) REFERENCES patients(PatientID), -- Foreign key referencing PatientID in patients table
FOREIGN KEY(DoctorID) REFERENCES doctors(DoctorID) -- Foreign key referencing DoctorID in doctors table
);

CREATE TABLE payments( -- Create a table named payments
PaymentID INT PRIMARY KEY, -- Unique identifier for each payment
Amount INT NOT NULL,
PaymentDate DATE NOT NULL,
PaymentMethod VARCHAR(20) NOT NULL,
PatientID INT,
AppointmentID INT,
FOREIGN KEY(PatientID) REFERENCES patients(PatientID), -- Foreign key referencing PatientID in patients table
FOREIGN KEY(AppointmentID) REFERENCES appointments(AppointmentID) -- Foreign key referencing AppointmentID in appointments table
);

-- Insert data into the clinic database
INSERT INTO patients(PatientID,FirstName,LastName,YearOfBirth,Gender,Telephone)
VALUES(1,'Mike','Njoroge',1975,'M',0726368333),
(2,'Kayla','Njeri',1970,'F',0739366931),
(3,'Griffin','Majanga',1966,'M',0746328733),
(4,'Glen','Omuko',1993,'M',0143368333),
(5,'Ann','Anyango',1980,'F',0799368569),
(6,'Mitchell','Kana',1979,'F',0701367863);

INSERT INTO doctors(DoctorID,FirstName,LastName,Speciality,Telephone,RoomNumber) -- Insert data into the doctors table
VALUES(10,'Benson','Onyango','Cardiologist',0720803517,1),
(11,'Mark','Jimson','Psychiatrist',0710626813,2),
(12,'Dawn','Akinyi','Radiologist',0729433589,3);

INSERT INTO appointments(AppointmentID,AppointmentDate,AppointmentTime,Status,PatientID,DoctorID) -- Insert data into the appointments table
VALUES(20,'2025-05-13','08:00:00','Completed',1,11),
(21,'2025-05-14','09:00:00','Scheduled',2,10),
(22,'2025-05-14','14:00:00','Cancelled',3,11),
(23,'2025-05-15','08:00:00','Scheduled',4,12),
(24,'2025-05-16','14:00:00','Scheduled',5,10),
(25,'2025-05-17','08:00:00','Scheduled',6,11);

INSERT INTO payments(PaymentID,Amount,PaymentDate,PaymentMethod,PatientID,AppointmentID) -- Insert data into the payments table
VALUES(30,1000,'2025-05-12','Mpesa',1,20),
(31,1500,'2025-05-13','Cash',2,21),
(32,1000,'2025-05-14','Mpesa',3,22),
(33,1200,'2025-05-14','Credit Card',4,23),
(34,1500,'2025-05-15','Mpesa',5,24),
(35,1000,'2025-05-16','Cash',6,25);







