-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-16 15:26:28.91

-- tables
-- Table: client
CREATE TABLE client (
    NIP int  NOT NULL,
    name varchar(50)  NOT NULL,
    address varchar(50)  NOT NULL,
    CONSTRAINT client_pk PRIMARY KEY  (NIP)
);

-- Table: date
CREATE TABLE date (
    date_ID int  NOT NULL,
    full_date date  NOT NULL,
    day int  NOT NULL,
    month int  NOT NULL,
    hour int  NOT NULL,
    CONSTRAINT date_pk PRIMARY KEY  (date_ID)
);

-- Table: fact_sales
CREATE TABLE fact_sales (
    transaction_ID int  NOT NULL,
    fruit_fruit_ID int  NOT NULL,
    order_order_ID int  NOT NULL,
    client_NIP int  NOT NULL,
    date_date_ID int  NOT NULL,
    CONSTRAINT fact_sales_pk PRIMARY KEY  (transaction_ID)
);

-- Table: fruit
CREATE TABLE fruit (
    fruit_ID int  NOT NULL,
    name varchar(50)  NOT NULL,
    category varchar(50)  NOT NULL,
    price_per_kg money  NOT NULL,
    CONSTRAINT fruit_pk PRIMARY KEY  (fruit_ID)
);

-- Table: order
CREATE TABLE "order" (
    order_ID int  NOT NULL,
    amount int  NOT NULL,
    place varchar(50)  NOT NULL,
    total_price money  NOT NULL,
    CONSTRAINT order_pk PRIMARY KEY  (order_ID)
);

-- foreign keys
-- Reference: fact_sales_client (table: fact_sales)
ALTER TABLE fact_sales ADD CONSTRAINT fact_sales_client
    FOREIGN KEY (client_NIP)
    REFERENCES client (NIP);

-- Reference: fact_sales_date (table: fact_sales)
ALTER TABLE fact_sales ADD CONSTRAINT fact_sales_date
    FOREIGN KEY (date_date_ID)
    REFERENCES date (date_ID);

-- Reference: fact_sales_fruit (table: fact_sales)
ALTER TABLE fact_sales ADD CONSTRAINT fact_sales_fruit
    FOREIGN KEY (fruit_fruit_ID)
    REFERENCES fruit (fruit_ID);

-- Reference: fact_sales_order (table: fact_sales)
ALTER TABLE fact_sales ADD CONSTRAINT fact_sales_order
    FOREIGN KEY (order_order_ID)
    REFERENCES "order" (order_ID);

-- sequences
-- Sequence: client_seq
CREATE SEQUENCE client_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: date_seq
CREATE SEQUENCE date_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: fact_sales_seq
CREATE SEQUENCE fact_sales_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: fruit_seq
CREATE SEQUENCE fruit_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: order_seq
CREATE SEQUENCE order_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

