CREATE DATABASE IF NOT EXISTS skola;
USE skola;

CREATE TABLE obory (
    id_obor INT PRIMARY KEY AUTO_INCREMENT,
    nazev VARCHAR(100) NOT NULL
);

CREATE TABLE studenti (
    id_student INT PRIMARY KEY AUTO_INCREMENT,
    jmeno VARCHAR(100) NOT NULL,
    rocnik INT NOT NULL,
    id_obor INT,
    FOREIGN KEY (id_obor) REFERENCES obory(id_obor)
);

CREATE TABLE vyucujici (
    id_vyucujici INT PRIMARY KEY AUTO_INCREMENT,
    jmeno VARCHAR(100) NOT NULL,
    titul VARCHAR(50)
);

CREATE TABLE kurzy (
    id_kurz INT PRIMARY KEY AUTO_INCREMENT,
    nazev VARCHAR(100) NOT NULL,
    kredit INT NOT NULL,
    id_vyucujici INT,
    FOREIGN KEY (id_vyucujici) REFERENCES vyucujici(id_vyucujici)
);

CREATE TABLE zapsani (
    id_student INT,
    id_kurz INT,
    datum_zapsani DATE,
    PRIMARY KEY (id_student, id_kurz),
    FOREIGN KEY (id_student) REFERENCES studenti(id_student),
    FOREIGN KEY (id_kurz) REFERENCES kurzy(id_kurz)
);

-- a) obory
INSERT INTO obory (nazev) VALUES
('Informatika'),
('Ekonomie'),
('Management');

-- b) studenti
INSERT INTO studenti (jmeno, rocnik, id_obor) VALUES
('Jana Nováková', 1, 1),
('Petr Svoboda', 2, 1),
('Lucie Dvořáková', 3, 2),
('Adam Procházka', 1, 3);

-- c) vyučující
INSERT INTO vyucujici (jmeno, titul) VALUES
('Dr. Karel Malý', 'Ph.D.'),
('Mgr. Anna Veselá', 'Mgr.'),
('Prof. Jan Horák', 'Prof.');

-- d) kurzy
INSERT INTO kurzy (nazev, kredit, id_vyucujici) VALUES
('Databázové systémy', 5, 1),
('Mikroekonomie', 4, 2),
('Projektový management', 3, 3),
('Programování v Pythonu', 6, 1);

-- e) zapsani
INSERT INTO zapsani (id_student, id_kurz, datum_zapsani) VALUES
(1, 1, '2025-10-01'),
(1, 4, '2025-10-02'),
(2, 1, '2025-09-28'),
(3, 2, '2025-10-03'),
(4, 3, '2025-10-05');

-- 1) Vypiš všechny studenty a jejich obory
SELECT s.jmeno, o.nazev AS obor
FROM studenti s
LEFT JOIN obory o ON s.id_obor = o.id_obor;

-- 2) Kurzy + vyučující
SELECT k.nazev AS kurz, v.jmeno AS vyucujici
FROM kurzy k
LEFT JOIN vyucujici v ON k.id_vyucujici = v.id_vyucujici;

-- 3) Studenti a jejich kurzy
SELECT s.jmeno AS student, k.nazev AS kurz
FROM zapsani z
JOIN studenti s ON z.id_student = s.id_student
JOIN kurzy k ON z.id_kurz = k.id_kurz
ORDER BY s.jmeno;

-- 4) Počet kurzů pro každého studenta
SELECT s.jmeno, COUNT(z.id_kurz) AS pocet_kurzu
FROM studenti s
LEFT JOIN zapsani z ON s.id_student = z.id_student
GROUP BY s.id_student;

-- 5) Počet studentů v každém kurzu
SELECT k.nazev, COUNT(z.id_student) AS pocet_studentu
FROM kurzy k
LEFT JOIN zapsani z ON k.id_kurz = z.id_kurz
GROUP BY k.id_kurz;
