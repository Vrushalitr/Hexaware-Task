create database hospitaldb;
use hospitaldb;
CREATE TABLE Patient (
    patientId INT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    dateOfBirth DATE,
    gender VARCHAR(10),
    contactNumber VARCHAR(15),
    address TEXT
);

CREATE TABLE Doctor (
    doctorId INT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    specialization VARCHAR(50),
    contactNumber VARCHAR(15)
);

CREATE TABLE Appointment (
    appointmentId INT PRIMARY KEY,
    patientId INT,
    doctorId INT,
    appointmentDate DATE,
    description TEXT,
    FOREIGN KEY (patientId) REFERENCES Patient(patientId),
    FOREIGN KEY (doctorId) REFERENCES Doctor(doctorId)
);
INSERT INTO Patient (patientId, firstName, lastName, dateOfBirth, gender, contactNumber, address)
VALUES 
(101, 'Alice', 'Smith', '1990-05-12', 'Female', '9876543210', '123 Main St'),
(102, 'Bob', 'Johnson', '1985-08-22', 'Male', '9123456780', '456 Maple Ave'),
(103, 'Charlie', 'Brown', '2000-11-10', 'Other', '9988776655', '789 Oak Blvd');
INSERT INTO Doctor (doctorId, firstName, lastName, specialization, contactNumber)
VALUES 
(1, 'Dr. John', 'Doe', 'Cardiology', '9000000001'),
(2, 'Dr. Jane', 'Williams', 'Pediatrics', '9000000002'),
(3, 'Dr. Emily', 'Davis', 'Neurology', '9000000003');
INSERT INTO Appointment (appointmentId, patientId, doctorId, appointmentDate, description)
VALUES 
(201, 101, 1, '2024-04-20', 'Regular check-up'),
(202, 102, 2, '2024-04-22', 'Pediatric consultation'),
(203, 103, 3, '2024-04-25', 'Neurology follow-up');

