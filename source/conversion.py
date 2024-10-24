
import source.prompt as prompt
import google.generativeai as genai

# Configure the Google AI API
genai.configure(api_key="AIzaSyDhCQondxMPWo6A4ZfkMJD6iNzvPC3M3_w")

model = genai.GenerativeModel(
    model_name="gemini-1.5-flash",
)

def convert(source_code, database_option):
    # Choose the prompt based on the selected database option
    if database_option == "Teradata":
        conversion_prompt = prompt.teradata_to_pyspark_prompt(source_code)
    elif database_option == "Oracle":
        conversion_prompt = prompt.oracle_to_pyspark_prompt(source_code)
    elif database_option == "Netezza":
        conversion_prompt = prompt.sql_to_pyspark_prompt(source_code)
    elif database_option == "Greenplum":
        conversion_prompt = prompt.greenplum_to_pyspark_prompt(source_code)

    refined_prompt = [
        {
            'role': 'user',
            'parts': [conversion_prompt]
        }
    ]

    response = model.generate_content(refined_prompt)
    return response.text
