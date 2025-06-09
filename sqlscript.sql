REM   Script: ALBaik_Final
REM   The project after implementation 

CREATE TABLE customer ( 
    cus_id VARCHAR2(20) PRIMARY KEY, 
    cus_name VARCHAR2(100), 
    cus_city VARCHAR2(50), 
    cus_street VARCHAR2(50), 
    cus_phone VARCHAR2(20) 
);

CREATE TABLE employee ( 
    emp_id VARCHAR2(20) PRIMARY KEY, 
    emp_name VARCHAR2(100), 
    emp_gender VARCHAR2(10), 
    emp_salary NUMBER, 
    emp_position VARCHAR2(50), 
    emp_start_date DATE, 
    emp_phone VARCHAR2(20) 
);

CREATE TABLE customer_order ( 
    order_id VARCHAR2(20) PRIMARY KEY, 
    cus_id VARCHAR2(20), 
    order_cost NUMBER, 
    order_date DATE, 
    payment_type VARCHAR2(30), 
    FOREIGN KEY (cus_id) REFERENCES customer(cus_id) 
);

CREATE TABLE product ( 
    pro_id VARCHAR2(20) PRIMARY KEY, 
    pro_name VARCHAR2(100), 
    pro_type VARCHAR2(50), 
    pro_price NUMBER, 
    pro_amount NUMBER, 
    pro_exp_date DATE, 
    pro_is_available VARCHAR2(5) -- or BOOLEAN if supported 
);

CREATE TABLE storage ( 
    placement_no VARCHAR2(20) PRIMARY KEY, 
    storage_capacity NUMBER, 
    storage_type VARCHAR2(50) 
);

CREATE TABLE delivery_person ( 
    delivery_person_id VARCHAR2(20) PRIMARY KEY, 
    delivery_person_name VARCHAR2(100), 
    contact_phone VARCHAR2(20) 
);

CREATE TABLE delivery ( 
    delivery_id VARCHAR2(20) PRIMARY KEY, 
    delivery_person_id VARCHAR2(20), 
    delivery_date DATE, 
    delivery_company_name VARCHAR2(100), 
    FOREIGN KEY (delivery_person_id) REFERENCES delivery_person(delivery_person_id) 
);

CREATE TABLE order_employee ( 
    emp_id VARCHAR2(20), 
    order_id VARCHAR2(20), 
    PRIMARY KEY (emp_id, order_id), 
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id), 
    FOREIGN KEY (order_id) REFERENCES customer_order(order_id) 
);

CREATE TABLE pro_order ( 
    order_id VARCHAR2(20), 
    pro_id VARCHAR2(20), 
    quantity NUMBER, 
    PRIMARY KEY (order_id, pro_id), 
    FOREIGN KEY (order_id) REFERENCES customer_order(order_id), 
    FOREIGN KEY (pro_id) REFERENCES product(pro_id) 
);

INSERT INTO customer (cus_id, cus_name, cus_city, cus_street, cus_phone) VALUES ('C001', 'Ahmed Ali', 'Jeddah', 'Prince Sultan St', '0501234567');

INSERT INTO customer (cus_id, cus_name, cus_city, cus_street, cus_phone) VALUES ('C002', 'Fatima Khan', 'Jeddah', 'King Abdulaziz Rd', '0557654321');

INSERT INTO customer (cus_id, cus_name, cus_city, cus_street, cus_phone) VALUES ('C003', 'Khalid Salem', 'Makkah', 'Al Haram St', '0569876543');

INSERT INTO customer (cus_id, cus_name, cus_city, cus_street, cus_phone) VALUES ('C004', 'Noura Abdullah', 'Jeddah', 'An Nahda Dist', '0541122334');

INSERT INTO customer (cus_id, cus_name, cus_city, cus_street, cus_phone) VALUES ('C005', 'Saad Mohammed', 'Makkah', 'Al Aziziyah', '0535566778');

INSERT INTO customer (cus_id, cus_name, cus_city, cus_street, cus_phone) VALUES ('C006', 'Layla Essa', 'Jeddah', 'Al Salamah Dist', '0509988776');

INSERT INTO employee (emp_id, emp_name, emp_gender, emp_salary, emp_position, emp_start_date, emp_phone) VALUES ('E001', 'Omar Hassan', 'Male', 6000, 'Manager', TO_DATE('2020-01-15', 'YYYY-MM-DD'), '0502233445');

INSERT INTO employee (emp_id, emp_name, emp_gender, emp_salary, emp_position, emp_start_date, emp_phone) VALUES ('E002', 'Sara Mahmoud', 'Female', 4500, 'Cashier', TO_DATE('2021-05-20', 'YYYY-MM-DD'), '0554433221');

INSERT INTO employee (emp_id, emp_name, emp_gender, emp_salary, emp_position, emp_start_date, emp_phone) VALUES ('E003', 'Yousef Ahmed', 'Male', 5000, 'Chef', TO_DATE('2019-11-10', 'YYYY-MM-DD'), '0567788990');

INSERT INTO employee (emp_id, emp_name, emp_gender, emp_salary, emp_position, emp_start_date, emp_phone) VALUES ('E004', 'Aisha Faisal', 'Female', 4000, 'Waiter', TO_DATE('2022-03-01', 'YYYY-MM-DD'), '0548877665');

