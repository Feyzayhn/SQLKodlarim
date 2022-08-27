-- IS NULL, IS NOT NULL, COALESCE --
/*
IS NULL ve IS NOT NULL Boolean operatorleridir. Bir ifadenin NULL olup olmadigini kontrol eder

COALESCE (Birlestirme) ise bir fonksiyondur ve icerisindeki parametrelerden NULL olmayan ilk ifadeyi dondurur

*/

CREATE TABLE insanlar 
(
    ssn CHAR(9), -- Social Security Number
    isim VARCHAR(50), 
    adres VARCHAR(50) 
);

INSERT INTO insanlar VALUES('123456789', 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES('234567890', 'Veli Cem', 'Ankara');
INSERT INTO insanlar VALUES('345678901', 'Mine Bulut', 'Izmir');
INSERT INTO insanlar (ssn, adres) VALUES('456789012', 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES('567890123', 'Denizli');
INSERT INTO insanlar (adres) VALUES('Sakarya');
INSERT INTO insanlar (ssn) VALUES('999111222');

select * from insanlar

------------------------------------------------------------------------------

-- ismi null olanlari sorgula

select * from insanlar where isim is null

-- ismi null olmayanlari getirelim

select * from insanlar where isim is not null

-- isim 'i NULL olan kişilerin isim'ine NO NAME atayınız.
update insanlar
set isim='NO NAME' 
WHERE isim is null

-- Tabloyu bir önceki soruyu çözmeden önceki haline geri getirin

update insanlar
set isim='null'
where isim='NO NAME'

--NOT : Coklu degisimde her degisim icin set ... where isim IS NULL gibi 
--ifade yazmamak icin COALESCE(Birlestirme) kullanilir

/* 
isim 'i NULL olanlara 'Henuz isim girilmedi'
adres 'i NULL olanlara 'Henuz adres girilmedi'
ssn 'i NULL olanlara ' no ssn' atayalım.
*/

UPDATE insanlar
SET isim = coalesce (isim, 'HENUZ ISIM GIRILMEDI'),
    adres = coalesce (adres, 'HUNUZ ADRES GIRILMEDI'),
    ssn = coalesce (ssn, 'NO SSN');

	
select * from insanlar	








