-- DROP SCHEMA full_stack_ecommerce;

CREATE SCHEMA full_stack_ecommerce AUTHORIZATION postgres;


-- Permissions

GRANT ALL ON SCHEMA full_stack_ecommerce TO postgres;

-- full_stack_ecommerce.product_category definition

-- Drop table

-- DROP TABLE full_stack_ecommerce.product_category;

CREATE TABLE full_stack_ecommerce.product_category (
	id bigserial NOT NULL,
	category_name text NULL,
	CONSTRAINT product_category_pkey PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE full_stack_ecommerce.product_category OWNER TO postgres;
GRANT ALL ON TABLE full_stack_ecommerce.product_category TO postgres;


-- full_stack_ecommerce.product definition

-- Drop table

-- DROP TABLE full_stack_ecommerce.product;

CREATE TABLE full_stack_ecommerce.product (
	id bigserial NOT NULL,
	sku text NULL,
	"name" text NULL,
	description varchar(255) NULL DEFAULT NULL::character varying,
	unit_price numeric(13, 2) NULL DEFAULT NULL::numeric,
	image_url varchar(255) NULL DEFAULT NULL::character varying,
	active bool NULL DEFAULT true,
	units_in_stock int8 NULL,
	date_created timestamp NULL,
	last_updated timestamp NULL,
	category_id int8 NOT NULL,
	CONSTRAINT product_pkey PRIMARY KEY (id),
	CONSTRAINT product_fk FOREIGN KEY (category_id) REFERENCES full_stack_ecommerce.product_category(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Permissions

ALTER TABLE full_stack_ecommerce.product OWNER TO postgres;
GRANT ALL ON TABLE full_stack_ecommerce.product TO postgres;