    CREATE TABLE companies
(
  company_id SMALLINT,
  company VARCHAR(20),
  number_of_employees SMALLINT
);
INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(103, 'APPLE', 21000);

SELECT * FROM companies; 

--1. Örnek: companies tablosundan en yüksek ikinci number_of_employees değeri olan company 
-- ve number_of_employees değerlerini çağırın.
--OFFSET ATLAR ,ORDER BY SİRALAR, DESC TERSTEN SİRALAR

--1.YOL OFFSET ve FETHC NEXT kullanarak
SELECT company, number_of_employees	
FROM companies
ORDER BY number_of_employees DESC --buyukten kucuge siraladik
OFFSET 1 ROW  -- bir sutunu atladik
FETCH NEXT 1 ROW ONLY;

--2.YOL subquery ile yapildi
SELECT company, number_of_employees	
FROM companies
WHERE number_of_employees = (SELECT MAX(number_of_employees)--burasi 2. max veriyor
                             FROM companies
                             WHERE number_of_employees < (SELECT MAX(number_of_employees)--burasi max veriyor
                             FROM companies))


--//1. Örnek: number_of_employees değeri ortalama çalışan sayısından az olan
--// number_of_employees değerlerini 16000 olarak UPDATE edin.

UPDATE companies
SET number_of_employees = 16000
WHERE number_of_employees < (SELECT AVG(number_of_employees)
						    FROM companies);




-- //1.ORNEK SORU: Prepared statement kullanarak company adı IBM olan 
-- number_of_employees değerini 9999 olarak güncelleyin.
UPDATE companies SET number_of_employees=9999 WHERE company = 'IBM'; 





SELECT * FROM companies;



