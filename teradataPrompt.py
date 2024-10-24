def teradata_to_pyspark_prompt(source_code):
    prompt= """
You are an expert in SQL and PySpark. Your task is to convert the provided Teradata SQL code into Databricks PySpark code. Please follow these guidelines:

1. **Database Connection**:
    - Always use the following block to establish the connection to the MySQL database for all converted PySpark code:

    ```python
    # Import findspark to initialize the Spark environment
    import findspark
    findspark.init()

    # Import necessary libraries from PySpark
    from pyspark.sql import SparkSession
    from pyspark.sql.functions import col, sum, count, expr, date_add, lit

    # Path to the MySQL JDBC driver
    jdbc_driver_path = "mysql-connector-j-8.3.0.jar"

    # Initialize Spark session with MySQL JDBC driver path
    spark = SparkSession.builder \
        .appName("MySQLConnection") \
        .config("spark.jars", jdbc_driver_path) \
        .getOrCreate()

    # JDBC connection properties
    jdbc_url = "jdbc:mysql://localhost:3306/your_database"  # Replace with your database name 
    connection_properties = {{
        "user": "root",
        "password": "root",
        "driver": "com.mysql.cj.jdbc.Driver"
    }}

    # Read data from the Sales table using the jdbc method
    sales_df = spark.read.jdbc(jdbc_url, "Sales", properties=connection_properties)
    
    ```

Date Calculations:

When calculating dates, ensure you retrieve and print actual date values using Spark SQL. For example, to calculate the date 30 days ago:

# Calculate the current date
current_date = expr("current_date()")

# Get the date 30 days ago using SQL
date_30_days_ago = spark.sql("SELECT date_add(current_date(), -30) AS date_30_days_ago").collect()[0][0]


Data Filtering:

Use the computed dates in your filtering conditions to ensure that the logic captures the relevant data. For example:
python

last_month_sales_df = sales_df.filter(col("Sale_Date") >= date_30_days_ago)



2. **Input SQL Code**: 
    - Maintain the logical structure of the original SQL query.
    - Translate Teradata-specific functions and syntax into equivalent PySpark functions.

3. **Output Format**: 
    - Provide only the converted PySpark code.
    - Ensure the code is formatted correctly and ready for execution in Databricks.
    - Avoid any additional explanations, comments, or contextual information—focus solely on the code.

4. **Considerations**: 
    - If there are any Teradata functions without direct PySpark equivalents, provide a clear alternative that achieves the same result.
    - Make sure to include the database connection block as specified above in the converted code.

5. **Date Handling**: 
    - Calculate the current date using PySpark functions, ensuring it aligns with your SQL logic.

Input SQL Code:
{user_sql}

Output: Provide the equivalent Databricks PySpark code.
"""

    return prompt
