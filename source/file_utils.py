import os

def save_file_to_temp(uploaded_file):
    """
    Save the uploaded file to the 'temp' directory and return the file path.
    
    Args:
        uploaded_file: The uploaded file object from Streamlit.
        
    Returns:
        str: The path where the file is saved.
    """
    # Create a temporary directory named 'temp'
    temp_dir = os.path.join(os.getcwd(), 'temp')
    os.makedirs(temp_dir, exist_ok=True)
    
    file_path = os.path.join(temp_dir, uploaded_file.name)
    
    # Save the uploaded file in the temp folder
    with open(file_path, "wb") as f:
        f.write(uploaded_file.getbuffer())
    
    return file_path
