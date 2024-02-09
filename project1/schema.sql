DROP TABLE IF EXISTS client CASCADE;
DROP TABLE IF EXISTS order_ CASCADE;
DROP TABLE IF EXISTS sale CASCADE;
DROP TABLE IF EXISTS pay CASCADE;
DROP TABLE IF EXISTS product CASCADE;
DROP TABLE IF EXISTS ean_product CASCADE;
DROP TABLE IF EXISTS contains_ CASCADE;
DROP TABLE IF EXISTS supplier  CASCADE;
DROP TABLE IF EXISTS employee CASCADE;
DROP TABLE IF EXISTS process CASCADE;
DROP TABLE IF EXISTS department CASCADE;
DROP TABLE IF EXISTS workplace CASCADE;
DROP TABLE IF EXISTS office CASCADE;
DROP TABLE IF EXISTS warehouse CASCADE;
DROP TABLE IF EXISTS works CASCADE;
DROP TABLE IF EXISTS delivery CASCADE;

-- Entities

CREATE TABLE client(
    cust_no SERIAL,
    email VARCHAR(254),
    name VARCHAR(80) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    address VARCHAR(255) NOT NULL,
    PRIMARY KEY(cust_no),
    UNIQUE(email),
    CHECK(LENGTH(email) > 5),
    CHECK(LENGTH(phone) > 2)
);

CREATE TABLE order_(
    --!!!!!!!!! Changed the name of the table (Order- order_) because  order is a function of SQL
    order_no SERIAL,
    date DATE NOT NULL, 
    cust_no INTEGER,
    PRIMARY KEY(order_no),
    FOREIGN KEY(cust_no) REFERENCES client(cust_no)
    --RI-1: Every Order (order_no) must exist in the table 'contains' 
);

CREATE TABLE sale(
    order_no INTEGER,
    PRIMARY KEY(order_no),
    FOREIGN KEY(order_no) REFERENCES order_(order_no)
);

CREATE TABLE product(
    sku VARCHAR(12),
    name VARCHAR(80) NOT NULL,
    description VARCHAR(9999) NOT NULL,
    price NUMERIC(16,4) NOT NULL,
    PRIMARY KEY(sku),
    CHECK(LENGTH(sku) > 7)
    --RI-2: Every Product (sku) must exist in the table 'supplier'
);

CREATE TABLE ean_product(
    sku VARCHAR(12),
    ean VARCHAR(13) NOT NULL,
    PRIMARY KEY(sku),
    UNIQUE(ean),
    FOREIGN KEY(sku) REFERENCES product(sku),
    CHECK(LENGTH(sku) > 7),
    CHECK(LENGTH(ean) = 13)
);

CREATE TABLE supplier(
    TIN VARCHAR(12),
    sku VARCHAR(12),
    name VARCHAR(80) NOT NULL,
    address VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    PRIMARY KEY (TIN),
    FOREIGN KEY(sku) REFERENCES product(sku),
    CHECK(LENGTH(sku) > 7),
    CHECK(LENGTH(TIN) > 9)
);

CREATE TABLE employee(
    ssn VARCHAR(11),
    TIN VARCHAR(9),
    bdate DATE NOT NULL,
    name VARCHAR(80) NOT NULL,
    PRIMARY KEY(ssn),
    UNIQUE(TIN),
    CHECK(LENGTH(TIN) = 9),
    CHECK(bdate::text ~  '^\d{4}-\d{2}-\d{2}$')
    -- RI-3: Every Employee (ssn) must exist in the table 'works' 
);

CREATE TABLE department(
    name VARCHAR(200),
    PRIMARY KEY(name)
);

CREATE TABLE workplace(
    address VARCHAR(255),
    lat NUMERIC(8,6),
    long NUMERIC (9,6),
    PRIMARY KEY(address),
    UNIQUE(lat, long)
);

CREATE TABLE office(
    address VARCHAR(255),
    PRIMARY KEY(address),
    FOREIGN KEY(address) REFERENCES workplace(address)
);

CREATE TABLE warehouse(
    address VARCHAR(255),
    PRIMARY KEY(address),
    FOREIGN KEY(address) REFERENCES workplace(address)
);

-- Interactions

CREATE TABLE pay(
    cust_no INTEGER,
    order_no INTEGER,
    PRIMARY KEY(order_no),
    FOREIGN KEY(cust_no) REFERENCES client(cust_no),
    FOREIGN KEY(order_no) REFERENCES sale(order_no)
);

CREATE TABLE contains_(
--!!!!!!!!! Changed the name of the table (contains- pay) because  contains is a function of SQL
    order_no INTEGER,
    sku VARCHAR(12),
    qty INTEGER NOT NULL,
    PRIMARY KEY(order_no, sku),
    FOREIGN KEY(order_no) REFERENCES order_(order_no),
    FOREIGN KEY(sku) REFERENCES product(sku),
    CHECK (LENGTH(sku) > 7)
);

CREATE TABLE process(
    order_no INTEGER,
    ssn VARCHAR(11),
    PRIMARY KEY(order_no, ssn),
    FOREIGN KEY(order_no) REFERENCES order_(order_no),
    FOREIGN KEY(ssn) REFERENCES employee(ssn)
);

CREATE TABLE works(
    address VARCHAR(255),
    ssn VARCHAR(11),
    name VARCHAR(200),
    PRIMARY KEY(address,ssn, name),
    FOREIGN KEY(ssn) REFERENCES employee(ssn),
    FOREIGN KEY(name) REFERENCES department(name),
    FOREIGN KEY(address) REFERENCES workplace(address)
);

ALTER TABLE supplier
ADD CONSTRAINT unique_sku_TIN UNIQUE (sku, TIN);

CREATE TABLE delivery(
    sku VARCHAR(12),
    TIN VARCHAR(12),
    address VARCHAR(255) NOT NULL,
    PRIMARY KEY(sku, TIN, address),
    FOREIGN KEY (address) REFERENCES warehouse(address),
    FOREIGN KEY (TIN, sku) REFERENCES supplier(TIN, sku)
);


