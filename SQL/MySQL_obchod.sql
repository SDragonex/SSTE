CREATE DATABASE IF NOT EXISTS obchod;
USE obchod;

-- Zákazník
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Detail zákazníka
CREATE TABLE IF NOT EXISTS customer_details (
    customer_id INT PRIMARY KEY,
    date_of_birth DATE,
    phone VARCHAR(20),
    street VARCHAR(100),
    city VARCHAR(100),
    postal_code VARCHAR(20),
    CONSTRAINT fk_customer_details_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Objednávky
CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- Položky objednávky
CREATE TABLE IF NOT EXISTS order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_order_items_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO customers (first_name, last_name, email) VALUES
('Jan', 'Novak', 'jan.novak@example.com'),
('Petr', 'Svoboda', 'petr.svoboda@example.com'),
('Karel', 'Dvorak', 'karel.dvorak@example.com'),
('Lukas', 'Marek', 'lukas.marek@example.com'),
('Tomas', 'Kratochvil', 'tomas.kratochvil@example.com'),
('Michal', 'Prochazka', 'michal.prochazka@example.com'),
('Martin', 'Urban', 'martin.urban@example.com'),
('David', 'Benes', 'david.benes@example.com'),
('Jakub', 'Kral', 'jakub.kral@example.com'),
('Ondrej', 'Kolar', 'ondrej.kolar@example.com');

INSERT INTO customer_details (customer_id, date_of_birth, phone, street, city, postal_code) VALUES
(1, '1985-03-12', '777111222', 'Hlavni 12', 'Praha', '11000'),
(2, '1990-07-05', '777222333', 'Lipova 8', 'Brno', '60200'),
(3, '1979-11-20', '777333444', 'Skolska 15', 'Ostrava', '70030'),
(4, '1995-01-17', '777444555', 'Nova 22', 'Plzen', '30100'),
(5, '1982-05-29', '777555666', 'Kvetna 3', 'Olomouc', '77900'),
(6, '1988-09-10', '777666777', 'Polni 6', 'Zlin', '76001'),
(7, '1993-02-14', '777777888', 'Dlouha 99', 'Liberec', '46001'),
(8, '1975-06-30', '777888999', 'Kralova 7', 'Hradec Kralove', '50002'),
(9, '1981-12-08', '777999000', 'Brezi 11', 'Jihlava', '58601'),
(10, '1996-04-23', '777000111', 'Revolucni 25', 'Ceske Budejovice', '37001');

INSERT INTO orders (customer_id, order_date, status, total) VALUES
(1, '2025-01-05 10:15:00', 'new', 1500.00),
(2, '2025-01-10 14:30:00', 'paid', 899.00),
(3, '2025-01-12 09:22:00', 'shipped', 1200.00),
(4, '2025-01-15 17:00:00', 'new', 450.00),
(5, '2025-01-20 12:45:00', 'paid', 2499.00),
(6, '2025-02-01 08:55:00', 'shipped', 799.00),
(7, '2025-02-03 19:10:00', 'new', 2200.00),
(8, '2025-02-10 11:05:00', 'paid', 310.00),
(9, '2025-02-15 15:20:00', 'new', 999.00),
(10, '2025-02-18 09:40:00', 'shipped', 1850.00),
(1, '2025-02-20 09:10:00', 'paid', 750.00),
(2, '2025-02-22 16:25:00', 'new', 320.00),
(2, '2025-03-15 18:10:00', 'paid', 580.00),
(3, '2025-02-25 11:40:00', 'paid', 2100.00),
(4, '2025-02-27 08:05:00', 'shipped', 560.00),
(5, '2025-03-01 13:30:00', 'new', 990.00),
(6, '2025-03-03 17:55:00', 'paid', 1350.00),
(7, '2025-03-05 10:15:00', 'shipped', 420.00),
(8, '2025-03-07 19:45:00', 'new', 260.00),
(9, '2025-03-09 12:20:00', 'paid', 1780.00),
(10, '2025-03-11 15:00:00', 'new', 640.00),
(1, '2025-03-13 09:50:00', 'shipped', 1999.00),
(3, '2025-03-17 07:35:00', 'new', 430.00),
(4, '2025-03-19 14:05:00', 'paid', 2890.00),
(5, '2025-03-21 11:25:00', 'shipped', 720.00),
(6, '2025-03-23 16:40:00', 'new', 305.00),
(7, '2025-03-25 09:05:00', 'paid', 1540.00),
(8, '2025-03-27 20:30:00', 'shipped', 890.00),
(9, '2025-03-29 10:45:00', 'new', 510.00),
(10, '2025-03-31 13:55:00', 'paid', 2300.00);

INSERT INTO order_items (order_id, product_name, quantity, unit_price) VALUES
(1, 'Notebook Lenovo', 1, 1500.00),
(2, 'Bezdratova mys', 2, 449.50),
(3, 'Sluchatka Sony', 1, 1200.00),
(4, 'Kniha – SQL zaklady', 1, 450.00),
(5, 'Monitor 27"', 1, 2499.00),
(6, 'Klavesnice Logitech', 1, 799.00),
(7, 'Router TP-Link', 2, 1100.00),
(8, 'USB Flash 64GB', 1, 310.00),
(9, 'Powerbanka Xiaomi', 1, 999.00),
(10, 'Herni mys Razer', 1, 1850.00),
(11, 'Sluchatka JBL', 1, 750.00),
(11, 'USB C Kabel', 2, 120.00),
(12, 'Kniha – Python zaklady', 1, 320.00),
(13, 'Monitor Samsung 24"', 1, 2100.00),
(13, 'Podlozka pod mys', 1, 150.00),
(14, 'Klavesnice Logitech', 1, 560.00),
(15, 'Powerbanka 20 000 mAh', 1, 990.00),
(16, 'SSD 512GB Kingston', 1, 1350.00),
(17, 'Router TP-Link AX1500', 1, 420.00),
(18, 'USB Flash 128GB', 1, 260.00),
(19, 'Herni sluchatka Razer', 1, 1780.00),
(20, 'Bezdratova mys', 1, 640.00),
(21, 'Sluchatka Sony WH-CH520', 1, 1999.00),
(22, 'Mikrofon HyperX SoloCast', 1, 580.00),
(23, 'Kniha – SQL pro zacatecniky', 1, 430.00),
(24, 'Monitor LG 27"', 1, 2890.00),
(25, 'USB C Hub 6v1', 1, 720.00),
(26, 'Podlozka pod klavesnici', 1, 305.00),
(27, 'Herni mys Logitech G502', 1, 1540.00),
(28, 'Externi disk WD 1TB', 1, 890.00),
(29, 'HDMI Kabel 2m', 2, 255.00),
(29, 'Drzak na mobil', 1, 510.00),
(30, 'Sluchatka Bose', 1, 2300.00);

-- 1) Jméno zákazníka + telefon
SELECT first_name, last_name, phone
FROM customers
JOIN customer_details USING (customer_id);

