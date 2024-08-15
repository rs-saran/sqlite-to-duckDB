COPY (SELECT

    -- orders table
    o.o_orderkey,
    o.o_custkey,
    o.o_orderstatus,
    o.o_totalprice,
    o.o_orderdate,
    o.o_orderpriority,
    o.o_clerk,
    o.o_shippriority,
    o.o_comment,

    -- lineitem table
    l.l_partkey,
    l.l_suppkey,
    l.l_linenumber,
    l.l_quantity,
    l.l_extendedprice,
    l.l_discount,
    l.l_tax,
    l.l_returnflag,
    l.l_linestatus,
    l.l_shipdate,
    l.l_commitdate,
    l.l_receiptdate,
    l.l_shipinstruct,
    l.l_shipmode,
    l.l_comment,

    -- customer table
    c.c_name,
    c.c_address,
    c.c_nationkey,
    c.c_phone,
    c.c_acctbal,
    c.c_mktsegment,
    c.c_comment,

    -- nation table
    n.n_name,
    n.n_regionkey,

    -- supplier table
    s.s_name,
    s.s_address,
    s.s_nationkey,
    s.s_phone,
    s.s_acctbal,
    s.s_comment,

    -- part table
    p.p_name,
    p.p_mfgr,
    p.p_brand,
    p.p_type,
    p.p_size,
    p.p_container,
    p.p_retailprice,
    p.p_comment,

    -- partsupp table
    ps.ps_availqty,
    ps.ps_supplycost,
    ps.ps_comment,

    -- region table
    r.r_name,
    r.r_comment

FROM tpch_db.orders o
LEFT JOIN tpch_db.customer c ON o.o_custkey = c.c_custkey
LEFT JOIN tpch_db.lineitem l ON o.o_orderkey = l.l_orderkey
LEFT JOIN tpch_db.partsupp ps ON l.l_partkey = ps.ps_partkey AND l.l_suppkey = ps.ps_suppkey
LEFT JOIN tpch_db.supplier s ON ps.ps_suppkey = s.s_suppkey
LEFT JOIN tpch_db.part p ON l.l_partkey = p.p_partkey
LEFT JOIN tpch_db.nation n ON s.s_nationkey = n.n_nationkey
LEFT JOIN tpch_db.region r ON n.n_regionkey = r.r_regionkey) TO "wide_table_pipeline/intermediate_parquet_files/intermediate_{partition_key}.parquet" (COMPRESSION ZSTD) ;
