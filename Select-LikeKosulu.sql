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

-- 'a' ile başlayıp 'n' ile biten personel isimlerini listeleyiniz
select * from personel WHERE isim ~~* 'a%n';

-- ikinci karakteri 'a' ve dördüncü karakteri 'u' olan personel isimlerini listeleyiniz
select * from personel WHERE isim ~~ '_a_u%'; 

-- İçinde 'e' ve 'r' bulunan personel isimlerini listeleyiniz
select * from personel WHERE isim ~~* '%e%' and isim ~~ '%r%';
select * from personel where isim ilike '%e%r%'; -- iki türlüde cozulur

-- 2. harfi e olup diğer harflerinde y olan personeli listeleyiniz
select * from personel WHERE isim ~~ '_e%y%';

-- a harfi olmayan personeli listeleyin
select * from personel WHERE isim not like '%a%';

-- 1. harfi A ve 7. harfi a olan personeli listeleyin
select * from personel WHERE isim ~~* 'A_____a%';

--Sondan ikinci karakteri 'r' olan "isim" değerlerini listeleyiniz.
select * from personel WHERE isim ~~* '%r_';