-- 2) Jméno zákazníka + město
SELECT first_name, last_name, city
FROM customers
JOIN customer_details USING (customer_id);

-- 3) Jméno zákazníka + datum narození
SELECT first_name, last_name, date_of_birth
FROM customers
JOIN customer_details USING (customer_id);

-- 4) Jméno, příjmení + ulice + PSČ
SELECT first_name, last_name, street, postal_code
FROM customers
JOIN customer_details USING (customer_id);

-- 5) Jméno zákazníka + datum jeho první objednávky
SELECT c.first_name, c.last_name, MIN(o.order_date) AS prvni_obj
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

-- 6) Příjmení + cena objednávky
SELECT last_name, total
FROM customers
JOIN orders USING (customer_id);

-- 7) E-mail + stav objednávky
SELECT email, status
FROM customers
JOIN orders USING (customer_id);

-- 8) Města zákazníků, kteří mají objednávku paid
SELECT DISTINCT city
FROM customer_details cd
JOIN orders o USING (customer_id)
WHERE o.status = 'paid';

-- 9) Jména zákazníků s objednávkou > 1000
SELECT first_name, last_name
FROM customers
JOIN orders USING (customer_id)
WHERE total > 1000;

-- 10) Datum objednávky + telefon zákazníka
SELECT order_date, phone
FROM orders
JOIN customer_details USING (customer_id);

-- 11) Jméno zákazníka + produkt
SELECT first_name, last_name, product_name
FROM customers
JOIN orders USING (customer_id)
JOIN order_items USING (order_id);

