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

-----------------------------------------------------------------------------------

/*
UNION Operator: 1) Iki sorgu(query) sonucunu birlestirmek icin kullanilir
                2) Tekrarsiz (unique) recordlari verir
		        3) Tek bir sutuna cok sutun koyabiliriz
		        4)Tek bir sutun koyarken mevcut dataa durumuna dikkat etmek gerekir.
					 
*/

-----------------------------------------------------------------------------------

--salary değeri 3000'den yüksek olan state değerlerini 
--ve 2000'den küçük olan name değerlerini TEKRARSIZ olarak bulun.

SELECT state AS "Name and State", salary
FROM workers
WHERE salary >3000

UNION

SELECT name, salary
FROM workers
WHERE salary <2000;

-----------------------------------------------------------------------------------

--salary değeri 3000'den yüksek olan state değerlerini ve 
--2000'den küçük olan name değerlerini TEKRARLI olarak bulun.

SELECT state AS "Name and State", salary
FROM workers
WHERE salary >3000

UNION ALL --> UNION ile ayni isi yapar. Ancak, tekrarli degerleri de verir.

SELECT name, salary
FROM workers
WHERE salary <2000;

-----------------------------------------------------------------------------------

--salary değeri 1000'den yüksek, 2000'den az olan "ORTAK" name değerlerini bulun.

SELECT name
FROM workers
WHERE salary > 1000

INTERSECT --INTERSECT Operator: İki sorgu (query) sonucunun ORTAK(common) değerlerini verir.
          --Unique(tekrarsız) recordları verir.

SELECT name
FROM workers
WHERE salary < 2000;

-----------------------------------------------------------------------------------

--salary değeri 2000'den az olan ve company değeri  
--IBM, APPLE yada MICROSOFT olan ortak "name" değerlerini bulun.

SELECT name
FROM workers
WHERE salary < 2000

INTERSECT

SELECT name 
FROM workers
WHERE company IN('IBM','APPLE','MICROSOFT');


-----------------------------------------------------------------------------------
/*

--EXCEPT Operator : Bir sorgu sonucundan başka bir sorgu sonucunu çıkarmak için kullanılır.
--Unique(tekrarsız) recordları verir.

*/
-----------------------------------------------------------------------------------

--salary değeri 3000'den az ve GOOGLE'da çalışmayan  name değerlerini bulun.

SELECT name
FROM workers
WHERE salary < 3000

EXCEPT --> Bununla GOOGLE da calisanlari cikardik ve sonuc olarak calismayanlari bulduk

SELECT name 
FROM workers
WHERE company = 'GOOGLE';

-----------------------------------------------------------------------------------



					 