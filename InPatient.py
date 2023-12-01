from login_page import login_page
from InPatient_view import InPatient
import streamlit as st

login_page()

if st.session_state['auth']==1:
    st.markdown("<style> ul {display: block;} </style>", unsafe_allow_html=True)
    InPatient()
