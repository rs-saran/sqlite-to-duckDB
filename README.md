#Readme

#Objective:
Data pipelines to transfer data from sqlite3 (OLTP) to duckdb (OLAP)

Steps followed:
1. Create python env for simple data pipelines
```bash 
python3 -m venv sdp_env #to create env
source sdp_env/bin/activate #to activate env
deactivate #to deactivate env

```

2. Install duckdb (sqlite3 is part of python standard libraries)
```bash
pip install duckdb # to install duck db
duckdb --version # to check version of duckdb installed
```
3. Genrate simulated data using tpch-dbgen and store it in sqlite3
```bash
git clone https://github.com/electrum/tpch-dbgen.git

 
rm tpch-dbgen/*.tbl #this is to clean up any data (if present) 

# Generate data set of 1 GB size
cd tpch-dbgen
make
./dbgen -s 1 # Change this number to generate a data of desired size (1 ~ 1GB), data will be generated in tpch-dbgen 
cd ..

# store generated data into sqlite3 db
sqlite3 tpch.db < ./upstream_db/tpch_ddl.sql # create tpch db and tables in it
sqlite3 tpch.db < ./upstream_db/insert_data #load the generated data into a tpch sqlite3 db

```
4. write pipeline scripts for the transfer of data to duckdb