INSERT INTO employee (emp_id, emp_name, emp_gender, emp_salary, emp_position, emp_start_date, emp_phone) VALUES ('E005', 'Bandar Turki', 'Male', 4800, 'Chef', TO_DATE('2021-08-25', 'YYYY-MM-DD'), '0531122334');

INSERT INTO employee (emp_id, emp_name, emp_gender, emp_salary, emp_position, emp_start_date, emp_phone) VALUES ('E006', 'Huda Nasser', 'Female', 4200, 'Waiter', TO_DATE('2023-01-18', 'YYYY-MM-DD'), '0503344556');

INSERT INTO storage (placement_no, storage_capacity, storage_type) VALUES ('S001', 500, 'Fridge');

INSERT INTO storage (placement_no, storage_capacity, storage_type) VALUES ('S002', 1000, 'Shelf');

INSERT INTO storage (placement_no, storage_capacity, storage_type) VALUES ('S003', 300, 'Freezer');

INSERT INTO storage (placement_no, storage_capacity, storage_type) VALUES ('S004', 750, 'Shelf');

INSERT INTO storage (placement_no, storage_capacity, storage_type) VALUES ('S005', 400, 'Fridge');

INSERT INTO storage (placement_no, storage_capacity, storage_type) VALUES ('S006', 200, 'Freezer');

INSERT INTO delivery_person (delivery_person_id, delivery_person_name, contact_phone) VALUES ('DP001', 'Fahad Saad', '0501112222');

INSERT INTO delivery_person (delivery_person_id, delivery_person_name, contact_phone) VALUES ('DP002', 'Majed Abdullah', '0553334444');

INSERT INTO delivery_person (delivery_person_id, delivery_person_name, contact_phone) VALUES ('DP003', 'Nawaf Khalid', '0565556666');

INSERT INTO delivery_person (delivery_person_id, delivery_person_name, contact_phone) VALUES ('DP004', 'Salem Nasser', '0547778888');

INSERT INTO delivery_person (delivery_person_id, delivery_person_name, contact_phone) VALUES ('DP005', 'Tariq Essa', '0539990000');

INSERT INTO delivery_person (delivery_person_id, delivery_person_name, contact_phone) VALUES ('DP006', 'Yaser Mohammed', '0500011223');

INSERT INTO customer_order (order_id, cus_id, order_cost, order_date, payment_type) VALUES ('OR001', 'C001', 75.50, TO_DATE('2024-04-26', 'YYYY-MM-DD'), 'Credit Card');

INSERT INTO customer_order (order_id, cus_id, order_cost, order_date, payment_type) VALUES ('OR002', 'C002', 120.00, TO_DATE('2024-04-26', 'YYYY-MM-DD'), 'Cash');

INSERT INTO customer_order (order_id, cus_id, order_cost, order_date, payment_type) VALUES ('OR003', 'C003', 95.75, TO_DATE('2024-04-25', 'YYYY-MM-DD'), 'Credit Card');

INSERT INTO customer_order (order_id, cus_id, order_cost, order_date, payment_type) VALUES ('OR004', 'C001', 50.00, TO_DATE('2024-04-25', 'YYYY-MM-DD'), 'Cash');

INSERT INTO customer_order (order_id, cus_id, order_cost, order_date, payment_type) VALUES ('OR005', 'C004', 150.20, TO_DATE('2024-04-26', 'YYYY-MM-DD'), 'Credit Card');

INSERT INTO customer_order (order_id, cus_id, order_cost, order_date, payment_type) VALUES ('OR006', 'C005', 88.00, TO_DATE('2024-04-24', 'YYYY-MM-DD'), 'Cash');

INSERT INTO product (pro_id, pro_name, pro_type, pro_price, pro_amount, pro_exp_date, pro_is_available) VALUES ('P001', 'Chicken Meal (4 pcs)', 'Main Course', 15.00, 100, TO_DATE('2024-05-10', 'YYYY-MM-DD'), 'TRUE');

INSERT INTO product (pro_id, pro_name, pro_type, pro_price, pro_amount, pro_exp_date, pro_is_available) VALUES ('P002', 'Fries (Large)', 'Side', 7.50, 250, TO_DATE('2024-06-01', 'YYYY-MM-DD'), 'TRUE');

INSERT INTO product (pro_id, pro_name, pro_type, pro_price, pro_amount, pro_exp_date, pro_is_available) VALUES ('P003', 'Coleslaw', 'Side', 5.00, 150, TO_DATE('2024-05-05', 'YYYY-MM-DD'), 'TRUE');

INSERT INTO product (pro_id, pro_name, pro_type, pro_price, pro_amount, pro_exp_date, pro_is_available) VALUES ('P004', 'Shrimp Meal (10 pcs)', 'Main Course', 25.00, 80, TO_DATE('2024-05-12', 'YYYY-MM-DD'), 'TRUE');

INSERT INTO product (pro_id, pro_name, pro_type, pro_price, pro_amount, pro_exp_date, pro_is_available) VALUES ('P005', 'Orange Juice', 'Drink', 6.00, 300, TO_DATE('2024-07-15', 'YYYY-MM-DD'), 'TRUE');

INSERT INTO product (pro_id, pro_name, pro_type, pro_price, pro_amount, pro_exp_date, pro_is_available) VALUES ('P006', 'Water', 'Drink', 2.00, 500, TO_DATE('2025-01-01', 'YYYY-MM-DD'), 'TRUE');

