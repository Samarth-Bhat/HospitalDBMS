import streamlit as st
import pandas as pd
import time
from mysql_db import show_table,add_entry,update_entry,delete_entry

def InPatient():
    df = show_table("inpatient")
    df_medical = show_table("inpatientmedical")

    if st.session_state.auth == 1:
        st.title("InPatient tables")
        if df is not None:
            st.subheader("InPatient Table")
            st.dataframe(df)
            

            update_InPatient(df)
            delete_InPatient()
            
        if df_medical is not None:
            st.subheader("InPatient Medical")
            st.dataframe(df_medical)
            update_InPatientMedical(df_medical)
            delete_InPatientMedical()
        else:
            st.write('No data available')
        if(st.button("Logout")):
            st.session_state.auth = 0   

            
def update_InPatient(df):
    with st.expander("Update InPatient Table"):
        patient_name = st.text_input("InPatient Name",key="name")
        gender = st.text_input("Gender",key = "gender")
        admission_date = st.text_input("Date of Admission",key="date")
        room = st.text_input("Room_ID",key = "room")
        doctor_assigned = st.text_input("Doctor_ID",key="doctor")
        
        
        if st.button("Update InPatient Table"):
            # Create a dictionary with non-None values
            data = {
                "AdmissionDate": admission_date,
                "PatientName": patient_name,
                "Gender": gender,
                "Room_ID": room,
                "Doctor_ID": doctor_assigned
            }
            if patient_name in df["PatientName"].values:
                data = {key: value for key, value in data.items() if value is not None}
                success_msg = update_entry("inpatient", data,{"PatientName":patient_name})
                if success_msg == "Success":
                    st.success("Update Successful!")
                    time.sleep(1)
                    st.experimental_rerun()
                else:
                    st.error("Update Failed!")
            else:
                if None in data.values():
                    st.error("Fill all fields for New Entry")
                success_msg = add_entry("inpatient", data)
                if success_msg == "Success":
                    st.success("Addition Successful!")
                    time.sleep(1)
                    st.experimental_rerun()
                else:
                    st.error("Addition Failed!")
                    
def delete_InPatient():
    with st.expander("Delete from InPatient Table"):
        admission_id = st.text_input("Enter AdmissionID to delete",key="id")
        if st.button("Confirm Delete"):
            msg = delete_entry('inpatient',{"AdmissionID":admission_id})
            if msg == "Success":
                st.success("Deletion Successful!")
                time.sleep(1)
                st.experimental_rerun()
            else:
                st.error("Deletion Failed!")
   
   
def update_InPatientMedical(df_medical):
    with st.expander("Update InPatient Medical Table"):
        record = st.text_input("Medicine Record ID",key="record")
        total = st.text_input("Medicine Total cost",key="total")
        med_id = st.text_input("Medicine_ID",key = "med_id")
        admission_id = st.text_input("Admission_ID",key="admission_id")
        # doctor_assigned = st.text_input("Doctor assigned",key="doctor")


        if st.button("Update InPatient Medical Table"):
            # Create a dictionary with non-None values
            data = {
                "MedicineRecordID": record,
                "Total": total,
                "Medicine_ID": med_id,
                "Admission_ID":admission_id,
            }
            if record in df_medical["MedicineRecordID"].values:
                data = {key: value for key, value in data.items() if value is not None}
                success_msg = update_entry("inpatientmedical", data,{"MedicineRecordID":record})
                if success_msg == "Success":
                    st.success("Update Successful!")
                    time.sleep(1)
                    st.experimental_rerun()
                else:
                    st.error("Update Failed!")
            else:
                if None in data.values():
                    st.error("Fill all fields for New Entry")
                success_msg = add_entry("inpatientmedical", data)
                if success_msg == "Success":
                    st.success("Addition Successful!")
                    time.sleep(1)
                    st.experimental_rerun()
                else:
                    st.error("Addition Failed!")

def delete_InPatientMedical():
    with st.expander("Delete from InPatient MedicalTable"):
        record_id = st.text_input("Enter MedicineRecordID to delete",key="record_to_delete")
        if st.button("Confirm Delete?"):
            msg = delete_entry('inpatientmedical',{"MedicineRecordID":record_id})
            if msg == "Success":
                st.success("Deletion Successful!")
                time.sleep(1)
                st.experimental_rerun()
            else:
                st.error("Deletion Failed!")