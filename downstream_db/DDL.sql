CREATE TABLE tpch_wide_table (
    
    -- From orders
    o_orderkey INTEGER,
    o_custkey INTEGER,
    o_orderstatus VARCHAR,
    o_totalprice FLOAT,
    o_orderdate VARCHAR,
    o_orderpriority VARCHAR,
    o_clerk VARCHAR,
    o_shippriority INTEGER,
    o_comment VARCHAR,
    
    -- From lineitem
    l_partkey INTEGER,
    l_suppkey INTEGER,
    l_linenumber INTEGER,
    l_quantity FLOAT,
    l_extendedprice FLOAT,
    l_discount FLOAT,
    l_tax FLOAT,
    l_returnflag VARCHAR,
    l_linestatus VARCHAR,
    l_shipdate VARCHAR,
    l_commitdate VARCHAR,
    l_receiptdate VARCHAR,
    l_shipinstruct VARCHAR,
    l_shipmode VARCHAR,
    l_comment VARCHAR,
    
    -- From customer
    c_name VARCHAR,
    c_address VARCHAR,
    c_nationkey INTEGER,
    c_phone VARCHAR,
    c_acctbal FLOAT,
    c_mktsegment VARCHAR,
    c_comment VARCHAR,
    
    -- From nation
    customer_nation_name VARCHAR,
    customer_n_regionkey INTEGER,
    
    -- From supplier
    s_name VARCHAR,
    s_address VARCHAR,
    s_nationkey INTEGER,
    s_phone VARCHAR,
    s_acctbal FLOAT,
    s_comment VARCHAR,
    
    -- From part
    p_name VARCHAR,
    p_mfgr VARCHAR,
    p_brand VARCHAR,
    p_type VARCHAR,
    p_size INTEGER,
    p_container VARCHAR,
    p_retailprice FLOAT,
    p_comment VARCHAR,
    
    -- From partsupp
    ps_availqty INTEGER,
    ps_supplycost FLOAT,
    ps_comment VARCHAR,
    
    -- From region
    region_name VARCHAR,
    region_comment VARCHAR
);


