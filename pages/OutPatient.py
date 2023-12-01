import streamlit as st
import pandas as pd
import time
from login_page import login_page
from mysql_db import show_table,add_entry,update_entry,delete_entry

def OutPatient():
    # print(st.session_state.auth)
    df = show_table("outpatient")
    df_medical = show_table("outpatientmedical")

    if st.session_state.auth == 1:
        st.title("OutPatient Tables")
        if df is not None:
            st.subheader("OutPatient Table")
            st.dataframe(df)
            

            update_InPatient(df)
            delete_InPatient()
        
        if df_medical is not None:
            st.subheader("OutPatient Medical")
            st.dataframe(df_medical)
            update_InPatientMedical(df_medical)
            delete_InPatientMedical()
        else:
            st.write('No data available')
        if(st.button("Logout")):
            st.session_state.auth = 0   

            
def update_InPatient(df):
    with st.expander("Update OutPatient Table"):
        doc_id = st.text_input("Doctor_ID",key = "doc_id")
        patient_name = st.text_input("OutPatient Name",key="name")
        

        
        
        if st.button("Update InPatient Table"):
            # Create a dictionary with non-None values
            data = {
                "Doctor_ID": doc_id,
                "PatientName": patient_name,
            }
            if patient_name in df["PatientName"].values:
                data = {key: value for key, value in data.items() if value is not None}
                success_msg = update_entry("outpatient", data,{"PatientName":patient_name})
                if success_msg == "Success":
                    st.success("Update Successful!")
                    time.sleep(1)
                    st.experimental_rerun()
                else:
                    st.error("Update Failed!")
            else:
                if None in data.values():
                    st.error("Fill all fields for New Entry")
                success_msg = add_entry("outpatient", data)
                if success_msg == "Success":
                    st.success("Addition Successful!")
                    time.sleep(1)
                    st.experimental_rerun()
                else:
                    st.error("Addition Failed!")
                
def delete_InPatient():
    with st.expander("Delete from OutPatient Table"):
        patient_id = st.text_input("Enter PatientID to delete",key="id")
        if st.button("Confirm Delete"):
            msg = delete_entry('outpatient',{"PatientID":patient_id})
            if msg == "Success":
                st.success("Deletion Successful!")
                time.sleep(1)
                st.experimental_rerun()
            else:
                st.error("Deletion Failed!")
    
   
def update_InPatientMedical(df_medical):
    with st.expander("Update OutPatient Medical Table"):
        record = st.text_input("RcordID",key = "rec_id")
        pat_id = st.text_input("Patient_ID",key = "pat_id")
        med_id = st.text_input("Medicine_ID",key="med_id")

        if st.button("Update InPatient Medical Table"):
            # Create a dictionary with non-None values
            data = {
                "RecordID":record,
                "Patient_ID": pat_id,
                "Medicine_ID": med_id,
            }
            if record in df_medical["RecordID"].values:
                data = {key: value for key, value in data.items() if value is not None}
                success_msg = update_entry("outpatientmedical", data,{"RecordID":record})
                if success_msg == "Success":
                    st.success("Update Successful!")
                    time.sleep(1)
                    st.experimental_rerun()
                else:
                    st.error("Update Failed!")
            else:
                if None in data.values():
                    st.error("Fill all fields for New Entry")
                success_msg = add_entry("outpatientmedical", data)
                if success_msg == "Success":
                    st.success("Addition Successful!")
                    time.sleep(1)
                    st.experimental_rerun()
                else:
                    st.error("Addition Failed!")

def delete_InPatientMedical():
    with st.expander("Delete from OutPatient MedicalTable"):
        record_id = st.text_input("Enter RecordID to delete",key="record_to_delete")
        if st.button("Confirm Delete?"):
            msg = delete_entry('outpatientmedical',{"RecordID":record_id})
            if msg == "Success":
                st.success("Deletion Successful!")
                time.sleep(1)
                st.experimental_rerun()
            else:
                st.error("Deletion Failed!")
            
OutPatient()