INSERT INTO delivery (delivery_id, delivery_person_id, delivery_date, delivery_company_name) VALUES ('D001', 'DP001', TO_DATE('2024-04-26', 'YYYY-MM-DD'), 'Al Baik Delivery');

INSERT INTO delivery (delivery_id, delivery_person_id, delivery_date, delivery_company_name) VALUES ('D002', 'DP002', TO_DATE('2024-04-26', 'YYYY-MM-DD'), 'Al Baik Delivery');

INSERT INTO delivery (delivery_id, delivery_person_id, delivery_date, delivery_company_name) VALUES ('D003', 'DP003', TO_DATE('2024-04-25', 'YYYY-MM-DD'), 'Al Baik Delivery');

INSERT INTO delivery (delivery_id, delivery_person_id, delivery_date, delivery_company_name) VALUES ('D004', 'DP001', TO_DATE('2024-04-25', 'YYYY-MM-DD'), 'Al Baik Delivery');

INSERT INTO delivery (delivery_id, delivery_person_id, delivery_date, delivery_company_name) VALUES ('D005', 'DP004', TO_DATE('2024-04-26', 'YYYY-MM-DD'), 'Al Baik Delivery');

INSERT INTO delivery (delivery_id, delivery_person_id, delivery_date, delivery_company_name) VALUES ('D006', 'DP005', TO_DATE('2024-04-24', 'YYYY-MM-DD'), 'Al Baik Delivery');

INSERT INTO order_employee (emp_id, order_id) VALUES ('E002', 'OR001'); -- Cashier handled order 1 
INSERT INTO order_employee (emp_id, order_id) VALUES ('E004', 'OR002'); -- Waiter handled order 2 
INSERT INTO order_employee (emp_id, order_id) VALUES ('E002', 'OR003'); -- Cashier handled order 3 
INSERT INTO order_employee (emp_id, order_id) VALUES ('E006', 'OR004'); -- Waiter handled order 4 
INSERT INTO order_employee (emp_id, order_id) VALUES ('E002', 'OR005'); -- Cashier handled order 5 
INSERT INTO order_employee (emp_id, order_id) VALUES ('E004', 'OR006'); -- Waiter handled order 6 
INSERT INTO order_employee (emp_id, order_id) VALUES ('E003', 'OR001'); -- Chef involved in order 1 preparation 
INSERT INTO order_employee (emp_id, order_id) VALUES ('E005', 'OR002'); -- Chef involved in order 2 preparation 
 
-- Inserting data into the pro_order table (at least 5 rows) 
-- Ensure order_id exists in the customer_order table and pro_id exists in the product table 
INSERT INTO pro_order (order_id, pro_id, quantity) VALUES ('OR001', 'P001', 1); -- Order 1 contains 1 Chicken Meal 
INSERT INTO pro_order (order_id, pro_id, quantity) VALUES ('OR001', 'P002', 1); -- Order 1 contains 1 Large Fries 
INSERT INTO pro_order (order_id, pro_id, quantity) VALUES ('OR001', 'P005', 2); -- Order 1 contains 2 Orange Juice 
INSERT INTO pro_order (order_id, pro_id, quantity) VALUES ('OR002', 'P004', 2); -- Order 2 contains 2 Shrimp Meal 
INSERT INTO pro_order (order_id, pro_id, quantity) VALUES ('OR002', 'P003', 1); -- Order 2 contains 1 Coleslaw 
INSERT INTO pro_order (order_id, pro_id, quantity) VALUES ('OR003', 'P001', 1); -- Order 3 contains 1 Chicken Meal 
INSERT INTO pro_order (order_id, pro_id, quantity) VALUES ('OR003', 'P002', 2); -- Order 3 contains 2 Large Fries 
INSERT INTO pro_order (order_id, pro_id, quantity) VALUES ('OR004', 'P001', 1); -- Order 4 contains 1 Chicken Meal 
INSERT INTO pro_order (order_id, pro_id, quantity) VALUES ('OR005', 'P004', 1); -- Order 5 contains 1 Shrimp Meal 
INSERT INTO pro_order (order_id, pro_id, quantity) VALUES ('OR005', 'P002', 1); -- Order 5 contains 1 Large Fries 
INSERT INTO pro_order (order_id, pro_id, quantity) VALUES ('OR005', 'P003', 1); -- Order 5 contains 1 Coleslaw 
INSERT INTO pro_order (order_id, pro_id, quantity) VALUES ('OR006', 'P001', 1); -- Order 6 contains 1 Chicken Meal 
INSERT INTO pro_order (order_id, pro_id, quantity) VALUES ('OR006', 'P005', 1); -- Order 6 contains 1 Orange Juice 
 

COMMIT;

COMMIT;

SELECT 
    cus_id, 
    cus_name, 
    cus_street, 
    cus_phone 
FROM 
    customer 
WHERE 
    cus_city = 'Jeddah' 
ORDER BY 
    cus_name;

SELECT 
    p.pro_name, 
    po.quantity 
FROM 
    customer_order co 
JOIN 
    pro_order po ON co.order_id = po.order_id 
JOIN 
    product p ON po.pro_id = p.pro_id 
WHERE 
    co.order_id = 'OR001';

SELECT 
    p.pro_name, 
    po.quantity 
FROM 
    customer_order co 
JOIN 
    pro_order po ON co.order_id = po.order_id 
