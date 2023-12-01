USE hospital;
DROP PROCEDURE IF EXISTS get_column_names;
DELIMITER //
CREATE PROCEDURE get_column_names(IN tableName VARCHAR(255))
BEGIN
    -- Declare variables
    DECLARE done INT DEFAULT 0;
    DECLARE columnName VARCHAR(255);

    -- Declare cursor for fetching column names
    DECLARE columnCursor CURSOR FOR
        SELECT COLUMN_NAME
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_NAME = tableName
        ORDER BY ORDINAL_POSITION; -- Order by ordinal position to get columns in declaration order

    -- Declare continue handler for the cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Open the column cursor
    OPEN columnCursor;

    -- Fetch and print column names
    FETCH columnCursor INTO columnName;
    WHILE NOT done DO
        SELECT columnName AS Result;
        FETCH columnCursor INTO columnName;
    END WHILE;

    -- Close the cursor
    CLOSE columnCursor;
END //
DELIMITER ;

DELIMITER //
-- Check if return_table procedure exists, drop it if it does
DROP PROCEDURE IF EXISTS return_table;
CREATE PROCEDURE return_table(IN tableName VARCHAR(255))
BEGIN
    -- Construct dynamic SQL statement
    SET @sql_query = CONCAT('SELECT * FROM ', tableName);

    -- Prepare and execute the dynamic SQL statement
    PREPARE stmt FROM @sql_query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS add_entry;
CREATE PROCEDURE add_entry (
    IN tableName VARCHAR(255),
    IN attributeNames VARCHAR(255),
    IN attributeValues VARCHAR(255)
)
BEGIN
    SET @sql = CONCAT('INSERT INTO ', tableName, ' (', attributeNames, ') VALUES (', attributeValues, ')');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS delete_entry;
CREATE PROCEDURE delete_entry(
    IN tableName VARCHAR(255),
    IN attributeName VARCHAR(255),
    IN attributeValue VARCHAR(255)
)
BEGIN
    SET @sql = CONCAT('DELETE FROM ', tableName, ' WHERE ', attributeName, ' = ',attributeValue);
    
    -- For debugging, print the constructed SQL statement
    SELECT @sql;

    -- Prepare and execute the statement
    PREPARE stmt FROM @sql;
    EXECUTE stmt ;
    DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS update_entry;
CREATE PROCEDURE update_entry (
    IN tableName VARCHAR(255),
    IN updateAttributes VARCHAR(255),
    IN conditionAttribute VARCHAR(255),
    IN conditionValue VARCHAR(255)
)
BEGIN
    DECLARE updateStatement VARCHAR(1000);

    -- Construct the UPDATE statement dynamically
	SET @sql = CONCAT(
		'UPDATE ', tableName,
		' SET ', updateAttributes,
		' WHERE ', conditionAttribute, ' = "', conditionValue, '"'
	);
	SELECT @sql;
    
    -- Prepare and execute the dynamic SQL statement
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //

DELIMITER ;



DROP PROCEDURE ReplaceForeignKey;
DELIMITER //

CREATE PROCEDURE ReplaceForeignKey(
    IN p_table_name VARCHAR(100),
    IN p_foreign_key_attribute VARCHAR(100),
    IN p_referenced_table VARCHAR(100),
    IN p_referenced_attribute VARCHAR(100),
    IN p_display_columns VARCHAR(255)
)
BEGIN
    SET @sql = CONCAT(
        'SELECT t.', p_display_columns, ', r.', p_referenced_attribute,
        ' FROM ', p_table_name, ' t',
        ' LEFT JOIN ', p_referenced_table, ' r',
        ' ON t.', p_foreign_key_attribute, ' = r.', p_foreign_key_attribute
    );

    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //

DELIMITER ;
DROP PROCEDURE Replace2ForeignKeys;
DELIMITER //

CREATE PROCEDURE Replace2ForeignKeys(
    IN p_table_name VARCHAR(100),
    IN p_foreign_key_attribute1 VARCHAR(100),
    IN p_referenced_table1 VARCHAR(100),
    IN p_referenced_attribute1 VARCHAR(100),
    IN p_foreign_key_attribute2 VARCHAR(100),
    IN p_referenced_table2 VARCHAR(100),
    IN p_referenced_attribute2 VARCHAR(100),
    IN p_display_columns VARCHAR(255)
)
BEGIN
    SET @sql = CONCAT(
        'SELECT t.', p_display_columns,
        ', r1.', p_referenced_attribute1, ' AS ', p_referenced_attribute1,
        ', r2.', p_referenced_attribute2, ' AS ', p_referenced_attribute2,
        ' FROM ', p_table_name, ' t',
        ' LEFT JOIN ', p_referenced_table1, ' r1',
        ' ON t.', p_foreign_key_attribute1, ' = r1.', p_foreign_key_attribute1,
        ' LEFT JOIN ', p_referenced_table2, ' r2',
        ' ON t.', p_foreign_key_attribute2, ' = r2.', p_foreign_key_attribute2
    );

    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //

DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetInpatientsByDoctorID(IN inputDoctorID INT)
BEGIN
    -- Select the inpatients for the given DoctorID
    SELECT *
    FROM inpatient
    WHERE Doctor_ID = inputDoctorID;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetOutpatientsByDoctorID(IN inputDoctorID INT)
BEGIN
    -- Select the inpatients for the given DoctorID
    SELECT *
    FROM outpatient
    WHERE Doctor_ID = inputDoctorID;
END //
DELIMITER ;















