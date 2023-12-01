import streamlit as st
import time
from mysql_db import search_entry

def login_page():
    role_state = ""
    if 'auth' not in st.session_state:
        st.session_state.auth = 0

    if st.session_state.auth == 0:
        st.markdown("<style> ul {display: none;} </style>", unsafe_allow_html=True)
        sidebar_widget = st.sidebar.empty()
        sidebar_widget.empty()
        login_page_container = st.empty()
        with login_page_container.container():
            login_page_container.title = st.title("Login")
            role = st.radio("Choose Role", ["admin", "doctor", "staff"], key="role")
            print("role after selection:", role)
            username = st.text_input("Username", key="user")
            if st.button("Login"):
                if role == "admin":
                    list = search_entry(role, {"UserName": username})
                    role_state = role
                elif role == 'doctor':
                    list = search_entry(role, {"DoctorName": username})
                    role_state = role
                elif role == 'staff':
                    list = search_entry(role, {"FirstName": username})
                    role_state = role

                if list == []:
                    st.error("Invalid login credentials. Please try again.")
                    return "No"
                else:
                    st.success(f"Logged in as {username}")
                    time.sleep(1)
                    login_page_container.empty()
                    st.session_state.clear()
                    st.session_state.auth = 1
                    print("before returning:", role_state)
                    return role_state

    # Return a default value if the button is not clicked
    return "No"


# Example usage
if __name__ == "__main__":

    st.write(f"The selected role is: ")