JOIN 
    product p ON po.pro_id = p.pro_id 
WHERE 
    co.order_id = 'OR001';

SELECT 
    p.pro_name, 
    po.quantity 
FROM 
    customer_order co 
JOIN 
    pro_order po ON co.order_id = po.order_id 
JOIN 
    product p ON po.pro_id = p.pro_id 
WHERE 
    co.order_id = 'OR001';

SELECT 
    p.pro_name, 
    po.quantity 
FROM 
    customer_order co 
JOIN 
    pro_order po ON co.order_id = po.order_id 
WHERE 
    co.order_id = 'OR001';

SELECT 
    pro_name, 
    quantity 
FROM 
    customer_order co 
JOIN 
    pro_order ON order_id = order_id 
WHERE 
    co.order_id = 'OR001';

SELECT 
    p.pro_name, 
    po.quantity 
FROM 
    customer_order co 
JOIN 
    pro_order po ON co.order_id = po.order_id 
JOIN 
    product p ON po.pro_id = p.pro_id 
;

SELECT 
    p.pro_name, 
    po.quantity 
FROM 
    customer_order co 
JOIN 
    pro_order po ON co.order_id = po.order_id 
JOIN 
    product p ON po.pro_id = p.pro_id 
;

SELECT * FROM customer;

SELECT 
    product.pro_name, 
    pro_order.quantity 
FROM 
    customer_order 
JOIN 
    pro_order po ON co.order_id = po.order_id 
JOIN 
    product p ON po.pro_id = p.pro_id 
WHERE 
    customer_order.order_id = 'OR001';

pro_order


pro_order


SELECT 
    product.pro_name, 
    pro_order.quantity 
FROM 
    customer_order 
JOIN 
    pro_order po ON customer_order.order_id = pro_order.order_id 
JOIN 
    product ON po.pro_id = product.pro_id 
WHERE 
    customer_order.order_id = 'OR001';

SELECT 
    product.pro_name, 
    pro_order.quantity 
FROM 
    customer_order 
JOIN 
    pro_order ON customer_order.order_id = pro_order.order_id 
JOIN 
    product ON pro_order.pro_id = product.pro_id 
WHERE 
    customer_order.order_id = 'OR001';

SELECT 
    product.pro_name, 
    pro_order.quantity 
FROM 
    customer_order 
JOIN 
    pro_order ON customer_order.order_id = pro_order.order_id 
JOIN 
    product ON pro_order.pro_id = product.pro_id 
WHERE 
    customer_order.order_id = 'OR001';

SELECT 
    product.pro_name, 
    pro_order.quantity 
FROM 
    customer_order 
JOIN 
    pro_order ON customer_order.order_id = pro_order.order_id 
JOIN 
    product ON pro_order.pro_id = product.pro_id 
WHERE 
    customer_order.order_id = 'OR001';

SELECT 
    co.order_id, -- Added order_id to see which order the product belongs to 
    p.pro_name, 
    po.quantity 
FROM 
    customer_order co 
JOIN 
    pro_order po ON co.order_id = po.order_id 
JOIN 
    product p ON po.pro_id = p.pro_id 
ORDER BY 
    co.order_id, p.pro_name; -- Added ordering for better readability;

SELECT 
    co.order_id, -- Added order_id to see which order the product belongs to 
    p.pro_name, 
    po.quantity 
FROM 
    customer_order co 
JOIN 
    pro_order po ON co.order_id = po.order_id 
JOIN 
    product p ON po.pro_id = p.pro_id 
ORDER BY 
    co.order_id, p.pro_name; -- Added ordering for better readability;

SELECT 
    co.order_id, -- Added order_id to see which order the product belongs to 
    p.pro_name, 
    po.quantity 
FROM 
    customer_order co 
JOIN 
    pro_order po ON co.order_id = po.order_id 
JOIN 
    product p ON po.pro_id = p.pro_id 
ORDER BY 
    co.order_id, p.pro_name; -- Added ordering for better readability;

SELECT 
    co.order_id, -- Added order_id to see which order the product belongs to 
    p.pro_name, 
    po.quantity 
FROM 
    customer_order co 
JOIN 
    pro_order po ON co.order_id = po.order_id 
JOIN 
    product p ON po.pro_id = p.pro_id 
ORDER BY 
    co.order_id; -- Added ordering for better readability;

SELECT 
    co.order_id, -- Added order_id to see which order the product belongs to 
    p.pro_name, 
    po.quantity 
FROM 
    customer_order co 
JOIN 
    pro_order po ON co.order_id = po.order_id 
JOIN 
    product p ON po.pro_id = p.pro_id 
ORDER BY 
    co.order_id; -- Added ordering for better readability;

SELECT 
    co.order_id, -- Added order_id to see which order the product belongs to 
    p.pro_name, 
    po.quantity;

FROM 


    customer_order co 


JOIN 


    pro_order po ON co.order_id = po.order_id 


JOIN 


    product p ON po.pro_id = p.pro_id 


ORDER BY 


    co.order_id; -- Added ordering for better readability


SELECT 
    co.order_id, -- Added order_id to see which order the product belongs to 
    p.pro_name, 
    po.quantity 
FROM 
    customer_order co 
JOIN 
    pro_order po ON co.order_id = po.order_id 
JOIN 
    product p ON po.pro_id = p.pro_id 
ORDER BY 
    co.order_id, p.pro_name; -- Added ordering for better readability;

