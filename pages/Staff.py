
import streamlit as st
import pandas as pd
import time
from login_page import login_page
from mysql_db import show_table,add_entry,update_entry,delete_entry,staff_by_designation

def Staff():
    # print(st.session_state.auth)
    df = show_table("staff")

    if st.session_state.auth == 1:
        st.title("Staff Table")
        if df is not None:
            st.subheader("Staff Info")
            st.dataframe(df)
            
      
            update_Staff(df)
            delete_Staff()
            Staff_Designation()

        else:
            st.write('No data available')
        if(st.button("Logout")):
            st.session_state.auth = 0   

            
def update_Staff(df):
    with st.expander("Update Staff Info"):
        staff_id = st.text_input("StaffID",key = "id")
        fname = st.text_input("FirstName",key="fname")
        sname = st.text_input("SurName",key="sname")
        desg = st.text_input("Designation",key="dsg")
        admin_id = st.text_input("Admin_ID",key="admin_id")
    

        if st.button("Update InPatient Table"):
            # Create a dictionary with non-None values
            data = {
                "StaffID": staff_id,
                "FirstName": fname,
                "SurName": sname,
                "Designation": desg,
                "Admin_ID":admin_id
            }
            if staff_id in df["StaffID"].values:
                data = {key: value for key, value in data.items() if value is not None}
                success_msg = update_entry("staff", data,{"StaffID":staff_id})
                if success_msg == "Success":
                    st.success("Update Successful!")
                    time.sleep(1)
                    st.experimental_rerun()
                else:
                    st.error("Update Failed!")
            else:
                if None in data.values():
                    st.error("Fill all fields for New Entry")
                success_msg = add_entry("staff", data)
                if success_msg == "Success":
                    st.success("Addition Successful!")
                    time.sleep(1)
                    st.experimental_rerun()
                else:
                    st.error("Addition Failed!")
                
def delete_Staff():
    with st.expander("Delete from Staff Info"):
        staff_id = st.text_input("Enter StaffID to delete",key="staff_id")
        if st.button("Confirm Delete"):
            msg = delete_entry('staff',{"StaffID":staff_id})
            if msg == "Success":
                st.success("Deletion Successful!")
                time.sleep(1)
                st.experimental_rerun()
            else:
                st.error("Deletion Failed!")
   
def Staff_Designation():
    with st.expander("Filter Staff by Designation"):
        dsg = st.text_input("Enter Designation",key="admin_id_filter")
        if st.button("Search STaff"):
            st.subheader("Filtered Staff")
            df_in_filter = staff_by_designation(dsg)
            st.dataframe(df_in_filter)

Staff()