-- 12) Zákazník + quantity
SELECT first_name, last_name, quantity
FROM customers
JOIN orders USING (customer_id)
JOIN order_items USING (order_id);

-- 13) Produkty, které objednali zákazníci z Brna
SELECT product_name
FROM order_items
JOIN orders USING (order_id)
JOIN customer_details USING (customer_id)
WHERE city = 'Brno';

-- 14) Jméno zákazníka + cena položky
SELECT first_name, last_name, unit_price
FROM customers
JOIN orders USING (customer_id)
JOIN order_items USING (order_id);

-- 15) Zákazníci s objednávkami mezi dvěma daty
SELECT DISTINCT first_name, last_name
FROM customers
JOIN orders USING (customer_id)
WHERE order_date BETWEEN '2025-01-01' AND '2025-02-15';

-- 16) Zákazník + produkt s cenou > 1000
SELECT first_name, last_name, product_name
FROM customers
JOIN orders USING (customer_id)
JOIN order_items USING (order_id)
WHERE unit_price > 1000;

-- 17) Zákazník + počet položek jeho objednávky
SELECT first_name, last_name, COUNT(order_item_id) AS pocet_polozek
FROM customers
JOIN orders USING (customer_id)
JOIN order_items USING (order_id)
GROUP BY orders.order_id;

-- 18) Jméno zákazníka + seznam produktů
SELECT first_name, last_name, product_name
FROM customers
JOIN orders USING (customer_id)
JOIN order_items USING (order_id);

-- 19) Zákazníci, kteří mají položku obsahující „mys“
SELECT DISTINCT first_name, last_name
FROM customers
JOIN orders USING (customer_id)
JOIN order_items USING (order_id)
WHERE product_name LIKE '%mys%';

-- 20) Příjmení zákazníků s více než 1 položkou objednávky
SELECT last_name
FROM customers
JOIN orders USING (customer_id)
JOIN order_items USING (order_id)
GROUP BY orders.order_id
HAVING COUNT(order_item_id) > 1;

-- 21) Email + město zákazníka se stavem shipped
SELECT email, city
FROM customers
JOIN customer_details USING (customer_id)
JOIN orders USING (customer_id)
WHERE status = 'shipped';

-- 22) Jméno zákazníka + datum objednávky, pokud cena položky 500–2000
SELECT first_name, last_name, order_date
FROM customers
JOIN orders USING (customer_id)
JOIN order_items USING (order_id)
WHERE unit_price BETWEEN 500 AND 2000;

-- 23) Zákazníci, kteří mají položku s množstvím > 1
SELECT DISTINCT first_name, last_name
FROM customers
JOIN orders USING (customer_id)
JOIN order_items USING (order_id)
WHERE quantity > 1;

-- 24) Zákazníci, kteří objednali produkt začínající na K
SELECT DISTINCT first_name, last_name
FROM customers
JOIN orders USING (customer_id)
JOIN order_items USING (order_id)
WHERE product_name LIKE 'K%';

-- 25) PSČ zákazníků s objednávkou nad 2000
SELECT DISTINCT postal_code
FROM customer_details
JOIN orders USING (customer_id)
WHERE total > 2000;

-- 26) Produkty + města zákazníků
SELECT product_name, city
FROM order_items
JOIN orders USING (order_id)
JOIN customer_details USING (customer_id);

-- 27) Jméno zákazníka + cena objednávky (jen Praha)
SELECT first_name, last_name, total
FROM customers
JOIN customer_details USING (customer_id)
JOIN orders USING (customer_id)
WHERE city = 'Praha';

-- 28) Datum objednávky + telefon, pokud produkt obsahuje USB
SELECT order_date, phone
FROM orders
JOIN customer_details USING (customer_id)
JOIN order_items USING (order_id)
WHERE product_name LIKE '%USB%';

-- 29) Zákazníci, kteří objednali produkt s cenou přesně 799
SELECT DISTINCT first_name, last_name
FROM customers
JOIN orders USING (customer_id)
JOIN order_items USING (order_id)
WHERE unit_price = 799;

-- 30) Zákazníci s položkou obsahující „Book“ nebo „Kniha“
SELECT DISTINCT first_name, last_name
FROM customers
JOIN orders USING (customer_id)
JOIN order_items USING (order_id)
WHERE product_name LIKE '%Book%' 
   OR product_name LIKE '%Kniha%';
