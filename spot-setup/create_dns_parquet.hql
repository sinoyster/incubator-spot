
CREATE EXTERNAL TABLE IF NOT EXISTS ${var:dbname}.dns (
frame_time STRING, 
unix_tstamp BIGINT,
frame_len INT,
ip_dst STRING,
ip_src STRING,
dns_qry_name STRING,
dns_qry_class STRING,
dns_qry_type INT,
dns_qry_rcode INT,
dns_a STRING
)
PARTITIONED BY (
y SMALLINT,
m TINYINT,
d TINYINT,
h TINYINT
)
STORED AS PARQUET 
LOCATION '${var:huser}/dns/hive';


CREATE EXTERNAL TABLE ${var:dbname}.dns_dendro (
unix_tstamp BIGINT,
dns_a STRING,
dns_qry_name STRING,
ip_dst STRING
)
PARTITIONED BY (
y SMALLINT,
m TINYINT,
d TINYINT
)
STORED AS PARQUET
LOCATION '${var:huser}/dns/hive/oa/dendro';


CREATE EXTERNAL TABLE ${var:dbname}.dns_edge ( 
unix_tstamp BIGINT,
frame_len BIGINT,
ip_dst STRING,
ip_src STRING,
dns_qry_name STRING,
dns_qry_class STRING,
dns_qry_type INT,
dns_qry_rcode INT,
dns_a STRING,
hh INT,
dns_qry_class_name STRING,
dns_qry_type_name STRING,
dns_qry_rcode_name STRING,
network_context STRING
)
PARTITIONED BY (
y SMALLINT,
m TINYINT,
d TINYINT
)
STORED AS PARQUET
LOCATION '${var:huser}/dns/hive/oa/edge';


CREATE EXTERNAL TABLE ${var:dbname}.dns_ingest_summary ( 
tdate STRING,
total BIGINT
)
PARTITIONED BY (
y SMALLINT,
m TINYINT,
d TINYINT
)
STORED AS PARQUET
LOCATION '${var:huser}/dns/hive/oa/summary';


CREATE EXTERNAL TABLE ${var:dbname}.dns_scores ( 
frame_time STRING, 
unix_tstamp BIGINT,
frame_len BIGINT,
ip_dst STRING, 
dns_qry_name STRING, 
dns_qry_class STRING,
dns_qry_type INT,
dns_qry_rcode INT, 
ml_score FLOAT,
tld STRING,
query_rep STRING,
hh INT,
dns_qry_class_name STRING, 
dns_qry_type_name STRING,
dns_qry_rcode_name STRING, 
network_context STRING 
)
PARTITIONED BY ( 
y SMALLINT,
m TINYINT,
d TINYINT
)
STORED AS PARQUET
LOCATION '${var:huser}/dns/hive/oa/suspicious';


CREATE EXTERNAL TABLE ${var:dbname}.dns_storyboard ( 
ip_threat STRING,
dns_threat STRING, 
title STRING,
text STRING
)
PARTITIONED BY ( 
y SMALLINT,
m TINYINT,
d TINYINT
)
STORED AS PARQUET
LOCATION '${var:huser}/dns/hive/oa/storyboard';


CREATE EXTERNAL TABLE ${var:dbname}.dns_threat_dendro (
anchor STRING, 
total BIGINT,
dns_qry_name STRING, 
ip_dst STRING
)
PARTITIONED BY ( 
y SMALLINT,
m TINYINT,
d TINYINT
)
STORED AS PARQUET
LOCATION '${var:huser}/dns/hive/oa/threat_dendro';


CREATE EXTERNAL TABLE ${var:dbname}.dns_threat_investigation ( 
unix_tstamp BIGINT,
ip_dst STRING, 
dns_qry_name STRING, 
ip_sev INT,
dns_sev INT
)
PARTITIONED BY ( 
y SMALLINT,
m TINYINT,
d TINYINT
)
STORED AS PARQUET
LOCATION '${var:huser}/dns/hive/oa/threat_investigation';
