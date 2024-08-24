# SQLite to DuckDB:

### Overview
This project provides a set of data pipelines designed to transfer data from an SQLite database (OLTP) to a DuckDB database (OLAP). The aim is to facilitate the migration and transformation of transactional data into an analytical format for advanced querying and analysis.

SQLite is used here as the source database where operational data is stored, while DuckDB serves as the destination for data warehousing and analytical processing. This setup enables efficient querying and analysis on large datasets that were originally structured for transaction processing.


| **Attribute**        | **Details**                                  |
|----------------------|----------------------------------------------|
| **Source**           | SQLite3 (OLTP database with TPC-H data)      |
| **Destination**      | DuckDB warehouse                             |
| **Scheduler**        | -                                            |
| **Orchestrator**     | Python native                                |
| **Data Processor**   | DuckDB in Python                             |
| **Data Quality**     | -                                            |
| **Storage**          | File system & DuckDB                         |
| **Visualization**    | -                                            |
| **Monitoring & Alerting** | -                                       |
| **CI/CD**            | -                                            |
| **IAC**              | -                                            |
| **Code Testing**     | -                                            |
| **Linting & Formatting** | -                                        |


## Steps to Set Up and Run the Project

### 1. Create and Manage Python Environment

1. **Create a Python Virtual Environment**:
   
   ```bash
   python3 -m venv sdp_env
   ```

   This command creates a virtual environment named `sdp_env`. 

2. **Activate the Virtual Environment**:

   ```bash
   source sdp_env/bin/activate
   ```

   This command activates the virtual environment. On Windows, use `sdp_env\Scripts\activate` instead.

3. **Deactivate the Virtual Environment**:

   ```bash
   deactivate
   ```

   This command deactivates the virtual environment when you're done working.

### 2. Install DuckDB

1. **Install DuckDB**:

   ```bash
   pip install duckdb
   ```

   This command installs DuckDB, a high-performance analytical database management system.


### 3. Generate Simulated Data

1. **Clone `tpch-dbgen` Repository**:

   ```bash
   git clone https://github.com/electrum/tpch-dbgen.git
   ```

   This command clones the repository used to generate simulated data.

2. **Clean Up Any Existing Data**:

   ```bash
   rm tpch-dbgen/*.tbl
   ```

   This command removes any existing data files in the `tpch-dbgen` directory.

3. **Generate Data Set**:

   ```bash
   cd tpch-dbgen
   make
   ./dbgen -s 1
   cd ..
   ```

   - `make` compiles the data generation tool.
   - `./dbgen -s 1` generates a dataset of approximately 1 GB. Adjust the `-s` parameter for different dataset sizes ( 1 ~ 1GB). 

4. **Store Data in SQLite Database**:

   ```bash
   sqlite3 tpch.db < ./upstream_db/tpch_ddl.sql
   sqlite3 tpch.db < ./upstream_db/insert_data
   ```

   - The first command creates the schema in `tpch.db`.
   - The second command loads the generated data into the SQLite database.

### 4. Setup DuckDB Warehouse

1. **Run the DuckDB Setup Script**:

   ```bash
   python3 downstream_db/downstream_db_setup.py
   ```

   This script sets up the DuckDB warehouse, creating the necessary tables and schema to store the data.

### 5. Write and Run Pipeline Scripts

1. **Create Pipeline Scripts**:

   - Create a directory and write scripts for data transfer to extract data from SQLite, transform it if needed, and load it into DuckDB.

2. **Example Pipeline Script**:

   - For example, you might create a script such as [`wide_table_elt.py`](wide_table_pipeline/wide_table_elt.py) in [`wide_table_pipeline`](wide_table_pipeline/):

3. **Run the Pipeline Script**:

   ```bash
   python wide_table_pipeline/wide_table_elt.py
   ```

   This command runs the pipeline script, transferring data from SQLite to DuckDB.




   ---

   Certainly! Based on your provided details, I'll craft a README file with a fitting name for your project. I'll name it **"OLTP-to-DuckDB ETL Pipeline"**. Here's the README:


