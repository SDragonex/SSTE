CREATE DATABASE IF NOT EXISTS knihkupectvi;
USE knihkupectvi;

CREATE TABLE IF NOT EXISTS knihy (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nazev VARCHAR(100),
    autor VARCHAR(100),
    rok_vydani INT,
    cena DECIMAL(6,2),
    skladem INT
);

INSERT INTO knihy (nazev, autor, rok_vydani, cena, skladem) VALUES
('1984', 'George Orwell', 1949, 249.00, 12),
('Malý princ', 'Antoine de Saint-Exupéry', 1943, 199.00, 8),
('Hobit', 'J. R. R. Tolkien', 1937, 299.00, 5),
('Kytice', 'K. J. Erben', 1853, 159.00, 3),
('Já, robot', 'Isaac Asimov', 1950, 289.00, 7);

-- 1. Všechny údaje
SELECT * FROM knihy;

-- 2. Pouze názvy
SELECT nazev FROM knihy;

-- 3. Názvy a autoři
SELECT nazev, autor FROM knihy;

-- 4. id, název, cena
SELECT id, nazev, cena FROM knihy;

-- 5. Seřazení podle názvu
SELECT * FROM knihy ORDER BY nazev ASC;

-- 6. Cena > 200
SELECT * FROM knihy WHERE cena > 200;

-- 7. Vydané před 1950
SELECT * FROM knihy WHERE rok_vydani < 1950;

-- 8. Skladem 5 ks
SELECT * FROM knihy WHERE skladem = 5;

-- 9. Skladem 0–5 ks
SELECT * FROM knihy WHERE skladem BETWEEN 0 AND 5;

-- 10. Autor Tolkien
SELECT * FROM knihy WHERE autor LIKE '%Tolkien%';

-- 11. Název obsahuje "princ"
SELECT * FROM knihy WHERE nazev LIKE '%princ%';

-- 12. Název začíná na H
SELECT * FROM knihy WHERE nazev LIKE 'H%';

-- 13. Nejsou od George Orwella
SELECT * FROM knihy WHERE autor <> 'George Orwell';

-- 14. Cena 150–300
SELECT * FROM knihy WHERE cena BETWEEN 150 AND 300;

-- 15. Cena od nejlevnější
SELECT * FROM knihy ORDER BY cena ASC;

-- 16. Rok vydání od nejnovější
SELECT * FROM knihy ORDER BY rok_vydani DESC;

-- 17. Tolkien – řazení dle ceny
SELECT * FROM knihy 
WHERE autor LIKE '%Tolkien%' 
ORDER BY cena ASC;

-- 18. 3 nejlevnější knihy
SELECT * FROM knihy ORDER BY cena ASC LIMIT 3;

-- 19. 2 nejdražší knihy
SELECT * FROM knihy ORDER BY cena DESC LIMIT 2;

-- 20. První 4 podle abecedy
SELECT * FROM knihy ORDER BY nazev ASC LIMIT 4;

-- 21. Počet knih
SELECT COUNT(*) AS pocet_knih FROM knihy;

-- 22. Průměrná cena
SELECT AVG(cena) AS prumerna_cena FROM knihy;

-- 23. Nejvyšší cena
SELECT MAX(cena) AS nejdrazsi FROM knihy;

-- 24. Nejnižší cena
SELECT MIN(cena) AS nejlevnejsi FROM knihy;

-- 25. Celkový počet kusů skladem
SELECT SUM(skladem) AS celkem_skladem FROM knihy;

-- 26. Kolik knih stojí více než 250 Kč
SELECT COUNT(*) FROM knihy WHERE cena > 250;

-- 27. Průměrná cena Tolkienových knih
SELECT AVG(cena) FROM knihy WHERE autor LIKE '%Tolkien%';

-- 28. Knihy po r. 1950 a cena < 250
SELECT * FROM knihy 
WHERE rok_vydani > 1950 AND cena < 250;

-- 29. Skladem > 5 a cena < 300
SELECT * FROM knihy 
WHERE skladem > 5 AND cena < 300;

-- Zvýšení ceny knihy 1984 o 20 Kč
UPDATE knihy
SET cena = cena + 20
WHERE nazev = '1984';

-- Změna skladem u Hobita na 10 ks
UPDATE knihy
SET skladem = 10
WHERE nazev = 'Hobit';

-- Zlevnění knih starších než 1950 o 10 %
UPDATE knihy
SET cena = cena * 0.90
WHERE rok_vydani < 1950;