SELECT 
    co.order_id, -- Added order_id to see which order the product belongs to 
    p.pro_name, 
    po.quantity 
FROM 
    customer_order co 
JOIN 
    pro_order po ON co.order_id = po.order_id 
JOIN 
    product p ON po.pro_id = p.pro_id 
;

SELECT 
    co.order_id, -- Added order_id to see which order the product belongs to 
    p.pro_name, 
    po.quantity 
FROM 
    customer_order co 
JOIN 
    pro_order po ON co.order_id = po.order_id 
JOIN 
    product p ON po.pro_id = p.pro_id 
;

CREATE TABLE customer ( 
    cus_id VARCHAR2(20) PRIMARY KEY, 
    cus_name VARCHAR2(100), 
    cus_city VARCHAR2(50), 
    cus_street VARCHAR2(50), 
    cus_phone VARCHAR2(20) 
);

CREATE TABLE employee ( 
    emp_id VARCHAR2(20) PRIMARY KEY, 
    emp_name VARCHAR2(100), 
    emp_gender VARCHAR2(10), 
    emp_salary NUMBER, 
    emp_position VARCHAR2(50), 
    emp_start_date DATE, 
    emp_phone VARCHAR2(20) 
);

CREATE TABLE customer_order ( 
    order_id VARCHAR2(20) PRIMARY KEY, 
    cus_id VARCHAR2(20), 
    order_cost NUMBER, 
    order_date DATE, 
    payment_type VARCHAR2(30), 
    FOREIGN KEY (cus_id) REFERENCES customer(cus_id) 
);

CREATE TABLE product ( 
    pro_id VARCHAR2(20) PRIMARY KEY, 
    pro_name VARCHAR2(100), 
    pro_type VARCHAR2(50), 
    pro_price NUMBER, 
    pro_amount NUMBER, 
    pro_exp_date DATE, 
    pro_is_available VARCHAR2(5) -- or BOOLEAN if supported 
);

CREATE TABLE storage ( 
    placement_no VARCHAR2(20) PRIMARY KEY, 
    storage_capacity NUMBER, 
    storage_type VARCHAR2(50) 
);

CREATE TABLE delivery_person ( 
    delivery_person_id VARCHAR2(20) PRIMARY KEY, 
    delivery_person_name VARCHAR2(100), 
    contact_phone VARCHAR2(20) 
);

CREATE TABLE delivery ( 
    delivery_id VARCHAR2(20) PRIMARY KEY, 
    delivery_person_id VARCHAR2(20), 
    delivery_date DATE, 
    delivery_company_name VARCHAR2(100), 
    FOREIGN KEY (delivery_person_id) REFERENCES delivery_person(delivery_person_id) 
);

CREATE TABLE order_employee ( 
    emp_id VARCHAR2(20), 
    order_id VARCHAR2(20), 
    PRIMARY KEY (emp_id, order_id), 
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id), 
    FOREIGN KEY (order_id) REFERENCES customer_order(order_id) 
);

CREATE TABLE pro_order ( 
    order_id VARCHAR2(20), 
    pro_id VARCHAR2(20), 
    quantity NUMBER, 
    PRIMARY KEY (order_id, pro_id), 
    FOREIGN KEY (order_id) REFERENCES customer_order(order_id), 
    FOREIGN KEY (pro_id) REFERENCES product(pro_id) 
);

INSERT INTO customer (cus_id, cus_name, cus_city, cus_street, cus_phone) VALUES ('C001', 'Ahmed Ali', 'Jeddah', 'Prince Sultan St', '0501234567');

INSERT INTO customer (cus_id, cus_name, cus_city, cus_street, cus_phone) VALUES ('C002', 'Fatima Khan', 'Jeddah', 'King Abdulaziz Rd', '0557654321');

INSERT INTO customer (cus_id, cus_name, cus_city, cus_street, cus_phone) VALUES ('C003', 'Khalid Salem', 'Makkah', 'Al Haram St', '0569876543');

INSERT INTO customer (cus_id, cus_name, cus_city, cus_street, cus_phone) VALUES ('C004', 'Noura Abdullah', 'Jeddah', 'An Nahda Dist', '0541122334');

INSERT INTO customer (cus_id, cus_name, cus_city, cus_street, cus_phone) VALUES ('C005', 'Saad Mohammed', 'Makkah', 'Al Aziziyah', '0535566778');

INSERT INTO customer (cus_id, cus_name, cus_city, cus_street, cus_phone) VALUES ('C006', 'Layla Essa', 'Jeddah', 'Al Salamah Dist', '0509988776');

INSERT INTO employee (emp_id, emp_name, emp_gender, emp_salary, emp_position, emp_start_date, emp_phone) VALUES ('E001', 'Omar Hassan', 'Male', 6000, 'Manager', TO_DATE('2020-01-15', 'YYYY-MM-DD'), '0502233445');

INSERT INTO employee (emp_id, emp_name, emp_gender, emp_salary, emp_position, emp_start_date, emp_phone) VALUES ('E002', 'Sara Mahmoud', 'Female', 4500, 'Cashier', TO_DATE('2021-05-20', 'YYYY-MM-DD'), '0554433221');

INSERT INTO employee (emp_id, emp_name, emp_gender, emp_salary, emp_position, emp_start_date, emp_phone) VALUES ('E003', 'Yousef Ahmed', 'Male', 5000, 'Chef', TO_DATE('2019-11-10', 'YYYY-MM-DD'), '0567788990');

