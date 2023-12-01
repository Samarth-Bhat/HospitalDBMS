 create database hospital;
 
 use hospital;
 


CREATE TABLE Admin (
    AdminID INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(50) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    Surname VARCHAR(50) NOT NULL
)AUTO_INCREMENT = 300;


CREATE TABLE Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    Surname VARCHAR(50) NOT NULL,
    Designation VARCHAR(50) NOT NULL,
    Admin_ID INT,
    FOREIGN KEY (Admin_ID) REFERENCES Admin(AdminID) ON DELETE SET NULL
)AUTO_INCREMENT = 1000;




CREATE TABLE Doctor (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    DoctorName VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100) NOT NULL
)AUTO_INCREMENT = 500;

CREATE TABLE Room (
    RoomID INT auto_increment primary KEY,
    RoomNumber INT NOT NULL,
    RoomCost DECIMAL(10, 2) NOT NULL
)AUTO_INCREMENT = 100;


CREATE TABLE InPatient (
    AdmissionID INT AUTO_INCREMENT PRIMARY KEY,
    AdmissionDate DATE NOT NULL,
    PatientName VARCHAR(100) NOT NULL,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    Room_ID INT,
    Doctor_ID INT,
    FOREIGN KEY (Room_ID) REFERENCES Room(RoomID) ON DELETE SET NULL,
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(DoctorID) ON DELETE SET NULL
) AUTO_INCREMENT = 5000;



CREATE TABLE Payment (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    PaymentDate DATE NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentMethod VARCHAR(50),
    Admission_ID INT,
    FOREIGN KEY (Admission_ID) REFERENCES InPatient(AdmissionID) ON DELETE SET NULL
)AUTO_INCREMENT = 20000;





CREATE TABLE Medicine (
    MedicineID INT AUTO_INCREMENT PRIMARY KEY,
    MedicineName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
)AUTO_INCREMENT = 10;



CREATE TABLE InPatientMedical (
    MedicineRecordID INT AUTO_INCREMENT PRIMARY KEY,
    Total DECIMAL(10, 2) NOT NULL,
    Medicine_ID INT ,
    Admission_ID INT ,
    FOREIGN KEY (Medicine_ID) REFERENCES Medicine(MedicineID) ON DELETE SET NULL,
    FOREIGN KEY (Admission_ID) REFERENCES InPatient(AdmissionID) ON DELETE SET NULL
)AUTO_INCREMENT = 50;


CREATE TABLE InPatientService (
    ServiceID INT AUTO_INCREMENT PRIMARY KEY,
    Admission_ID INT ,
    ServiceName VARCHAR(100) NOT NULL,
    FOREIGN KEY (Admission_ID) REFERENCES InPatient(AdmissionID) ON DELETE SET NULL
)AUTO_INCREMENT = 750;




CREATE TABLE OutPatient (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    Doctor_ID INT,
    PatientName VARCHAR(100) NOT NULL,
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(DoctorID)
)AUTO_INCREMENT = 7500;



CREATE TABLE OutPatientMedical (
    RecordID INT AUTO_INCREMENT PRIMARY KEY,
    Patient_ID INT,
    Medicine_ID INT,
    FOREIGN KEY (Patient_ID) REFERENCES OutPatient(PatientID) ON DELETE SET NULL,
    FOREIGN KEY (Medicine_ID) REFERENCES Medicine(MedicineID) ON DELETE SET NULL
);


show tables;
























