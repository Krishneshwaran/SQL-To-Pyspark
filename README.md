
# 🌀 SQL-To-PySpark Converter

**SQL-To-PySpark** is a Streamlit-based web application that enables you to convert legacy SQL stored procedures into modern PySpark code. It supports multiple database dialects such as Teradata, Oracle, Netezza, and Greenplum.

---

## 🔧 Features

- Upload `.sql` files or paste SQL code directly.
- Select your database dialect (Teradata, Oracle, Netezza, Greenplum).
- Instantly convert legacy SQL procedures into PySpark.
- Clean and readable output with formatting.
- Easy-to-use web interface built with Streamlit.

---

## 📁 Project Structure

```

SQL-To-PySpark/
├── Storeprocedure/            # Sample legacy SQL procedure files
│   ├── greenPlumCode(57).sql
│   ├── netezzaCode(23).sql
│   └── ...
├── source/                   # Core logic modules
│   ├── clean.py              # Post-processing for cleaned PySpark output
│   ├── conversion.py         # Main SQL-to-PySpark conversion logic
│   ├── file\_utils.py         # Handles file uploads and temp storage
│   └── prompt.py             # LLM prompts or transformation logic
├── app.py                    # Streamlit frontend application
├── mysql-connector-8.3.0.jar # (Optional) JDBC connector
├── .gitignore
└── README.md                 # (You are here)

````

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/Krishneshwaran/SQL-To-Pyspark.git
cd SQL-To-Pyspark
````

### 2. Install Dependencies

Create a virtual environment and install required packages:

```bash
python -m venv venv
source venv/bin/activate    # On Windows: venv\Scripts\activate
pip install -r requirements.txt
```

### 3. Run the App

```bash
streamlit run app.py
```

---

## 🧠 How It Works

1. Upload your legacy `.sql` stored procedure.
2. Choose the database type.
3. Click **Convert** to transform SQL into PySpark using internal parsing and formatting logic.
4. View and copy the PySpark output instantly.

---

## 🧩 Supported Dialects

* ✅ Teradata
* ✅ Oracle
* ✅ Netezza
* ✅ Greenplum

---

