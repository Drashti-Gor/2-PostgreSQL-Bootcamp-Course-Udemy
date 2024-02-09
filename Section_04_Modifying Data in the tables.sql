--create test table called 'customers'

CREATE TABLE customers(

	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(150),
	age INT
);

--insert single row

INSERT INTO customers (first_name,last_name,email,age)
VALUES ('Drashti','gor','abc@g.com',21);

--insert multiple rows

INSERT INTO customers (first_name,last_name)
VALUES 
('Aamena','Mulla'),
('Helly','Patel');

--use 'RETURNING' to get info on return rows

INSERT INTO customers(first_name,last_name)
VALUES ('John','Smith') RETURNING * ;

--return a single column value

INSERT INTO customers(first_name,last_name)
VALUES ('Joseph','S.') RETURNING customer_id;

--update single column

UPDATE customers
SET email = 'xyz@g.com'
WHERE customer_id = 2;

-- update multiple column

UPDATE customers
SET 
email = 'pqr@g.com',
age = 20
WHERE customer_id = 3;

--update all records in a table

UPDATE customers
SET is_enable = 'Y'

--delete records from table

DELETE FROM customers
WHERE customer_id = 5

SELECT * FROM customers;


--using UPSERT

CREATE TABLE t_tags(
	id SERIAL PRIMARY KEY,
	tag TEXT UNIQUE,
	update_date TIMESTAMP DEFAULT NOW()
);

INSERT INTO t_tags (tag)
VALUES ('Pen'),('Pencil');

--on conflict do nothing

INSERT INTO t_tags (tag)
VALUES  ('Pen')
ON CONFLICT (tag)
DO
	NOTHING;	

--on conflict set new values

INSERT INTO t_tags (tag)
VALUES  ('Pen')
ON CONFLICT (tag)
DO
	UPDATE SET
	tag = EXCLUDED.tag || '1',
	update_date = NOW();

SELECT * FROM t_tags;