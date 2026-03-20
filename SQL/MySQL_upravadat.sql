USE firma;

INSERT INTO zamestnanci (jmeno, pozice, plat) VALUES
('Jan Novák', 'Skladník', 28000),
('Petr Dvořák', 'Účetní', 35000),
('Marie Svobodová', 'Asistentka', 25000),
('Karel Procházka', 'Technik', 32000),
('Lucie Malá', 'Recepční', 22000);

UPDATE zamestnanci
SET plat = plat * 1.10;

UPDATE zamestnanci
SET pozice = 'Vedoucí skladu'
WHERE id = 3;

UPDATE zamestnanci
SET pozice = 'Junior'
WHERE plat < 30000;

DELETE FROM zamestnanci
WHERE pozice = 'Junior';

DELETE FROM zamestnanci
WHERE id = 1;

TRUNCATE TABLE zamestnanci;

ALTER TABLE zamestnanci
ADD COLUMN datum_nastupu DATE;

ALTER TABLE zamestnanci
ADD COLUMN oddeleni VARCHAR(30);

ALTER TABLE zamestnanci
MODIFY plat DECIMAL(10,2);

ALTER TABLE zamestnanci
CHANGE jmeno cele_jmeno VARCHAR(50);

ALTER TABLE zamestnanci
DROP COLUMN oddeleni;

RENAME TABLE zamestnanci TO pracovnici;

INSERT INTO pracovnici (cele_jmeno, pozice, plat, datum_nastupu) VALUES
('Adam Král', 'Technik', 38000.00, '2023-05-10'),
('Jana Křížová', 'Asistentka', 29000.00, '2024-02-01'),
('Tomáš Hlaváč', 'Manažer', 52000.00, '2022-09-15');
