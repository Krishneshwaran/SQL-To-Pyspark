import streamlit as st
from source.file_utils import save_file_to_temp
import source.conversion as conversion
import source.clean as clean

def main():
    # Set the page title and layout
    st.set_page_config(page_title="Legacy Code Converter", layout="wide")

    st.title("Legacy Code Converter")
    st.write("Upload your legacy SQL code and convert it to PySpark format.")

    # Dropdown to select the database
    database_option = st.selectbox(
        "Select the database type:",
        ("Teradata", "Oracle", "Netezza", "Greenplum")
    )

    # File uploader at the top
    uploaded_file = st.file_uploader("Upload your .sql file", type=["sql"])

    # Add some space
    st.markdown("###")

    # Initialize source_code variable
    source_code = ""

    # Create a two-column layout for the source and converted code in the middle
    col1, col2 = st.columns([1, 1])  # Adjust the ratio if needed

    with col1:
        st.subheader("Source Code")
        # Display the content of the uploaded file as a code snippet or allow typing code manually
        if uploaded_file is not None:
            file_path = save_file_to_temp(uploaded_file)
            with open(file_path, "r") as f:
                source_code = f.read()
            st.code(source_code, language='sql')  # Display uploaded file as code snippet
        else:
            source_code_text = st.text_area("Paste or type your code here...", height=300)
            if source_code_text:
                source_code = source_code_text  # Assign text area input to source_code

    with col2:
        st.subheader("Converted Code")

        # Show the conversion result as a code snippet
        if 'conversion_result' in st.session_state and st.session_state.conversion_result:
            st.code(st.session_state.conversion_result, language='python')  # Display code in a code box
        else:
            st.write("Converted code will appear here...")  # Placeholder message

    # Convert button below the code sections
    if st.button("Convert", key='convert_button'):
        if source_code:  # Check if source_code is not empty
            response = conversion.convert(source_code, database_option)  # Pass the selected option to conversion
            st.session_state.conversion_result = clean.clean_pyspark_code(response)
            st.success("Conversion successful!")
        else:
            st.error("Please upload a file or paste code before converting.")

if __name__ == "__main__":
    main()
