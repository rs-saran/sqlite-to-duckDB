import duckdb

conn = duckdb.connect("tpch_datawarehouse.duckdb")
# Read the SQL file
with open('downstream_db/DDL.sql', 'r') as file:
    sql_script = file.read()

# Execute the DDL SQL script
conn.execute(sql_script)

# Execute a query to list all tables
result = conn.execute("""
    SELECT table_name
    FROM information_schema.tables
    WHERE table_schema = 'main'
""").fetchall()

# Print the result
for row in result:
    print(row[0])

# Close the connection
conn.close()