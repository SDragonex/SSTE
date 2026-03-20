CREATE USER 'brigadnik_01'@'localhost'
IDENTIFIED BY 'Student_2026_Heslo';

GRANT SELECT
ON e_shop.produkty
TO 'marketing_user'@'%';

GRANT SELECT
ON e_shop.objednavky
TO 'marketing_user'@'%';

GRANT UPDATE (popis_produktu)
ON e_shop.produkty
TO 'marketing_user'@'%';

GRANT CREATE TEMPORARY TABLES
ON e_shop.*
TO 'marketing_user'@'%';

CREATE ROLE 'junior_developer';

GRANT SELECT, INSERT, UPDATE
ON projekt_alfa.*
TO 'junior_developer';

GRANT 'junior_developer'
TO 'novacek_jan'@'%';

SET DEFAULT ROLE 'junior_developer'
TO 'novacek_jan'@'%';
