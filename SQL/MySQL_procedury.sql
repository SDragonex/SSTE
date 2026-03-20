USE obchod;

DELIMITER $$

DROP PROCEDURE IF EXISTS GetProductsByCategory$$
CREATE PROCEDURE GetProductsByCategory(IN p_category_name VARCHAR(100))
BEGIN
    SELECT p.*
    FROM products p
    JOIN categories c ON p.category_id = c.id
    WHERE c.name = p_category_name;
END$$

DROP PROCEDURE IF EXISTS ListCustomerOrders$$
CREATE PROCEDURE ListCustomerOrders(IN p_customer_id INT)
BEGIN
    SELECT *
    FROM orders
    WHERE customer_id = p_customer_id
    ORDER BY created_at DESC;
END$$

DROP PROCEDURE IF EXISTS FindCheapBooks$$
CREATE PROCEDURE FindCheapBooks(IN p_max_price DECIMAL(10,2))
BEGIN
    SELECT *
    FROM books
    WHERE price <= p_max_price;
END$$

DROP PROCEDURE IF EXISTS RaiseSalary$$
CREATE PROCEDURE RaiseSalary(IN p_employee_id INT, IN p_amount DECIMAL(10,2))
BEGIN
    UPDATE employees
    SET salary = salary + p_amount
    WHERE id = p_employee_id;
END$$

DROP PROCEDURE IF EXISTS CountEmployees$$
CREATE PROCEDURE CountEmployees(IN p_department_id INT, OUT p_count INT)
BEGIN
    SELECT COUNT(*) INTO p_count
    FROM employees
    WHERE department_id = p_department_id;
END$$

DROP PROCEDURE IF EXISTS GetTotalSales$$
CREATE PROCEDURE GetTotalSales(IN p_date DATE, OUT p_total DECIMAL(10,2))
BEGIN
    SELECT IFNULL(SUM(total_price), 0)
    INTO p_total
    FROM orders
    WHERE DATE(created_at) = p_date;
END$$

DROP PROCEDURE IF EXISTS CheckAdult$$
CREATE PROCEDURE CheckAdult(IN p_age INT, OUT p_is_adult TINYINT)
BEGIN
    IF p_age >= 18 THEN
        SET p_is_adult = 1;
    ELSE
        SET p_is_adult = 0;
    END IF;
END$$

DROP PROCEDURE IF EXISTS FormatPhone$$
CREATE PROCEDURE FormatPhone(INOUT p_phone VARCHAR(20))
BEGIN
    IF p_phone NOT LIKE '+420%' THEN
        SET p_phone = CONCAT('+420 ', p_phone);
    END IF;
END$$

DROP PROCEDURE IF EXISTS GetAverageRating$$
CREATE PROCEDURE GetAverageRating(IN p_product_id INT, OUT p_avg_rating DECIMAL(3,2))
BEGIN
    SELECT AVG(rating)
    INTO p_avg_rating
    FROM reviews
    WHERE product_id = p_product_id;
END$$

DROP PROCEDURE IF EXISTS CheckStock$$
CREATE PROCEDURE CheckStock(IN p_product_id INT)
BEGIN
    DECLARE qty INT;

    SELECT stock INTO qty
    FROM products
    WHERE id = p_product_id;

    IF qty = 0 THEN
        SELECT 'Vyprodáno' AS stav;
    ELSEIF qty BETWEEN 1 AND 5 THEN
        SELECT 'Poslední kusy' AS stav;
    ELSE
        SELECT 'Skladem' AS stav;
    END IF;
END$$

DROP PROCEDURE IF EXISTS ApplyDiscount$$
CREATE PROCEDURE ApplyDiscount(IN p_order_id INT)
BEGIN
    UPDATE orders
    SET total_price = total_price * 0.9
    WHERE id = p_order_id
      AND total_price > 1000;
END$$

DROP PROCEDURE IF EXISTS GradeStudent$$
CREATE PROCEDURE GradeStudent(IN p_points INT)
BEGIN
    SELECT CASE
        WHEN p_points >= 90 THEN 'A'
        WHEN p_points >= 80 THEN 'B'
        WHEN p_points >= 70 THEN 'C'
        WHEN p_points >= 60 THEN 'D'
        WHEN p_points >= 50 THEN 'E'
        ELSE 'F'
    END AS znamka;
END$$

DROP PROCEDURE IF EXISTS LoginCheck$$
CREATE PROCEDURE LoginCheck(IN p_email VARCHAR(255), IN p_password VARCHAR(255))
BEGIN
    IF EXISTS (
        SELECT 1 FROM users
        WHERE email = p_email AND password = p_password
    ) THEN
        SELECT 'Úspěch' AS vysledek;
    ELSE
        SELECT 'Chybné údaje' AS vysledek;
    END IF;
END$$

DROP PROCEDURE IF EXISTS DayOfWeekCZ$$
CREATE PROCEDURE DayOfWeekCZ(IN p_date DATE)
BEGIN
    SELECT CASE DAYOFWEEK(p_date)
        WHEN 1 THEN 'Neděle'
        WHEN 2 THEN 'Pondělí'
        WHEN 3 THEN 'Úterý'
        WHEN 4 THEN 'Středa'
        WHEN 5 THEN 'Čtvrtek'
        WHEN 6 THEN 'Pátek'
        WHEN 7 THEN 'Sobota'
    END AS den;
END$$

DELIMITER ;