--PERSONEL ADİNDA BİR TABLO OLUSTURALİM
create table personel(
pers_id int,
isim varchar(30),
sehir varchar(30),
maas int,
sirket varchar(20),
adres varchar(50)
);
--VAROLAN PERSONEL TABLOSUNDAN pers_id,sehir,adres FİERLLARİNA SAHİP personel_adres adinda yeni bir tablo olusturalim
create table personel_adres
as
select pers_id,sehir,adres from personel;

select * from personel -- tablonun icini gosteriyor


-- DML --> Data Manupulation Lang.
--INSERT - UPDATE - DELETE
--Tabloya veri ekleme,güncelleme ve silme işlemlerinde kulanilan komutlar
--Insert
create table student(
id varchar(4),
st_name varchar(30),
age int
);
INSERT into student Values('1001','Ali Can',25); -- tabloya istenilen sekilde veri ekledik
INSERT into student Values('1002','Veli Can',35);-- sadece stringlerde '' koyuluyor
INSERT into student Values('1003','Ayse Can',45);
INSERT into student Values('1004','Derya Can',55);
--Tabloya parçali veri ekleme
insert into student(st_name,age) values ('Murat Can',65);-- burada id num girmedik id kısmına null atar

--DQL --> DATA QUEY LANG. Data sorgulama dili
-- SELECT
select * from student; -- tablonun son halini gösteriyor
select st_name from student; -- sadece st_name i getirecek
--SELECT KOMUTU WHERE KOŞULU
select * from student Where age>35; -- student tablosundan her seyi getir yalniz yasi 35 den buyuk olanlari getir dedik


--TCL - TRANSACTION CONTROL LONG. İşlem kontrol dili
--Begin - Savepoint - rollback - commit BUNLARİ KULLANMADAN ONCE BAŞİNA BEGİN KOYMAN LAZİM
--Transaction veritabani sistemlerinde bir işlem başladiginda başlar ve işlem bitince sona erer
--Bu işlemler veri tabani oluşturma, veri silme, veri güncelleme, veriyi geri getirme gibi işlemler olabilir

create table ogrenciler2(
id serial,
isim varchar(50),
veli_isim varchar(50),
yazili_notu real
);

Begin; -- İLK İKİ öğrenci benim asil kayitli öğrencim olsun
insert into ogrenciler2 Values (default,'Ali Can','Hasan Can',75.5); -- serial dedigimiz icin 1 den kaça kadar gidecekse siralanmasi icin ilk degeri default yaptik
insert into ogrenciler2 Values (default,'Canan Gül','Ayşe Şen',90.5);
savepoint x; -- diger ikiside erasmusla gelsin fakat sonra gidecegini biliyorum -- başa begin yazmasak bu komut calismazdi
insert into ogrenciler2 Values (default,'Kemal Can','Ahmet Can',85.5);
insert into ogrenciler2 Values (default,'Ahmet Şen','Ayşe Can',65.5);

ROLLBACK TO x; -- erasmusla gelen geçici kayitlari sildik 
-- sildikten sonra erasmuslari tekrar eklersek sayac mantıgı ile calisir ve en son hangi sayida kaldiysa ordan devam eder 
select * from ogrenciler2;

commit; -- TRANSACTION dan cıkmak icin kullanilir çıkmazsak sonraki yazacaklarimizda sıkıntı yaşariz

--TRANSACTION  kullaniminda SERIAL data türü kullanimi tavsiye edilmez.
--savepointten sonra ekledigimiz veride sayaç mantıgı ile caliştigi icin
--sayacta en son hangi sayida kaldiysa ordan devam eder
--NOT : PostgreSQL de transaction kullanimi icin 'Begin' komutuyla başlariz sonrasinda tekrar yanlış bir veriyi
--düzeltmek veya bizim icin önemli olan verilerden sonra ekleme yapabilmek icin 'SAVEPOINT savepointismi'
--komutunu kullaniriz ve bu savepointe dönebilmek icin 'ROLLBACK TO savepointismi'
--komutunu kullaniriz ve rollback çalıştırıldıgında savepoint yazdigimiz satirin üstündeki verileri tabloda bize
--verir ve son olarak Transaction'i sonlandırmak icin mutlaka 'COMMIT' komutu kullaniriz. MYSQL d
--transaction olmadanda kullanilir

