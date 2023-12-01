import streamlit as st
from login_page import login_page

login_page()

if st.session_state.auth == 1:
    st.title("Room tables")
