INSERT INTO Admin (UserName, Password, FirstName, Surname)
VALUES
    ('admin1', 'P@ssw0rd123', 'John', 'Doe'),
    ('admin2', 'Secret@789', 'Jane', 'Smith'),
    ('admin3', 'SecurePass42', 'Alice', 'Johnson'),
    ('admin4', 'Random123$', 'Bob', 'Williams'),
    ('admin5', 'SecureWord456', 'Eve', 'Brown'),
    ('Sammy','27ms0244','Samarth','Bhat');




INSERT INTO Staff (FirstName, Surname, Designation, Admin_ID)
VALUES
    ('John', 'Smith', 'Nurse', 300),
    ('Jane', 'Doe', 'Doctor', 301),
    ('Alice', 'Johnson', 'Receptionist', 302),
    ('Bob', 'Williams', 'Nurse', 303),
    ('Eve', 'Brown', 'Surgeon', 304),
    ('Michael', 'Davis', 'Janitor', 303),
    ('Emma', 'Taylor', 'Doctor', 300),
    ('William', 'Anderson', 'Receptionist', 301),
    ('Olivia', 'Martinez', 'Nurse', 302),
    ('James', 'Jackson', 'Technician', 303),
    ('Sophia', 'White', 'Nurse', 304),
    ('Daniel', 'Harris', 'Surgeon', 301),
    ('Emily', 'Miller', 'Doctor', 300),
    ('Matthew', 'Thomas', 'Technician', 301),
    ('Ava', 'Garcia', 'Receptionist', 302),
    ('Liam', 'Brown', 'Nurse', 303),
    ('Oliver', 'Jones', 'Doctor', 304),
    ('Chloe', 'Clark', 'Nurse', 302),
    ('Jackson', 'Moore', 'Surgeon', 300),
    ('Mia', 'Wilson', 'Janitor', 301);



INSERT INTO Doctor (DoctorName, Specialization)
VALUES
    ('Dr. Smith', 'Cardiology'),
    ('Dr. Johnson', 'Orthopedics'),
    ('Dr. Davis', 'Pediatrics'),
    ('Dr. Taylor', 'Neurology'),
    ('Dr. Anderson', 'Ophthalmology'),
    ('Dr. Martinez', 'Gynecology'),
    ('Dr. Jackson', 'Dermatology'),
    ('Dr. Harris', 'Oncology'),
    ('Dr. Miller', 'Urology'),
    ('Dr. Thomas', 'Gastroenterology'),
    ('Dr. Garcia', 'ENT'),
    ('Dr. Brown', 'Psychiatry'),
    ('Dr. Jones', 'Radiology'),
    ('Dr. Clark', 'Endocrinology'),
    ('Dr. Moore', 'Rheumatology'),
    ('Sejal','General Medicine');
-- Assuming you have already created the database and switched to it (use hospital;)

-- Insert 50 dummy rooms with RoomNumber values
INSERT INTO Room (RoomNumber, RoomCost)
VALUES
    (101, 150.00),
    (102, 200.00),
    (103, 180.00),
    (104, 250.00),
    (105, 170.00),
    (106, 220.00),
    (107, 190.00),
    (108, 210.00),
    (109, 160.00),
    (110, 230.00),
    (201, 200.00),
    (202, 180.00),
    (203, 250.00),
    (204, 170.00),
    (205, 220.00),
    (206, 190.00),
    (207, 210.00),
    (208, 160.00),
    (209, 230.00),
    (210, 200.00),
    (301, 180.00),
    (302, 250.00),
    (303, 170.00),
    (304, 220.00),
    (305, 190.00),
    (306, 210.00),
    (307, 160.00),
    (308, 230.00),
    (309, 200.00),
    (310, 180.00),
    (401, 250.00),
    (402, 170.00),
    (403, 220.00),
    (404, 190.00),
    (405, 210.00),
    (406, 160.00),
    (407, 230.00),
    (408, 200.00),
    (409, 180.00),
    (410, 250.00),
    (501, 170.00),
    (502, 220.00),
    (503, 190.00),
    (504, 210.00),
    (505, 160.00),
    (506, 230.00),
    (507, 200.00),
    (508, 180.00),
    (509, 250.00),
    (510, 170.00);

-- Assuming you have already created the database and switched to it (use hospital;)