INSERT INTO employee (emp_id, emp_name, emp_gender, emp_salary, emp_position, emp_start_date, emp_phone) VALUES ('E004', 'Aisha Faisal', 'Female', 4000, 'Waiter', TO_DATE('2022-03-01', 'YYYY-MM-DD'), '0548877665');

INSERT INTO employee (emp_id, emp_name, emp_gender, emp_salary, emp_position, emp_start_date, emp_phone) VALUES ('E005', 'Bandar Turki', 'Male', 4800, 'Chef', TO_DATE('2021-08-25', 'YYYY-MM-DD'), '0531122334');

INSERT INTO employee (emp_id, emp_name, emp_gender, emp_salary, emp_position, emp_start_date, emp_phone) VALUES ('E006', 'Huda Nasser', 'Female', 4200, 'Waiter', TO_DATE('2023-01-18', 'YYYY-MM-DD'), '0503344556');

INSERT INTO storage (placement_no, storage_capacity, storage_type) VALUES ('S001', 500, 'Fridge');

INSERT INTO storage (placement_no, storage_capacity, storage_type) VALUES ('S002', 1000, 'Shelf');

INSERT INTO storage (placement_no, storage_capacity, storage_type) VALUES ('S003', 300, 'Freezer');

INSERT INTO storage (placement_no, storage_capacity, storage_type) VALUES ('S004', 750, 'Shelf');

INSERT INTO storage (placement_no, storage_capacity, storage_type) VALUES ('S005', 400, 'Fridge');

INSERT INTO storage (placement_no, storage_capacity, storage_type) VALUES ('S006', 200, 'Freezer');

INSERT INTO delivery_person (delivery_person_id, delivery_person_name, contact_phone) VALUES ('DP001', 'Fahad Saad', '0501112222');

INSERT INTO delivery_person (delivery_person_id, delivery_person_name, contact_phone) VALUES ('DP002', 'Majed Abdullah', '0553334444');

INSERT INTO delivery_person (delivery_person_id, delivery_person_name, contact_phone) VALUES ('DP003', 'Nawaf Khalid', '0565556666');

INSERT INTO delivery_person (delivery_person_id, delivery_person_name, contact_phone) VALUES ('DP004', 'Salem Nasser', '0547778888');

INSERT INTO delivery_person (delivery_person_id, delivery_person_name, contact_phone) VALUES ('DP005', 'Tariq Essa', '0539990000');

INSERT INTO delivery_person (delivery_person_id, delivery_person_name, contact_phone) VALUES ('DP006', 'Yaser Mohammed', '0500011223');

INSERT INTO customer_order (order_id, cus_id, order_cost, order_date, payment_type) VALUES ('OR001', 'C001', 75.50, TO_DATE('2024-04-26', 'YYYY-MM-DD'), 'Credit Card');

INSERT INTO customer_order (order_id, cus_id, order_cost, order_date, payment_type) VALUES ('OR002', 'C002', 120.00, TO_DATE('2024-04-26', 'YYYY-MM-DD'), 'Cash');

INSERT INTO customer_order (order_id, cus_id, order_cost, order_date, payment_type) VALUES ('OR003', 'C003', 95.75, TO_DATE('2024-04-25', 'YYYY-MM-DD'), 'Credit Card');

INSERT INTO customer_order (order_id, cus_id, order_cost, order_date, payment_type) VALUES ('OR004', 'C001', 50.00, TO_DATE('2024-04-25', 'YYYY-MM-DD'), 'Cash');

INSERT INTO customer_order (order_id, cus_id, order_cost, order_date, payment_type) VALUES ('OR005', 'C004', 150.20, TO_DATE('2024-04-26', 'YYYY-MM-DD'), 'Credit Card');

INSERT INTO customer_order (order_id, cus_id, order_cost, order_date, payment_type) VALUES ('OR006', 'C005', 88.00, TO_DATE('2024-04-24', 'YYYY-MM-DD'), 'Cash');

INSERT INTO product (pro_id, pro_name, pro_type, pro_price, pro_amount, pro_exp_date, pro_is_available) VALUES ('P001', 'Chicken Meal (4 pcs)', 'Main Course', 15.00, 100, TO_DATE('2024-05-10', 'YYYY-MM-DD'), 'TRUE');

INSERT INTO product (pro_id, pro_name, pro_type, pro_price, pro_amount, pro_exp_date, pro_is_available) VALUES ('P002', 'Fries (Large)', 'Side', 7.50, 250, TO_DATE('2024-06-01', 'YYYY-MM-DD'), 'TRUE');

INSERT INTO product (pro_id, pro_name, pro_type, pro_price, pro_amount, pro_exp_date, pro_is_available) VALUES ('P003', 'Coleslaw', 'Side', 5.00, 150, TO_DATE('2024-05-05', 'YYYY-MM-DD'), 'TRUE');

INSERT INTO product (pro_id, pro_name, pro_type, pro_price, pro_amount, pro_exp_date, pro_is_available) VALUES ('P004', 'Shrimp Meal (10 pcs)', 'Main Course', 25.00, 80, TO_DATE('2024-05-12', 'YYYY-MM-DD'), 'TRUE');

