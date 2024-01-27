--create keyspace
CREATE KEYSPACE IF NOT EXISTS store WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : '1' };

--change keyspace
ALTER KEYSPACE store WITH replication = {'class': 'SimpleStrategy', 'replication_factor' : '10'};

--delete keyspace
DROP KEYSPACE store;

--create table
CREATE TABLE test(
    name text primary key ,
    date date,
);

--create table (can have clustering order or "complex" primary key)
CREATE TABLE emp(
   emp_id int PRIMARY KEY,
   emp_name text,
   emp_city text,
   emp_sal varint,
   emp_phone varint
);

--change table attributes
ALTER TABLE emp ADD emp_test text;

--delte table
Drop Table emp;

--clean db
TRUNCATE emp;

--insert
INSERT INTO emp (emp_id, emp_name, emp_city, emp_sal, emp_phone) VALUES (1,'jorge','braga',3000,939023312);


-- the where needs to use the complete key (partition + clustering)
UPDATE emp SET emp_city='aveiro',emp_sal=50000 WHERE emp_id=1;


--select
SELECT * FROM emp;


--delete
DELETE FROM emp WHERE emp_id = 1 AND emp_name = 'jorge';
