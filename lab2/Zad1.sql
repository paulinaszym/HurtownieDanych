-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-16 14:35:03.727

-- tables
-- Table: client_dim
CREATE TABLE client_dim (
    client_ID int  NOT NULL,
    phone varchar(15)  NOT NULL,
    address varchar(50)  NOT NULL,
    firts_name varchar(50)  NOT NULL,
    last_name varchar(50)  NOT NULL,
    CONSTRAINT client_dim_pk PRIMARY KEY  (client_ID)
);

-- Table: date_dim
CREATE TABLE date_dim (
    date_ID int  NOT NULL,
    full_date date  NOT NULL,
    day int  NOT NULL,
    month int  NOT NULL,
    year int  NOT NULL,
    CONSTRAINT date_dim_pk PRIMARY KEY  (date_ID)
);

-- Table: delivery_company_dim
CREATE TABLE delivery_company_dim (
    NIP int  NOT NULL,
    address varchar(50)  NOT NULL,
    name varchar(50)  NOT NULL,
    CONSTRAINT delivery_company_dim_pk PRIMARY KEY  (NIP)
);

-- Table: fact_sales
CREATE TABLE fact_sales (
    transaction_id int  NOT NULL,
    client_ID int  NOT NULL,
    delivery_company_ID int  NOT NULL,
    product_ID int  NOT NULL,
    date_ID int  NOT NULL,
    CONSTRAINT fact_sales_pk PRIMARY KEY  (transaction_id)
);

-- Table: product_dim
CREATE TABLE product_dim (
    ISBN int  NOT NULL,
    publisher varchar(50)  NOT NULL,
    title varchar(50)  NOT NULL,
    autor varchar(50)  NOT NULL,
    number_of_pages int  NOT NULL,
    CONSTRAINT product_dim_pk PRIMARY KEY  (ISBN)
);

-- foreign keys
-- Reference: fact_sales_client_dim (table: fact_sales)
ALTER TABLE fact_sales ADD CONSTRAINT fact_sales_client_dim
    FOREIGN KEY (client_ID)
    REFERENCES client_dim (client_ID);

-- Reference: fact_sales_date_dim (table: fact_sales)
ALTER TABLE fact_sales ADD CONSTRAINT fact_sales_date_dim
    FOREIGN KEY (date_ID)
    REFERENCES date_dim (date_ID);

-- Reference: fact_sales_delivery_company_dim (table: fact_sales)
ALTER TABLE fact_sales ADD CONSTRAINT fact_sales_delivery_company_dim
    FOREIGN KEY (delivery_company_ID)
    REFERENCES delivery_company_dim (NIP);

-- Reference: fact_sales_product_dim (table: fact_sales)
ALTER TABLE fact_sales ADD CONSTRAINT fact_sales_product_dim
    FOREIGN KEY (product_ID)
    REFERENCES product_dim (ISBN);

-- End of file.

