CREATE TABLE calisanlar
(
id CHAR(5) PRIMARY KEY, -- not null + unique
isim VARCHAR(50) UNIQUE, -- UNIQUE --> Bir sutundaki tüm değerlerin BENZERSİZ yani tek olmasını sağlar
maas int NOT NULL, -- NOT NULL --> Bir sutunun NULL içermemesini yani boş olmamasını sağlar
ise_baslama DATE
);
INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14'); --Unique
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); --NOT NULL
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); --UNIQUE
--INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); --NOT NULL
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
--INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); --PRIMARY KEY
--INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); --PRIMARY KEY
--INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- PRIMARY KEY
-- FOREIGN KEY--
CREATE TABLE adresler
(
adres_id char(5) ,
sokak varchar(20),
cadde varchar(30),
sehir varchar(20),
CONSTRAINT fk FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

select * from adresler;


--Parent tabloda olmayan id ile child tabloya ekleme yapamayız
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');

INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');

--Calısanlar id ile adresler tablosundaki adres_id ile eşlesenlere bakmak için
select * from calisanlar,adresler WHERE calisanlar.id = adresler.adres_id;

DROP table calisanlar
--Parant tabloyu yani primary key olan tabloyu silmek istediğimizde tabloyu silmez
--Önce child tabloyu silmemiz gerekir

delete from calisanlar where id = '10002' --Parent

delete from adresler WHERE adres_id='10002'; --Child

drop table calisanlar;

--ON DELETE CASCADE --
--Her defasinda önce child tablodaki verileri silmek yerine 
--ON DELETE CASCADE silme özelliğini aktif hale getirebiliriz
--Bunun icin FK olan satirin en sonuna ON DELETE CASCADE komutunu yazmamiz yeterli

CREATE TABLE talebeler
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);

CREATE TABLE notlar(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
ON DELETE CASCADE -- bunu ekledigimiz icin asagida silme islemini kolay yaptik
);

INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);

select * from talebeler
select * from notlar

delete from notlar WHERE talebe_id = '123'

delete from talebeler where id= '126' -- ON DELETE CASCADE kullandigimiz icin PARENT tablde'dan direk silebildik
--Parent table'den sildigimiz icin child table'dan da silinmiş oldu

delete from talebeler

DROP table talebeler CASCADE; --PARENT TABLOYU KALDİRMAK İSTERSEK DROP table tablo_adı'ndan sonra


-- Talebeler tablosundaki isim sutununa NOTT NULL kısıtlamasi ekleyiniz ve veri tipini VARCHAR (30) olarak degistiriniz
alter table talebeler
alter column isim TYPE VARCHAR(30), --DATA TURUNU DEGİSTİRDİK
alter column isim SET NOT NULL; --NOT NULL EKLEDİK

-- Talebeler tablosundaki yazili_notu sutununa 60 dan kucuk rakam girilemesin
alter table talebeler
ADD CONSTRAINT sinir CHECK (yazili_notu>60);
--CHECK kısıtlamasi ile tablodaki istedigimiz sutunu sinirlandirabiliriz
--yukarda 60'i sinir olarak belirledigimiz icin bunu eklemedi
INSERT INTO notlar VALUES ('128', 'Mustafa Can','Hasan',45); -- sinirlama oldugu icin 45 notunu kabul etmedi

create table ogrenciler1(
id int,
isim varchar(45),
adres varchar(100),
sinav_notu int
);

Create table ogrenci_adres1
AS
SELECT id, adres from ogrenciler1;

select * from ogrenciler1
select * from ogrenci_adres1

--Tablodaki bir sutuna PRIMARY KEY ekleme
alter table ogrenciler1 --BU 1.YOLDU
ADD PRIMARY KEY(id); --burda ismi program verdi

--PRIMARY KEY OLUSTURMADA 2.YOL
alter table ogrenciler1
ADD CONSTRAINT pk_idi PRIMARY KEY(id); --burda ismi biz verdik