INSERT INTO product (pro_id, pro_name, pro_type, pro_price, pro_amount, pro_exp_date, pro_is_available) VALUES ('P005', 'Orange Juice', 'Drink', 6.00, 300, TO_DATE('2024-07-15', 'YYYY-MM-DD'), 'TRUE');

INSERT INTO product (pro_id, pro_name, pro_type, pro_price, pro_amount, pro_exp_date, pro_is_available) VALUES ('P006', 'Water', 'Drink', 2.00, 500, TO_DATE('2025-01-01', 'YYYY-MM-DD'), 'TRUE');

INSERT INTO delivery (delivery_id, delivery_person_id, delivery_date, delivery_company_name) VALUES ('D001', 'DP001', TO_DATE('2024-04-26', 'YYYY-MM-DD'), 'Al Baik Delivery');

INSERT INTO delivery (delivery_id, delivery_person_id, delivery_date, delivery_company_name) VALUES ('D002', 'DP002', TO_DATE('2024-04-26', 'YYYY-MM-DD'), 'Al Baik Delivery');

INSERT INTO delivery (delivery_id, delivery_person_id, delivery_date, delivery_company_name) VALUES ('D003', 'DP003', TO_DATE('2024-04-25', 'YYYY-MM-DD'), 'Al Baik Delivery');

INSERT INTO delivery (delivery_id, delivery_person_id, delivery_date, delivery_company_name) VALUES ('D004', 'DP001', TO_DATE('2024-04-25', 'YYYY-MM-DD'), 'Al Baik Delivery');

INSERT INTO delivery (delivery_id, delivery_person_id, delivery_date, delivery_company_name) VALUES ('D005', 'DP004', TO_DATE('2024-04-26', 'YYYY-MM-DD'), 'Al Baik Delivery');

INSERT INTO delivery (delivery_id, delivery_person_id, delivery_date, delivery_company_name) VALUES ('D006', 'DP005', TO_DATE('2024-04-24', 'YYYY-MM-DD'), 'Al Baik Delivery');

INSERT INTO order_employee (emp_id, order_id) VALUES ('E002', 'OR001');

INSERT INTO order_employee (emp_id, order_id) VALUES ('E004', 'OR002');

INSERT INTO order_employee (emp_id, order_id) VALUES ('E002', 'OR003');

INSERT INTO order_employee (emp_id, order_id) VALUES ('E006', 'OR004');

INSERT INTO order_employee (emp_id, order_id) VALUES ('E002', 'OR005');

INSERT INTO order_employee (emp_id, order_id) VALUES ('E004', 'OR006');

INSERT INTO order_employee (emp_id, order_id) VALUES ('E003', 'OR001');

INSERT INTO order_employee (emp_id, order_id) VALUES ('E005', 'OR002');

INSERT INTO pro_order (order_id, pro_id, quantity) VALUES ('OR001', 'P001', 1);

INSERT INTO pro_order (order_id, pro_id, quantity) VALUES ('OR001', 'P002', 1);

INSERT INTO pro_order (order_id, pro_id, quantity) VALUES ('OR001', 'P005', 2);

INSERT INTO pro_order (order_id, pro_id, quantity) VALUES ('OR002', 'P004', 2);

INSERT INTO pro_order (order_id, pro_id, quantity) VALUES ('OR002', 'P003', 1);

INSERT INTO pro_order (order_id, pro_id, quantity) VALUES ('OR003', 'P001', 1);

INSERT INTO pro_order (order_id, pro_id, quantity) VALUES ('OR003', 'P002', 2);

INSERT INTO pro_order (order_id, pro_id, quantity) VALUES ('OR004', 'P001', 1);

INSERT INTO pro_order (order_id, pro_id, quantity) VALUES ('OR005', 'P004', 1);

INSERT INTO pro_order (order_id, pro_id, quantity) VALUES ('OR005', 'P002', 1);

INSERT INTO pro_order (order_id, pro_id, quantity) VALUES ('OR005', 'P003', 1);

INSERT INTO pro_order (order_id, pro_id, quantity) VALUES ('OR006', 'P001', 1);

INSERT INTO pro_order (order_id, pro_id, quantity) VALUES ('OR006', 'P005', 1);

COMMIT: 
;

commit;

SELECT 
    co.order_id, -- Added order_id to see which order the product belongs to 
    p.pro_name, 
    po.quantity 
FROM 
    customer_order co 
JOIN 
    pro_order po ON co.order_id = po.order_id 
JOIN 
    product p ON po.pro_id = p.pro_id 
ORDER BY 
    co.order_id, p.pro_name; -- Added ordering for better readability 
;

SELECT 
    co.order_id, -- Added order_id to see which order the product belongs to 
    p.pro_name, 
    po.quantity 
FROM 
    customer_order co 
JOIN 
    pro_order po ON co.order_id = po.order_id 
JOIN 
    product p ON po.pro_id = p.pro_id 
ORDER BY 
    co.order_id, p.pro_name; -- Added ordering for better readability 
;

SELECT 
    co.order_id, -- Added order_id to see which order the product belongs to 
    p.pro_name, 
    po.quantity 
FROM 
    customer_order co 
JOIN 
    pro_order po ON co.order_id = po.order_id 
JOIN 
    product p ON po.pro_id = p.pro_id 
ORDER BY 
    co.order_id, p.pro_name;

SELECT 
    c.cus_name, 
    SUM(co.order_cost) AS total_spent 
FROM 
    customer c 
