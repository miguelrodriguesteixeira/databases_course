-------------POPULATE.SQL---------------

-- Populate the customer table
INSERT INTO customer (cust_no, name, email, phone, address)
VALUES
    (1, 'Customer 1', 'customer1@example.com', '123-456-7890', 'Address1'),
    (2, 'Customer 2', 'customer2@example.com', '123-456-7890', 'Address2'),
    (3, 'Customer 3', 'customer3@example.com', '123-456-7890', 'Address3'),
    (4, 'Customer 4', 'customer4@example.com', '123-456-7890', 'Address4'),
    (5, 'Customer 5', 'customer5@example.com', '123-456-7890', 'Address5'),
    (6, 'Customer 6', 'customer6@example.com', '123-456-7890', 'Address6'),
    (7, 'Customer 7', 'customer7@example.com', '123-456-7890', 'Address7'),
    (8, 'Customer 8', 'customer8@example.com', '123-456-7890', 'Address8'),
    (9, 'Customer 9', 'customer9@example.com', '123-456-7890', 'Address9'),
    (10, 'Customer 10', 'customer10@example.com', '123-456-7890', 'Address10');

-- Populate the orders table
INSERT INTO orders (order_no, cust_no, date)
VALUES
    (1, 1, '2023-06-01'),
    (2, 2, '2023-06-02'),
    (3, 3, '2023-06-03'),
    (4, 4, '2023-06-04'),
    (5, 5, '2023-06-05'),
    (6, 6, '2023-06-06'),
    (7, 7, '2023-06-07'),
    (8, 8, '2023-06-08'),
    (9, 9, '2023-06-09'),
    (10, 10, '2023-06-10'),
    (11, 10, '2022-03-03');

-- Populate the pay table
INSERT INTO pay (order_no, cust_no)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

-- Populate the employee table
INSERT INTO employee (ssn, TIN, bdate, name)
VALUES
    ('SSN1', 'TIN1', '1990-01-01', 'Employee 1'),
    ('SSN2', 'TIN2', '1990-01-02', 'Employee 2'),
    ('SSN3', 'TIN3', '1990-01-03', 'Employee 3'),
    ('SSN4', 'TIN4', '1990-01-04', 'Employee 4'),
    ('SSN5', 'TIN5', '1990-01-05', 'Employee 5'),
    ('SSN6', 'TIN6', '1990-01-06', 'Employee 6'),
    ('SSN7', 'TIN7', '1990-01-07', 'Employee 7'),
    ('SSN8', 'TIN8', '1990-01-08', 'Employee 8'),
    ('SSN9', 'TIN9', '1990-01-09', 'Employee 9'),
    ('SSN10', 'TIN10', '1990-01-10', 'Employee 10');

-- Populate the process table
INSERT INTO process (ssn, order_no)
VALUES
    ('SSN1', 1),
    ('SSN2', 2),
    ('SSN3', 3),
    ('SSN4', 4),
    ('SSN5', 5),
    ('SSN6', 6),
    ('SSN7', 7),
    ('SSN8', 8),
    ('SSN9', 9),
    ('SSN10', 10),
    ('SSN10', 11);

-- Populate the department table
INSERT INTO department (name)
VALUES
    ('Department 1'),
    ('Department 2'),
    ('Department 3'),
    ('Department 4'),
    ('Department 5'),
    ('Department 6'),
    ('Department 7'),
    ('Department 8'),
    ('Department 9'),
    ('Department 10');

-- Populate the workplace table
INSERT INTO workplace (address, lat, long)
VALUES
    ('Address1', 1, 1),
    ('Address2', 2, 2),
    ('Address3', 3, 3),
    ('Address4', 4, 4),
    ('Address5', 5, 5),
    ('Address6', 6, 6),
    ('Address7', 7, 7),
    ('Address8', 8, 8),
    ('Address9', 9, 9),
    ('Address10', 10, 10);

-- Populate the office table
INSERT INTO office (address)
VALUES
    ('Address1'),
    ('Address2'),
    ('Address3'),
    ('Address4'),
    ('Address5');


