-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-16 16:07:37.86

-- tables
-- Table: employee_rating
CREATE TABLE employee_rating (
    rating_SID int  NOT NULL,
    PESEL nchar(11)  NOT NULL,
    rating int  NOT NULL,
    date date  NOT NULL,
    "current" bit  NOT NULL,
    CONSTRAINT employee_rating_pk PRIMARY KEY  (rating_SID)
);

-- Table: fact_employee
CREATE TABLE fact_employee (
    PESEL nchar(11)  NOT NULL,
    address varchar(50)  NOT NULL,
    salary decimal(10,2)  NOT NULL,
    CONSTRAINT fact_employee_pk PRIMARY KEY  (PESEL)
);

-- foreign keys
-- Reference: employee_rating_fact_employee (table: employee_rating)
ALTER TABLE employee_rating ADD CONSTRAINT employee_rating_fact_employee
    FOREIGN KEY (PESEL)
    REFERENCES fact_employee (PESEL);

-- End of file.