JOIN 
    customer_order co ON c.cus_id = co.cus_id 
GROUP BY 
    c.cus_name 
ORDER BY 
    total_spent DESC; -- Ordering by total spent to see highest spending customers first 
;

SELECT 
    c.cus_name, 
    SUM(co.order_cost) AS total_spent 
FROM 
    customer c 
JOIN 
    customer_order co ON c.cus_id = co.cus_id 
GROUP BY 
    c.cus_name 
ORDER BY 
    total_spent DESC;

SELECT DISTINCT 
    e.emp_name 
FROM 
    employee e 
JOIN 
    order_employee oe ON e.emp_id = oe.emp_id 
WHERE 
    oe.order_id IN ( 
        SELECT 
            order_id 
        FROM 
            customer_order 
        WHERE 
            order_cost > 100 
    );

CREATE OR REPLACE PROCEDURE get_customer_details ( 
    p_customer_id IN VARCHAR2, -- Input parameter for customer ID 
    p_customer_info OUT SYS_REFCURSOR -- Output parameter to return the result set 
) 
AS 
BEGIN 
    -- Open the cursor and execute the SELECT query 
    -- The query selects all columns for the customer with the matching customer ID 
    OPEN p_customer_info FOR 
    SELECT 
        cus_id, 
        cus_name, 
        cus_city, 
        cus_street, 
        cus_phone 
    FROM 
        customer 
    WHERE 
        cus_id = p_customer_id; -- Filter results based on the input parameter 
END; 
/

CREATE OR REPLACE PROCEDURE get_customer_details ( 
    p_customer_id IN VARCHAR2, -- Input parameter for customer ID 
    p_customer_info OUT SYS_REFCURSOR -- Output parameter to return the result set 
) 
AS 
BEGIN 
    -- Open the cursor and execute the SELECT query 
    -- The query selects all columns for the customer with the matching customer ID 
    OPEN p_customer_info FOR 
    SELECT 
        cus_id, 
        cus_name, 
        cus_city, 
        cus_street, 
        cus_phone 
    FROM 
        customer 
    WHERE 
        cus_id = p_customer_id; -- Filter results based on the input parameter 
END; 
 

/

get_customer_inf(C001)


EXEC get_customer_details('C001', :rc)


EXEC get_customer_details('C001', :rc)


print rc


EXEC get_customer_details('C001', :rc)


PRINT :rc


EXEC get_customer_details('C001', :rc)


PRINT rc


CREATE OR REPLACE PROCEDURE get_customer_details ( 
    p_customer_id IN VARCHAR2 -- Input parameter for customer ID 
) 
AS 
    -- Declare variables to hold customer information 
    v_cus_name customer.cus_name%TYPE; 
    v_cus_city customer.cus_city%TYPE; 
    v_cus_street customer.cus_street%TYPE; 
    v_cus_phone customer.cus_phone%TYPE; 
BEGIN 
    -- Retrieve the customer details into the variables 
    SELECT 
        cus_name, 
        cus_city, 
        cus_street, 
        cus_phone 
    INTO 
        v_cus_name, 
        v_cus_city, 
        v_cus_street, 
        v_cus_phone 
    FROM 
        customer 
    WHERE 
        cus_id = p_customer_id; -- Filter by the input customer ID 
 
    -- Print the retrieved customer details using DBMS_OUTPUT 
    DBMS_OUTPUT.PUT_LINE('Customer ID: ' || p_customer_id); 
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_cus_name); 
    DBMS_OUTPUT.PUT_LINE('City: ' || v_cus_city); 
    DBMS_OUTPUT.PUT_LINE('Street: ' || v_cus_street); 
    DBMS_OUTPUT.PUT_LINE('Phone: ' || v_cus_phone); 
 
EXCEPTION 
    -- Handle the case where no data is found for the given customer ID 
    WHEN NO_DATA_FOUND THEN 
        DBMS_OUTPUT.PUT_LINE('Customer with ID ' || p_customer_id || ' not found.'); 
    -- Handle other potential errors 
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM); 
END; 
 

/

exec get_customer_info('C001')


exec get_customer_details('C001')


commit;

CREATE OR REPLACE PROCEDURE update_customer_phone ( 
    p_customer_id IN VARCHAR2,     -- Input: ID of the customer to update 
    p_new_phone_number IN VARCHAR2 -- Input: The new phone number 
) 
AS 
    v_row_count NUMBER; -- Variable to check if a row was updated 
BEGIN 
    -- Perform the update operation 
    UPDATE customer 
    SET 
        cus_phone = p_new_phone_number -- Set the phone number to the new value 
    WHERE 
        cus_id = p_customer_id; -- Identify the customer using the input ID 
 
    -- Check how many rows were affected by the update 
    v_row_count := SQL%ROWCOUNT; 
 
    -- Provide feedback using DBMS_OUTPUT 
    IF v_row_count > 0 THEN 
        DBMS_OUTPUT.PUT_LINE('Successfully updated phone number for Customer ID: ' || p_customer_id); 
    ELSE 
        DBMS_OUTPUT.PUT_LINE('Customer with ID ' || p_customer_id || ' not found. No update performed.'); 
    END IF; 
 
EXCEPTION 
    -- Handle potential errors during the update 
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('An error occurred while updating customer phone number: ' || SQLERRM); 
END; 

/

exec update_customer_phone('C004', '0569951600')


commit;