--DML-VERİ İSLEME DİLİ -DELETE
--DELETE FROM tablo_adi --> Tablo'nun tüm içerigini siler
--Veriyi seçerek silmek icin WHERE koşulu kullanilir
--DELETE FROM tablo_adı WHERE sutun_adi = veri --> Tablodaki istedigimiz veriyi siler

CREATE TABLE ogrenciler(
id int,
isim varchar(50),
veli_isim varchar(50),
yazili_notu int	
);
INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler;

-- Soru : id'si 124 olan öğrenciyi siliniz
DELETE FROM ogrenciler WHERE id = 124;

-- Soru : ismi Kemal Yasa olan satırı siliniz
DELETE FROM ogrenciler WHERE isim = 'Kemal Yasa';

-- Soru : ismi Nesibe Yılmaz veya Mustafa Bak olan kayıtları silelim
DELETE FROM ogrenciler WHERE isim ='Nesibe Yilmaz' or isim = 'Mustafa Bak';

-- soru : ismi Ali Can ve id'si 123 olan kaydı siliniz
delete from ogrenciler WHERE isim='Ali Can' or id=123;

-- Tablodaki tüm verileri silelim
Delete from ogrenciler

-- DELETE - TRUNCATE --
-- TRUNCATE komutu DELETE komutu gibi bir tablodaki verilerin tamamını siler.
-- Ancak, seçmeli silme yapamaz
select * from ogrenciler;
TRUNCATE TABLE ogrenciler
-- DDL - Data Definition Lang. veri tanımlama dili
-- CREATE - ALTER - DROP
-- ALTER TABLE --
-- ALTER TABLE tabloda ADD, TYPE, SET, RENAME veya DROP COLUMNS işlemleri için kullanılır

--Personel isminde bir tablo oluşturalım
create table personel( -- yukarida olusturdugumuz personel tablosunu gorelim diye getirdik
pers_id int,
isim varchar(30),
sehir varchar(30),
maas int,
sirket varchar(20),
adres varchar(50)
);

-- ALTER günceller DROP siler
select * from isciler;

-- Personel tablosuna cinsiyet Varchar(20) ve yas int seklinde yeni sutunlar ekleyiniz
alter table personel add cinsiyet varchar(20), add yas int;

--Personel tablosundan sirket field'ini siliniz
alter table personel drop column sirket;

-- Personel tablosundaki sehir sutununun adını ulke olarak değiştirelim
alter table personel RENAME column sehir to ulke;

-- Personel tablosunun adını isciler olarak değiştiriniz
alter table personel rename to isciler;

-- DDL - DROP komutu
DROP table isciler;

-- CONSTRANINT -- Kısıtlamalar
-- Primary Key --> Bir sutunun NULL içermemesini ve sutundaki verilerin BENZERSİZ olmasını sağlar (NOT NULL - UNIQUE)
-- FOREGIN KEY --> Başka bir tablodaki PRİMARY KEY'i referans göstermek için kullanılır. Böylelikle, tablolar arasında ilişki kurmuş oluruz.
-- UNIQUE --> Bir sutundaki tüm değerlerin BENZERSİZ yani tek olmasını sağlar
-- NOT NULL --> Bir sutunun NULL içermemesini yani boş olmamasını sağlar
-- NOT NULL kısıtlaması için CONSTRAINT ismi tanımlanmaz. Bu kısıtlama veri türünden hemen sonra yerleştirilir
-- CHECK --> Bir sutuna yerleştirilebilecek değer aralığını sınırlamak için kullanılır.

CREATE TABLE calisanlar
(
id CHAR(5) PRIMARY KEY, -- not null + unique
isim VARCHAR(50) UNIQUE, -- UNIQUE --> Bir sutundaki tüm değerlerin BENZERSİZ yani tek olmasını sağlar
maas int NOT NULL, -- NOT NULL --> Bir sutunun NULL içermemesini yani boş olmamasını sağlar
ise_baslama DATE
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14'); --Unique
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); --NOT NULL
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); --UNIQUE isim 2 defa kullanilmis
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); --NOT NULL
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14'); --buradaki '' deger gibi kabul etti ama bir sonrakinde kabul etmeyecek
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); --PRIMARY KEY
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); --PRIMARY KEY
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- PRIMARY KEY


select * from calisanlar
-- FOREIGN KEY--
CREATE TABLE adresler
(
adres_id char(5),
sokak varchar(20),
cadde varchar(30),
sehir varchar(20),
CONSTRAINT id_fk FOREIGN KEY (adres_id) REFERENCES calisanlar(id)   
);

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
select * from adresler;


