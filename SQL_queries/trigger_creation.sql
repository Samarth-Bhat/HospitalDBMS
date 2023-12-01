USE hospital;

DELIMITER //

CREATE TRIGGER AfterOutpatientInsert
AFTER INSERT ON outpatient
FOR EACH ROW
BEGIN
    DELETE FROM inpatient
    WHERE PatientName = NEW.PatientName;
END;
//

DELIMITER ;
