USE hospital;

-- Assuming you have already created the database and switched to it (use hospital;)



-- Assuming you have already created the database and switched to it (use hospital;)

-- Table: Admin
ALTER TABLE Staff
ADD CONSTRAINT fk_staff_admin
FOREIGN KEY (AdminID) REFERENCES Admin(AdminID)
ON DELETE SET DEFAULT;

-- Table: Staff
ALTER TABLE Doctor
ADD CONSTRAINT fk_doctor_staff
FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
ON DELETE SET DEFAULT;

-- Table: InPatient
ALTER TABLE Payment
ADD CONSTRAINT fk_payment_inpatient
FOREIGN KEY (AdmissionID) REFERENCES InPatient(AdmissionID)
ON DELETE SET DEFAULT;

-- Table: InPatientBill
ALTER TABLE InPatientBill
ADD CONSTRAINT fk_inpatientbill_inpatient
FOREIGN KEY (AdmissionID) REFERENCES InPatient(AdmissionID)
ON DELETE SET DEFAULT;

ALTER TABLE InPatientBill
ADD CONSTRAINT fk_inpatientbill_payment
FOREIGN KEY (PaymentID) REFERENCES Payment(PaymentID)
ON DELETE SET DEFAULT;

-- Table: InPatientMedical
ALTER TABLE InPatientMedical
ADD CONSTRAINT fk_inpatientmedical_medicine
FOREIGN KEY (MedicineID) REFERENCES Medicine(MedicineID)
ON DELETE SET DEFAULT;

ALTER TABLE InPatientMedical
ADD CONSTRAINT fk_inpatientmedical_inpatient
FOREIGN KEY (AdmissionID) REFERENCES InPatient(AdmissionID)
ON DELETE SET DEFAULT;

-- Table: InPatientService
ALTER TABLE InPatientService
ADD CONSTRAINT fk_inpatientservice_inpatient
FOREIGN KEY (AdmissionID) REFERENCES InPatient(AdmissionID)
ON DELETE SET DEFAULT;

-- Table: OutPatient
ALTER TABLE OutPatient
ADD CONSTRAINT fk_outpatient_doctor
FOREIGN KEY (DoctorAssigned) REFERENCES Doctor(DoctorID)
ON DELETE SET DEFAULT;

-- Table: OutPatientMedical
ALTER TABLE OutPatientMedical
ADD CONSTRAINT fk_outpatientmedical_patient
FOREIGN KEY (PatientID) REFERENCES OutPatient(PatientID)
ON DELETE SET DEFAULT;

ALTER TABLE OutPatientMedical
ADD CONSTRAINT fk_outpatientmedical_medicine
FOREIGN KEY (MedicineID) REFERENCES Medicine(MedicineID)
ON DELETE SET DEFAULT;

-- Table: OutPatientBill
ALTER TABLE OutPatientBill
ADD CONSTRAINT fk_outpatientbill_patient
FOREIGN KEY (PatientID) REFERENCES OutPatient(PatientID)
ON DELETE SET DEFAULT;

-- Table: Cashier
ALTER TABLE Cashier
ADD CONSTRAINT fk_cashier_staff
FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
ON DELETE SET DEFAULT;

ALTER TABLE InPatient
ADD COLUMN DoctorAssigned INT,
ADD CONSTRAINT fk_inpatient_doctor
FOREIGN KEY (DoctorAssigned) REFERENCES Doctor(DoctorID);