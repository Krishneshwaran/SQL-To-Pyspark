def clean_pyspark_code(code):
    clean_code = []
    for line in code.split('\n'):
        # Example: Removing comments or markers that start with '#'
        if not line.strip().startswith("```"):  # Ignore comment lines
            clean_code.append(line)
    return "\n".join(clean_code)