--PK'dan sonra FK ATAMASİ
alter table ogrenci_adres1 --foreign key atadik
ADD foreign key (id) REFERENCES ogrenciler1;
--Child tabloyu Parent tablodan olusturdugumuz icin kolon adi vermedik

--PK'deki CONSTRAINT i silme
alter table ogrenciler1 DROP CONSTRAINT pk_idi;
--FK'yi silme CONTRAINT silme
alter table ogrenci_adres1 DROP CONSTRAINT ogrenci_adres_id_fkey;

--Yazili notu 85 den buyuk olan talebe bilgilerini getirin
Select * from talebeler WHERE yazili_notu>85;

--İsmi Mustafa Bak olan talebenin tum bilgilerini getirin
Select * from talebeler Where isim = 'Mustafa Bak'



--SELECT komutunda -- BETWEEN Kosulu
--Between belirttigimiz 2 veri arasindaki bilgileri listeler
--Between de belirttigimiz degerlerde listelemeye dahildir

create table personel
(
id char(4),
isim varchar(50),
maas int
);

insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);

/*
    AND (ve) : Belirtilen şartlarin her ikiside gerçekleşiyorsa o kayit listelenir
Bir tanesi gerçekleşmezse listelemez
    Select * from matematik sinav1 > 50 AND sinav2 > 50
Hem sinav1 hemde sinav2 alani, 50 den büyük olan kayitlari listeler
    OR (veya) : Belirtilen şartlardan biir gerçekleşirse, kayıt listelenir
	Select * from matematik sinav > 50 OR sinav2 > 50
Hem sinav1 veya sinav2 alani, 50 den büyük olan kayitlari listeler
*/

select * from personel

--id'si 1003 ile 1005 arasinda olan personel bilgisini listeleyiniz
select * from personel WHERE id BETWEEN '1003' and '1005'; --sınır degerler dahil

-- 2.YOL
select * from personel WHERE id >= '1003' and id <= '1005';

--Derya Soylu ile Yavuz Bal arasindaki personel bilgisini listeleyiniz
select * from personel WHERE isim between 'Derya Soylu' AND 'Yavuz Bal' --alfabeye gore getiriyor
--between arasinda demek

--Maaşı 70000 ve ismi Sena olan personeli listele
select * from personel where maas=70000 OR isim='Sena Beyaz'

--IN : BİRDEN FAZLA MANTIKSAL İFADE İLE TANIMLAYABİLECEGİMİZ DURUMLARİ TEK KOMUTTA YAZABİLME İMKANİ VERİR
--Farklı sütunlar için IN kullanilmaz

--id'si 1001,1002 ve 1004 olan personelin bilgilerini listele

select * from personel WHERE id ='1001' OR İD='1002' OR İD='1004';

--2.yol
select * from personel WHERE id IN ('1001','1002','1004');

--Maaşı sadece 70000, 100000 olan personeli listele
select * from personel WHERE maas IN ('70000','100000');

/*
SELECT - LIKE koşulu
LIKE : Sorgulama yaparken belirli kalıp ifadeleri kullanabilmemizi sağlar
ILIKE : Sorgulama yaparken büyük/küçük harfe duyarsız olarak eşleştirilir
LIKE : ~~
ILIKE : ~~*
NOT LIKE : !~~
NOT ILIKE : !~~*

% --> 0 veya daha fazla karakteri belirtir.
_ --> Tek bir karakteri belirtir

*/

--Ismi A harfi ile başlayan personeli listele
select * from personel WHERE isim like 'A%'; --İsmi A ile baslasin sonu ne olursa olsun

--Ismi t harfi ile biten personeli listele
select * from personel WHERE isim ilike '%t';--basinda ne olursa olsun sonu t ile bitsin

--Isminin 2.harfi e olan personeli listeleyiniz
select * from personel WHERE isim like '_e%';-- _ bu ilk harfi sembolize eder _e dersek 2. harfi oldu

