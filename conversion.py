import prompt

import google.generativeai as genai

# Configure the Google AI API
genai.configure(api_key="")

model = genai.GenerativeModel(
    model_name="gemini-1.5-flash",
)


def convert(source_code):

    conversion_prompt = prompt.sql_to_pyspark_prompt(source_code)

    refined_prompt = [
        {
            'role': 'user',
            'parts': [conversion_prompt]
        }
    ]

    response = model.generate_content(refined_prompt)
    # print(response)
    return response.text