-- Insert 30 dummy patients with randomly assigned RoomID and DoctorID values
INSERT INTO InPatient (AdmissionDate, PatientName, Gender, Room_ID, Doctor_ID)
VALUES
    ('2023-01-01', 'John Doe', 'Male', 101, 505),
    ('2023-01-02', 'Jane Smith', 'Female', 105, 503),
    ('2023-01-03', 'Alice Johnson', 'Female', 112, 508),
    ('2023-01-04', 'Bob Williams', 'Male', 110, 514),
    ('2023-01-05', 'Eve Brown', 'Female', 120, 506),
    ('2023-01-06', 'Michael Davis', 'Male', 116, 502),
    ('2023-01-07', 'Emma Taylor', 'Female', 121, 512),
    ('2023-01-08', 'William Anderson', 'Male', 114, 509),
    ('2023-01-09', 'Olivia Martinez', 'Female', 102, 513),
    ('2023-01-10', 'James Jackson', 'Male', 129, 501),
    ('2023-01-11', 'Sophia White', 'Female', 107, 511),
    ('2023-01-12', 'Daniel Harris', 'Male', 125, 507),
    ('2023-01-13', 'Emily Miller', 'Female', 104, 510),
    ('2023-01-14', 'Matthew Thomas', 'Male', 119, 512),
    ('2023-01-15', 'Ava Garcia', 'Female', 128, 504),
    ('2023-01-16', 'Liam Brown', 'Male', 123, 513),
    ('2023-01-17', 'Oliver Jones', 'Male', 106, 514),
    ('2023-01-18', 'Chloe Clark', 'Female', 122, 503),
    ('2023-01-19', 'Jackson Moore', 'Male', 118, 510),
    ('2023-01-20', 'Mia Wilson', 'Female', 117, 502),
    ('2023-01-21', 'Sophie Harris', 'Female', 129, 508),
    ('2023-01-22', 'Noah Davis', 'Male', 109, 500),
    ('2023-01-23', 'Lily Johnson', 'Female', 115, 507),
    ('2023-01-24', 'Ethan Brown', 'Male', 124, 500),
    ('2023-01-25', 'Emma Davis', 'Female', 113, 504),
    ('2023-01-26', 'James Wilson', 'Male', 126, 506),
    ('2023-01-27', 'Olivia Moore', 'Female', 103, 501),
    ('2023-01-28', 'Lucas Taylor', 'Male', 127, 513),
    ('2023-01-29', 'Ava Martin', 'Female', 108, 509),
    ('2023-01-30', 'Logan Johnson', 'Male', 111, 505);





INSERT INTO Payment (PaymentDate, Amount, PaymentMethod, Admission_ID)
VALUES
    ('2023-02-01', 1500.00, 'Credit Card', 5000),
    ('2023-02-02', 2000.00, 'Cash', 5001),
    ('2023-02-03', 1800.00, 'Debit Card', 5002),
    ('2023-02-04', 2500.00, 'Cash', 5003),
    ('2023-02-05', 1700.00, 'Credit Card', 5004),
    ('2023-02-06', 2200.00, 'Debit Card', 5005),
    ('2023-02-07', 1900.00, 'Cash', 5006),
    ('2023-02-08', 2100.00, 'Credit Card', 5007),
    ('2023-02-09', 1600.00, 'Debit Card', 5008),
    ('2023-02-10', 2300.00, 'Cash', 5009),
    ('2023-02-11', 2000.00, 'Credit Card', 5010),
    ('2023-02-12', 1800.00, 'Debit Card', 5011),
    ('2023-02-13', 2500.00, 'Cash', 5012),
    ('2023-02-14', 1700.00, 'Credit Card', 5013),
    ('2023-02-15', 2200.00, 'Debit Card', 5014),
    ('2023-02-16', 1900.00, 'Cash', 5015),
    ('2023-02-17', 2100.00, 'Credit Card', 5016),
    ('2023-02-18', 1600.00, 'Debit Card', 5017),
    ('2023-02-19', 2300.00, 'Cash', 5018),
    ('2023-02-20', 2000.00, 'Credit Card', 5019),
    ('2023-02-21', 1800.00, 'Debit Card', 5020),
    ('2023-02-22', 2500.00, 'Cash', 5021),
    ('2023-02-23', 1700.00, 'Credit Card', 5022),
    ('2023-02-24', 2200.00, 'Debit Card', 5023),
    ('2023-02-25', 1900.00, 'Cash', 5024),
    ('2023-02-26', 2100.00, 'Credit Card', 5025),
    ('2023-02-27', 1600.00, 'Debit Card', 5026),
    ('2023-02-28', 2300.00, 'Cash', 5027),
    ('2023-03-01', 2000.00, 'Credit Card', 5028);








