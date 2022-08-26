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