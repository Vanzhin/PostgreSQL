CREATE TABLE products (
  	id SERIAL PRIMARY KEY,
  	name VARCHAR(50) NOT NULL,
  	brand_name_id SMALLINT NOT NULL,
  	catalog_id SMALLINT NOT NULL,
  	created_at TIMESTAMP
);

CREATE TABLE brands (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE catalogs (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

CREATE TYPE main_functions AS (primer BOOL, intermediate BOOL, finish BOOL, internal BOOL);
CREATE TYPE env AS (air BOOL, immersion BOOL,immersion_water BOOL, immersion_soil BOOL, immersion_chem BOOL);
CREATE TYPE substrate AS (steel BOOL, concrete BOOL, hdg BOOL, nf_metal BOOL);


CREATE TABLE main_technical_data (
  	product_id INT NOT NULL,
  	binder_id INT NOT NULL,
  	volume_solid SMALLINT NOT NULL CHECK (volume_solid <= 100),
  	standard_dft SMALLINT DEFAULT NULL,
  	dry_to_touch real DEFAULT NULL,
  	main_functions main_functions DEFAULT (FALSE,FALSE,FALSE,FALSE),
  	treatment_tolerance BOOL DEFAULT FALSE,
  	env env DEFAULT (TRUE,FALSE,FALSE,FALSE,FALSE),
  	substrate substrate DEFAULT (TRUE,FALSE,FALSE,FALSE),
  	min_temp SMALLINT,
  	max_temp 	SMALLINT,
  	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  	updated_at TIMESTAMP DEFAULT NULL
  
);
CREATE TABLE binders (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL

	
);

CREATE TABLE pds (
	product_id INT NOT NULL,
	url VARCHAR(250) NOT NULL UNIQUE
);
CREATE TABLE approved_tests (
	id SERIAL PRIMARY KEY,
 	lab_id INT NOT NULL,
  	system_id INT NOT NULL,
	standard_id INT NOT NULL,
  	comments TEXT DEFAULT NULL,
  	url VARCHAR(250) NOT NULL UNIQUE,
  	issued_at DATE NOT NULL,
  	expires_at DATE DEFAULT NULL
	);
	
CREATE TABLE standards (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);
	
CREATE TABLE coating_systems(
  	id SERIAL PRIMARY KEY,
  	primer_id INT NOT NULL,
  	primer_dft SMALLINT NOT NULL,
  	intermediate_id INT NOT NULL,
  	intermediate_dft SMALLINT NOT NULL,
  	finish_id INT NOT NULL,
  	finish_dft SMALLINT NOT NULL
);	
CREATE TABLE customers (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);
CREATE TABLE contractors (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);
CREATE TABLE projects (
	id SERIAL PRIMARY KEY,
	name VARCHAR NOT NULL,
	customer_id INT NOT NULL,
	contractor_id INT NOT NULL,
	system_ids INT ARRAY,
  	comments TEXT DEFAULT NULL,
  	started_at DATE DEFAULT NULL,
  	finished_at DATE DEFAULT NULL
	);
CREATE TABLE reports (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
  	project_id INT NOT NULL,
  	url VARCHAR(250) NOT NULL UNIQUE,
  	tsr_id SMALLINT NOT NULL,
  	started_at DATE DEFAULT NULL,
  	finished_at DATE DEFAULT NULL,
  	created_at DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  	updated_at DATE DEFAULT NULL
	);
CREATE TABLE tsr (
	id SMALLSERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
  	last_name VARCHAR(50) NOT NULL,
  	email VARCHAR(120) NOT NULL UNIQUE

);

