import mysql.connector
import os
import json
import pandas as pd
from dotenv import load_dotenv

load_dotenv()

try:
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password=os.getenv("mysql_pwd"),
        database="hospital"
    )
    cursor = conn.cursor()
except mysql.connector.Error as e:
    print("Couldn't connect to MySQL:")
    print(e)
    exit()
    

def get_column_names(table):
    column_names_list = [] 
    try:
        # Call the stored procedure
        cursor.callproc('get_column_names', (table,))

        # Fetch the result set from the stored procedure
        for result in cursor.stored_results():
            column_names = result.fetchall()

            # Store column names in the list
            column_names_list.extend([column[0] for column in column_names])
        
        return column_names_list

    except mysql.connector.Error as e:
        print(f"Error: {e}")
        return None

        
def show_table(table):
    try:
        # Call get_column_names to get the column names
        column_names = get_column_names(table)
        # print(column_names)
        # Check if column_names is not None
        if column_names is not None:
            cursor.callproc('return_table', (table,))

            # Fetch the result set from the stored procedure
            for result in cursor.stored_results():
                data = result.fetchall()
                # Create a Pandas DataFrame with column names
                df = pd.DataFrame(data, columns=column_names,index=None)
                return df
    except mysql.connector.Error as e:
        print(f"Error fetching data from '{table}':")
        print(e)
        return None


def add_entry(table, entry_data):
    try:
        # Extract keys and values from the dictionary
        attribute_names = ', '.join(entry_data.keys())
        attribute_values = ', '.join([f'{value}' if isinstance(value, (int, float)) else f'"{value}"' for value in entry_data.values()])
        
        # Call the stored procedure
        cursor.callproc('add_entry', [table, attribute_names, attribute_values])
        
        # Commit the changes to the database
        conn.commit()
        
        return "Success"

    except mysql.connector.Error as e:
        print(f"Error adding entry to '{table}':")
        print(e)
        return "Failed"

def update_entry(table, update_data, condition_data):
    try:
        # Extract keys and values from the dictionaries
        update_string = ', '.join([f'{key} = {value}' if isinstance(value, (int, float)) else f'{key} = "{value}"' for key, value in update_data.items()])
        
        # Split condition_data into condition_attribute and condition_value
        condition_attribute = list(condition_data.keys())[0]  # Assuming only one key in condition_data
        condition_value = condition_data[condition_attribute]
        
        # Call the stored procedure
        cursor.callproc('update_entry', [table, update_string, condition_attribute, condition_value])

        # Commit the changes to the database
        conn.commit()
        return "Success"
    except mysql.connector.Error as e:
        print(f"Error updating entry to '{table}':")
        print(e)
        return "Failed"
        
def delete_entry(table, condition_data):
    try:
        # Split condition_data into condition_attribute and condition_value
        condition_attribute = list(condition_data.keys())[0]  # Assuming only one key in condition_data
        condition_value = condition_data[condition_attribute]
        
        # Call the stored procedure
        cursor.callproc('delete_entry', [table, condition_attribute, condition_value])

        # Commit the changes to the database
        conn.commit()

        return "Success"

    except mysql.connector.Error as e:
        print(f"Error deleting entry from '{table}':")
        print(e)
        return "Failed"
    
def search_entry(table,condition_data):
    try:
        condition_attribute = list(condition_data.keys())[0]  # Assuming only one key in condition_data
        condition_value = condition_data[condition_attribute]
        cursor.callproc('search_entry', [table, condition_attribute, condition_value])

        result = list(cursor.stored_results())[0].fetchall()

        return result
    except mysql.connector.Error as e:
        print(f"Error searching entry from '{table}':")
        print(e)
        return []
    
def inpatients_by_doctor(doc_id):
    try:
        # Call get_column_names to get the column names
        column_names = get_column_names('inpatient')
        # print(column_names)
        # Check if column_names is not None
        if column_names is not None:
            cursor.callproc('GetInpatientsByDoctorID',[doc_id])

            # Fetch the result set from the stored procedure
            for result in cursor.stored_results():
                data = result.fetchall()
                # Create a Pandas DataFrame with column names
                df = pd.DataFrame(data, columns=column_names,index=None)
                return df
    except mysql.connector.Error as e:
        print(f"Error fetching data from 'inpatient':")
        print(e)
        return None
    
def outpatients_by_doctor(doc_id):
    try:
        # Call get_column_names to get the column names
        column_names = get_column_names('outpatient')
        # print(column_names)
        # Check if column_names is not None
        if column_names is not None:
            cursor.callproc('GetOutpatientsByDoctorID',[doc_id])

            # Fetch the result set from the stored procedure
            for result in cursor.stored_results():
                data = result.fetchall()
                # Create a Pandas DataFrame with column names
                df = pd.DataFrame(data, columns=column_names,index=None)
                return df
    except mysql.connector.Error as e:
        print(f"Error fetching data from 'outpatient':")
        print(e)
        return None


def staff_by_admin(admin_id):
    try:
        # Call get_column_names to get the column names
        column_names = get_column_names('staff')
        # print(column_names)
        # Check if column_names is not None
        if column_names is not None:
            cursor.callproc('GetStaffbyAdminID',[admin_id])

            # Fetch the result set from the stored procedure
            for result in cursor.stored_results():
                data = result.fetchall()
                # Create a Pandas DataFrame with column names
                df = pd.DataFrame(data, columns=column_names,index=None)
                return df
    except mysql.connector.Error as e:
        print(f"Error fetching data from 'staff':")
        print(e)
        return None
    
def staff_by_designation(dsg):
    try:
        # Call get_column_names to get the column names
        column_names = get_column_names('staff')
        # print(column_names)
        # Check if column_names is not None
        if column_names is not None:
            cursor.callproc('GetStaffbyDesignation',[dsg])

            # Fetch the result set from the stored procedure
            for result in cursor.stored_results():
                data = result.fetchall()
                # Create a Pandas DataFrame with column names
                df = pd.DataFrame(data, columns=column_names,index=None)
                return df
    except mysql.connector.Error as e:
        print(f"Error fetching data from 'staff':")
        print(e)
        return None

# Example usage
# table_name = 'medicine'
# condition_data = {'MedicineID': 16}

# delete_entry(table_name, condition_data)

#show_table("InPatient")

       
# table_name = 'medicine'
# entry_data = {'MedicineID': 16, 'MedicineName': 'Omeprazole', 'Price': 1200.00}
# add_entry(table_name, entry_data)

# table_name = 'medicine'
# update_data = {'MedicineName': 'Metroprolol-A', 'Price': 1550}
# condition_data = {'MedicineID': 12}
# update_entry(table_name, update_data, condition_data)

