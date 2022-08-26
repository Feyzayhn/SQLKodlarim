-- AGGREGATE METHOD KULLANIMI --
/*
-Aggregate Methodlari (SUM(topla),COUNT(say),MIN,MAX,AVG(ortalama))
-Subquery icinde de kullanilir
-Ancak, sorgu tek bir deger donduruyor olmalidir
SYNTAX: sum() seklinde olmali sum () arasinda bosluk olmamali

--ALIAS (AS) toplada geçici isim vermek istersek koşuldan sonra AS sutun_isim olarak kullanılır
*/


CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);
INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);
INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);
select * from calisanlar2

-- calisanlar2 tablosundaki en yuksek maas degerini listeleyiniz
SELECT MAX(maas) from calisanlar2

--Calisanlar2 tablosundaki maaslarin toplamini listeleyiniz
SELECT SUM(maas) from calisanlar2

--calisanlar2 tablosundaki maaslarin ortalamasini listeleyiniz
SELECT AVG(maas) from calisanlar2
SELECT round(avg(maas)) from calisanlar2 --ortalamadan cıkan kusurati kaldiriyoruz bu sekilde
SELECT round(avg(maas),2) from calisanlar2-- virgulden sonra 2 sayi yazdirsin

-- calisanlar2 tablosundaki en dusuk maas degerini listeleyiniz
SELECT MIN(maas) from calisanlar2

--Calisanlar2 tablosundaki kac kisinin maas aldigini listeleyiniz
SELECT count(maas) from calisanlar2

---------------------------------------------------------------------------------

select * from markalar

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maasini listeleyiniz
SELECT marka_isim,calisan_sayisi,
(select sum(maas) from calisanlar2 
WHERE marka_isim=isyeri)
AS toplam_maas from markalar


---------------------------------------------------------------------------------

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin 
-- maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.

SELECT marka_isim,calisan_sayisi,
(SELECT max(maas) from calisanlar2 WHERE marka_isim=isyeri) AS max_maas,
(SELECT min(maas) from calisanlar2 WHERE marka_isim=isyeri) AS min_maas

from markalar;

---------------------------------------------------------------------------------

--Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.

SELECT marka_id,marka_isim,
(SELECT count(sehir) from calisanlar2
WHERE marka_isim=isyeri)AS sehir_sayisi from markalar;


---------------------------------------------------------------------------------

--Interview Question: En yüksek ikinci maas değerini çağırın.
SELECT MAX(maas) AS enyuksek_ikinci_maas  from calisanlar2
WHERE maas < (SELECT max(maas) from calisanlar2)

---------------------------------------------------------------------------------

--Interview Question: En düşük ikinci maas değerini çağırın.
SELECT MIN(maas) AS endusuk_ikinci_maas from calisanlar2
WHERE maas > (SELECT min(maas) from calisanlar2)

---------------------------------------------------------------------------------

--En yüksek üçüncü maas değerini bulun

SELECT MAX(maas) as enyuksek_ucuncu_maas from calisanlar2
WHERE maas<(select max(maas)from calisanlar2 WHERE maas<(SELECT MAX(maas) from calisanlar2))


---------------------------------------------------------------------------------

--En düsük üçüncü maas değerini bulun(ÖDEV)