INSERT INTO Medicine (MedicineName, Price)
VALUES
('Paracetamol', 750.00), -- INR
('Amoxicillin', 1160.00), -- INR
('Ibuprofen', 1520.00), -- INR
('Aspirin', 690.00), -- INR
('Lisinopril', 980.00), -- INR
('Metformin', 1350.00), -- INR
('Simvastatin', 1720.00), -- INR
('Losartan', 1200.00), -- INR
('Amlodipine', 830.00), -- INR
('Atorvastatin', 960.00), -- INR
('Furosemide', 1410.00), -- INR
('Metoprolol', 1670.00), -- INR
('Gabapentin', 550.00), -- INR
('Hydrochlorothiazide', 1950.00), -- INR
('Tramadol', 1250.00); -- INR


-- Assuming you have already created the database and switched to it (use hospital;)

-- Insert 15 dummy records into InPatientMedical table with MedicineID values from 10 to 25
INSERT INTO InPatientMedical (Total, Medicine_ID, Admission_ID)
VALUES
    (550.00, 10, 5000),
    (400.00, 11, 5001),
    (900.00, 12, 5002),
    (600.00, 13, 5003),
    (800.00, 14, 5004),
    (1200.00, 15, 5005),
    (700.00, 16, 5006),
    (450.00, 17, 5007),
    (1800.00, 18, 5008),
    (950.00, 19, 5009),
    (1600.00, 20, 5010),
    (750.00, 21, 5011),
    (550.00, 22, 5012),
    (1000.00, 23, 5013),
    (400.00, 24, 5014);






INSERT INTO InPatientService (Admission_ID, ServiceName)
SELECT AdmissionID, ServiceName
FROM (
    SELECT AdmissionID, ServiceName,
           ROW_NUMBER() OVER (PARTITION BY AdmissionID ORDER BY RAND()) AS rn
    FROM InPatient
    CROSS JOIN (
        SELECT 'Physical Therapy' AS ServiceName
        UNION ALL SELECT 'Psychiatric Care'
        UNION ALL SELECT 'Maternity Services'
        UNION ALL SELECT 'Pediatric Services'
        UNION ALL SELECT 'Intensive Care'
    ) AS Services
) AS RankedServices
WHERE rn = 1;




-- Assuming you have already created the database and switched to it (use hospital;)

-- Insert 20 dummy records into OutPatient table
INSERT INTO OutPatient (Doctor_ID, PatientName)
VALUES
    (500, 'John Doe'),
    (501, 'Jane Smith'),
    (502, 'Alice Johnson'),
    (503, 'Bob Williams'),
    (504, 'Eve Brown'),
    (505, 'Michael Davis'),
    (506, 'Emma Taylor'),
    (507, 'William Anderson'),
    (508, 'Olivia Martinez'),
    (509, 'James Jackson'),
    (510, 'Sophia White'),
    (511, 'Daniel Harris'),
    (512, 'Emily Miller'),
    (513, 'Matthew Thomas'),
    (514, 'Ava Garcia'),
    (500, 'Liam Brown'),
    (500, 'Oliver Jones'),
    (513, 'Chloe Clark'),
    (506, 'Jackson Moore'),
    (503, 'Mia Wilson');



-- Assuming you have already created the database and switched to it (use hospital;)

-- Insert 15 dummy records into OutPatientMedical table
INSERT INTO OutPatientMedical (Patient_ID, Medicine_ID)
VALUES
    (7500, 10),
    (7501, 11),
    (7502, 12),
    (7503, 13),
    (7504, 14),
    (7505, 15),
    (7506, 16),
    (7507, 17),
    (7508, 18),
    (7509, 19),
    (7510, 20),
    (7511, 21),
    (7512, 22),
    (7513, 23),
    (7514, 24),
    (7515, 10),
    (7516, 11),
    (7517, 12),
    (7518, 13),
    (7519, 14);