-- Populate the warehouse table
INSERT INTO warehouse (address)
VALUES
    ('Address6'),
    ('Address7'),
    ('Address8'),
    ('Address9'),
    ('Address10');

-- Populate the works table
INSERT INTO works (ssn, name, address)
VALUES
    ('SSN1', 'Department 1', 'Address1'),
    ('SSN2', 'Department 2', 'Address2'),
    ('SSN3', 'Department 3', 'Address3'),
    ('SSN4', 'Department 4', 'Address4'),
    ('SSN5', 'Department 5', 'Address5'),
    ('SSN6', 'Department 6', 'Address6'),
    ('SSN7', 'Department 7', 'Address7'),
    ('SSN8', 'Department 8', 'Address8'),
    ('SSN9', 'Department 9', 'Address9'),
    ('SSN10', 'Department 10', 'Address10');

-- Populate the product table
INSERT INTO product (SKU, name, description, price, ean)
VALUES
    ('SKU1', 'Product 1', 'Description 1', 10.99, 1111111111111),
    ('SKU2', 'Product 2', 'Description 2', 20.99, 2222222222222),
    ('SKU3', 'Product 3', 'Description 3', 30.99, 3333333333333),
    ('SKU4', 'Product 4', 'Description 4', 40.99, 4444444444444),
    ('SKU5', 'Product 5', 'Description 5', 50.99, 5555555555555),
    ('SKU6', 'Product 6', 'Description 6', 60.99, 6666666666666),
    ('SKU7', 'Product 7', 'Description 7', 70.99, 7777777777777),
    ('SKU8', 'Product 8', 'Description 8', 80.99, 8888888888888),
    ('SKU9', 'Product 9', 'Description 9', 90.99, 9999999999999),
    ('SKU10', 'Product 10', 'Description 10', 100.99, 1010101010101);

-- Populate the contains table
INSERT INTO contains (order_no, SKU, qty)
VALUES
    (1, 'SKU1', 5),
    (2, 'SKU2', 3),
    (3, 'SKU3', 7),
    (4, 'SKU4', 2),
    (5, 'SKU5', 4),
    (6, 'SKU6', 6),
    (7, 'SKU7', 1),
    (8, 'SKU8', 9),
    (9, 'SKU9', 8),
    (10, 'SKU10', 10);

-- Populate the supplier table
INSERT INTO supplier (TIN, name, address, SKU, date)
VALUES
    ('TIN1', 'Supplier 1', 'Supplier Address 1', 'SKU1', '2023-06-01'),
    ('TIN2', 'Supplier 2', 'Supplier Address 2', 'SKU2', '2023-06-02'),
    ('TIN3', 'Supplier 3', 'Supplier Address 3', 'SKU3', '2023-06-03'),
    ('TIN4', 'Supplier 4', 'Supplier Address 4', 'SKU4', '2023-06-04'),
    ('TIN5', 'Supplier 5', 'Supplier Address 5', 'SKU5', '2023-06-05'),
    ('TIN6', 'Supplier 6', 'Supplier Address 6', 'SKU6', '2023-06-06'),
    ('TIN7', 'Supplier 7', 'Supplier Address 7', 'SKU7', '2023-06-07'),
    ('TIN8', 'Supplier 8', 'Supplier Address 8', 'SKU8', '2023-06-08'),
    ('TIN9', 'Supplier 9', 'Supplier Address 9', 'SKU9', '2023-06-09'),
    ('TIN10', 'Supplier 10', 'Supplier Address 10', 'SKU10', '2023-06-10');

-- Populate the delivery table
INSERT INTO delivery (address, TIN)
VALUES
    ('Address1', 'TIN1'),
    ('Address2', 'TIN2'),
    ('Address3', 'TIN3'),
    ('Address4', 'TIN4'),
    ('Address5', 'TIN5'),
    ('Address6', 'TIN6'),
    ('Address7', 'TIN7'),
    ('Address8', 'TIN8'),
    ('Address9', 'TIN9'),
    ('Address10', 'TIN10');

--------------------------------------------------------------------------------
