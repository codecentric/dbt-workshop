CREATE TABLE raw.raw_customers AS SELECT * FROM read_csv('sample_data/raw_customers.csv');
CREATE TABLE raw.raw_orders AS SELECT * FROM read_csv('sample_data/raw_orders.csv');
CREATE TABLE raw.raw_payments AS SELECT * FROM read_csv('sample_data/raw_payments.csv');
