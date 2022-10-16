-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-16 17:03:34.33

-- tables
-- Table: date
CREATE TABLE date (
    date_ID int  NOT NULL,
    full_date date  NOT NULL,
    day int  NOT NULL,
    month int  NOT NULL,
    year int  NOT NULL,
    CONSTRAINT date_pk PRIMARY KEY  (date_ID)
);

-- Table: fact_warehouse_state
CREATE TABLE fact_warehouse_state (
    ID int  NOT NULL,
    warehouse_ID int  NOT NULL,
    product_ID int  NOT NULL,
    date_ID int  NOT NULL,
    CONSTRAINT fact_warehouse_state_pk PRIMARY KEY  (ID)
);

-- Table: product
CREATE TABLE product (
    product_ID int  NOT NULL,
    name varchar(50)  NOT NULL,
    brand varchar(50)  NOT NULL,
    quantity int  NOT NULL,
    previous_product_ID int  NULL,
    CONSTRAINT product_pk PRIMARY KEY  (product_ID)
);

-- Table: warehouse
CREATE TABLE warehouse (
    warehouse_ID int  NOT NULL,
    address varchar(50)  NOT NULL,
    country varchar(50)  NOT NULL,
    CONSTRAINT warehouse_pk PRIMARY KEY  (warehouse_ID)
);

-- foreign keys
-- Reference: fact_product (table: fact_warehouse_state)
ALTER TABLE fact_warehouse_state ADD CONSTRAINT fact_product
    FOREIGN KEY (product_ID)
    REFERENCES product (product_ID);

-- Reference: fact_warehouse (table: fact_warehouse_state)
ALTER TABLE fact_warehouse_state ADD CONSTRAINT fact_warehouse
    FOREIGN KEY (warehouse_ID)
    REFERENCES warehouse (warehouse_ID);

-- Reference: fact_warehouse_state_date (table: fact_warehouse_state)
ALTER TABLE fact_warehouse_state ADD CONSTRAINT fact_warehouse_state_date
    FOREIGN KEY (date_ID)
    REFERENCES date (date_ID);

-- Reference: product_product (table: product)
ALTER TABLE product ADD CONSTRAINT product_product
    FOREIGN KEY (previous_product_ID)
    REFERENCES product (product_ID);

-- End of file.

