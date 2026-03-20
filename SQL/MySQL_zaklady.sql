CREATE DATABASE skolaChaker;

USE skolaChaker;

CREATE TABLE studentChaker (
    id_student INT AUTO_INCREMENT PRIMARY KEY,
    jmeno VARCHAR(100),
    prijmeni VARCHAR(100),
    vek INT,
    mesto VARCHAR(100)
);

INSERT INTO studentChaker (jmeno, prijmeni, vek, mesto) VALUES
('Jan', 'Svoboda', 17, 'Praha'),
('Lucie', 'Nováková', 19, 'Brno'),
('Adam', 'Suchý', 18, 'Ostrava'),
('Petr', 'Veselý', 20, 'Plzeň'),
('Tereza', 'Skálová', 21, 'Praha'),
('Michal', 'Krejčí', NULL, NULL);

SELECT * FROM studentChaker;

SELECT jmeno, prijmeni FROM studentChaker;

SELECT jmeno, prijmeni, mesto FROM studentChaker;

SELECT * FROM studentChaker
WHERE vek > 18;

SELECT * FROM studentChaker
WHERE mesto = 'Praha';

SELECT * FROM studentChaker
WHERE vek BETWEEN 17 AND 19;

SELECT * FROM studentChaker
WHERE mesto <> 'Brno';

SELECT * FROM studentChaker
WHERE prijmeni LIKE 'S%';

SELECT * FROM studentChaker
WHERE mesto IN ('Praha', 'Plzeň');

SELECT * FROM studentChaker
WHERE vek IS NULL OR mesto IS NULL;

SELECT * FROM studentChaker
ORDER BY prijmeni ASC;

SELECT * FROM studentChaker
ORDER BY vek DESC;

SELECT jmeno, mesto FROM studentChakerstudentstudentstudent;
