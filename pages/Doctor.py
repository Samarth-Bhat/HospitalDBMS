import streamlit as st
from login_page import login_page

import streamlit as st
import pandas as pd
import time
from login_page import login_page
from mysql_db import show_table,add_entry,update_entry,delete_entry,inpatients_by_doctor,outpatients_by_doctor
def Doctor():
    # print(st.session_state.auth)
    df = show_table("doctor")
    if st.session_state.auth == 1:
        st.title("Doctor Table")
        if df is not None:
            st.subheader("Doctor Info")
            st.dataframe(df)
            
            
            update_InPatient(df)
            delete_InPatient()
            Doctor_Inpatients()
            Doctor_Outpatients()
        else:
            st.write('No data available')
        if(st.button("Logout")):
            st.session_state.auth = 0   

            
def update_InPatient(df):
    with st.expander("Update Doctor Info"):
        doc_id = st.text_input("DoctorID",key = "doc_id")
        doc_name = st.text_input("DoctorName",key="doc_name")
        spec = st.text_input("Specialization",key="spec")

        if st.button("Update InPatient Table"):
            # Create a dictionary with non-None values
            data = {
                "DoctorID": doc_id,
                "DoctorName": doc_name,
                "Specialization": spec
            }
            if doc_id in df["DoctorID"].values:
                data = {key: value for key, value in data.items() if value is not None}
                success_msg = update_entry("doctor", data,{"DoctorID":doc_id})
                if success_msg == "Success":
                    st.success("Update Successful!")
                    time.sleep(1)
                    st.experimental_rerun()
                else:
                    st.error("Update Failed!")
            else:
                if None in data.values():
                    st.error("Fill all fields for New Entry")
                success_msg = add_entry("doctor", data)
                if success_msg == "Success":
                    st.success("Addition Successful!")
                    time.sleep(1)
                    st.experimental_rerun()
                else:
                    st.error("Addition Failed!")
                
def delete_InPatient():
    with st.expander("Delete from Doctor Info"):
        doc_id = st.text_input("Enter DoctorID to delete",key="id")
        if st.button("Confirm Delete"):
            msg = delete_entry('doctor',{"DoctorID":doc_id})
            if msg == "Success":
                st.success("Deletion Successful!")
                time.sleep(1)
                st.experimental_rerun()
            else:
                st.error("Deletion Failed!")
   
def Doctor_Inpatients():
    with st.expander("Filter InPatient by Doctor"):
        doc_id = st.text_input("Enter DoctorID",key="doc_id_filter")
        if st.button("Search InPatients"):
            st.subheader("Filtered InPatient")
            df_in_filter = inpatients_by_doctor(doc_id)
            st.dataframe(df_in_filter)

def Doctor_Outpatients():
    with st.expander("Filter OutPatient by Doctor"):
        doc_id = st.text_input("Enter DoctorID",key="doc_id_filter_out")
        if st.button("Search OutPatients"):
            st.subheader("Filtered OutPatient")
            df_in_filter = outpatients_by_doctor(doc_id)
            st.dataframe(df_in_filter)
        
Doctor()