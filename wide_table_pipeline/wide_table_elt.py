import duckdb
from datetime import datetime

def gen_partitionkey():
    return datetime.now().strftime('%Y%m%d_%H%M%S')

partition_key = gen_partitionkey()

# Define the paths to your SQLite and DuckDB databases
sqlite_db_path = 'tpch.db'  # Path to the SQLite database
duckdb_db_path = 'tpch_datawarehouse.duckdb'  # Path to the DuckDB database

conn = duckdb.connect()
conn2 = duckdb.connect(duckdb_db_path) #connect to warehousedb

conn = duckdb.execute("INSTALL sqlite;")
conn = duckdb.execute("LOAD sqlite;")

conn = duckdb.execute(f"ATTACH '{sqlite_db_path}' AS tpch_db")

# Read the extract and transform SQL script
with open('wide_table_pipeline/extract_transform.sql', 'r') as file:
    sql_script = file.read()

sql_script = sql_script.format(partition_key = partition_key)

# Execute extract and transform script
conn.execute(sql_script)

# Load the transformed data into warehouse
conn2.execute(f"COPY tpch_wide_table FROM 'wide_table_pipeline/intermediate_parquet_files/intermediate_{partition_key}.parquet' (FORMAT PARQUET);")



# Close the connection
conn.close()
conn2.close()


