CREATE TABLE workers
(
  id CHAR(9),
  name VARCHAR(50),
  state VARCHAR(50),
  salary SMALLINT,
  company VARCHAR(20)
);
INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
SELECT * FROM workers;

----------------------------------------------------------------------------------

--Toplam salary değeri 2500 üzeri olan her bir çalışan için salary toplamını bulun.
select name, Sum(salary) AS "Total Salary"
FROM workers
GROUP BY name 
HAVING SUM(salary)>2500; --> "Group By ardindan "where" kullanilmaz bu yüzden "having" kullandik


----------------------------------------------------------------------------------


--Birden fazla çalışanı olan, her bir state için çalışan toplamlarını bulun.

select state, COUNT(state) AS calisan_sayisi
FROM workers
GROUP BY state
HAVING COUNT(state) > 1; --> HAVING, Group By ardindan filtreleme icin kullanilir
                         --> COUNT sayar
						 

----------------------------------------------------------------------------------
						 
--Her bir state için değeri 3000'den az olan maximum salary değerlerini bulun.

select state, MAX(salary) AS max_salary
from workers
GROUP BY state
HAVING MAX(salary) < 3000;

----------------------------------------------------------------------------------

--Her bir company için değeri 2000'den fazla olan minimum salary değerlerini bulun.

select company,MIN(salary) AS min_salary
from workers
GROUP BY company
HAVING MIN(salary) > 2000;

----------------------------------------------------------------------------------

-- Tekrarsiz isimleri yazdirin

SELECT DISTINCT name 
FROM workers; --> DISTINCT clause, cagrilan terimlerden tekrarli olanlarin sadece birincisini alir

----------------------------------------------------------------------------------

--Name değerlerini company kelime uzunluklarına göre sıralayın.

SELECT name, company
FROM workers
ORDER BY LENGTH(company); --> ORDER BY siralama yapar


----------------------------------------------------------------------------------

--Tüm name ve state değerlerini aynı sütunda çağırarak her bir sütun değerinin uzunluğuna göre sıralayın.
--Concat() fonksiyonu birden fazla sutun veya String degerini birlestirmek icin kullanilir
--1.YOL
SELECT CONCAT(name, ' ', state) -->CONCAT birlestirir araya bosluk attik
AS name_and_state
FROM workers
ORDER BY LENGTH(name) + LENGTH(state);

--2.YOL
SELECT name || ' ' || state || ' ' || LENGTH(name) + LENGTH(state) --> || birlesitrme yapar
AS name_and_state
FROM workers
ORDER BY LENGTH(name) + LENGTH(state);

---------------------------------------------------------------------------




