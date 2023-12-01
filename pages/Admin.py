import streamlit as st
import pandas as pd
import time
from login_page import login_page
from mysql_db import show_table,add_entry,update_entry,delete_entry,staff_by_admin


def Admin():
    # print(st.session_state.auth)
    df = show_table("admin")

    if st.session_state.auth == 1:
        st.title("Admin Table")
        if df is not None:
            st.subheader("Admin Info")
            st.dataframe(df)
            
            
            update_Admin(df)
            delete_Admin()
            Staff_Admin()

        else:
            st.write('No data available')
        if(st.button("Logout")):
            st.session_state.auth = 0   

            
def update_Admin(df):
    with st.expander("Update Admin Info"):
        admin_id = st.text_input("AdminID",key = "id")
        user_name = st.text_input("UserName",key="uname")
        password = st.text_input("Password",key="pwd")
        fname = st.text_input("FirstName",key="fn")
        sname = st.text_input("Surname",key="sn")
    

        if st.button("Update InPatient Table"):
            # Create a dictionary with non-None values
            data = {
                "AdminID": admin_id,
                "UserName": user_name,
                "Password": password,
                "FirstName": fname,
                "Surname":sname
            }
            if admin_id in df["AdminID"].values:
                data = {key: value for key, value in data.items() if value is not None}
                success_msg = update_entry("admin", data,{"AdminID":admin_id})
                if success_msg == "Success":
                    st.success("Update Successful!")
                    time.sleep(1)
                    st.experimental_rerun()
                else:
                    st.error("Update Failed!")
            else:
                if None in data.values():
                    st.error("Fill all fields for New Entry")
                success_msg = add_entry("admin", data)
                if success_msg == "Success":
                    st.success("Addition Successful!")
                    time.sleep(1)
                    st.experimental_rerun()
                else:
                    st.error("Addition Failed!")
                
def delete_Admin():
    with st.expander("Delete from Admin Info"):
        doc_id = st.text_input("Enter AdminID to delete",key="admin_id")
        if st.button("Confirm Delete"):
            msg = delete_entry('admin',{"AdminID":doc_id})
            if msg == "Success":
                st.success("Deletion Successful!")
                time.sleep(1)
                st.experimental_rerun()
            else:
                st.error("Deletion Failed!")
   
def Staff_Admin():
    with st.expander("Filter Staff by Admin"):
        admin_id = st.text_input("Enter AdminID",key="admin_id_filter")
        if st.button("Search STaff"):
            st.subheader("Filtered Staff")
            df_in_filter = staff_by_admin(admin_id)
            st.dataframe(df_in_filter)

Admin()