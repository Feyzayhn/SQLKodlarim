-- SELECT - SIMILAR TO - REGEX(Regular Expressions) --
/*
SIMILAR TO : Daha karmaşık pattern(kalıp) ile sorgulama işlemi için SIMILAR TO kullanilabilir
Sadece ProtgreSQL de kullanilir. buyuk kucuk harf onemlidir

REGEX : Herhangi bir kod, metin içerisinde istenen yazi veya kod parçasinin aranip bulunmasini saglayan
kendine ait bir söz dizimi olan bir yapidir. 
MySQL de(REGEXP_LİKE) olarak kullanilir
PostgreSQL'de "~" karakteri ile kullanilir.
*/

CREATE TABLE kelimeler
(
id int,
kelime VARCHAR(50),
harf_sayisi int
);

   INSERT INTO kelimeler VALUES (1001, 'hot', 3);
   INSERT INTO kelimeler VALUES (1002, 'hat', 3);
   INSERT INTO kelimeler VALUES (1003, 'hit', 3);
   INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
   INSERT INTO kelimeler VALUES (1005, 'hct', 3);
   INSERT INTO kelimeler VALUES (1006, 'adem', 4);
   INSERT INTO kelimeler VALUES (1007, 'selim', 5);
   INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
   INSERT INTO kelimeler VALUES (1009, 'hip', 3);
   INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
   INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
   INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
   INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
   INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
   INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
   INSERT INTO kelimeler VALUES (1016, 'booooot', 5);
   INSERT INTO kelimeler VALUES (1017, 'bolooot', 5);
   
select * from kelimeler   

-----------------------------------------------------------------------------------------


-- İçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz

-- Veya islemi için | karakteri kullanilir
--SIMILAR TO buyuk - kucuk harf ayrimina takilir

--SIMILAR TO ile
select * from kelimeler WHERE kelime SIMILAR TO '%(at|ot)%';
select * from kelimeler WHERE kelime SIMILAR TO '%(at|ot|OT|AT|aT|At|Ot|oT)%';

--LIKE İLE
select * from kelimeler WHERE kelime ILIKE '%at%' or kelime ILIKE '%ot%';
SELECT * FROM kelimeler where kelime ~~* '%at%' or kelime ~~* '%ot%2';

--REGEX ILE
select * from kelimeler WHERE kelime ~* 'ot' or kelime ~* 'at';
-- ~* buyuk kucuk fark etmez
-- ~  buyuk kucuk harf fark eder

-----------------------------------------------------------------------------------------

-- : 'ho' veya 'hi' ile başlayan kelimeleri listeleyeniz

--SIMILAR TO ile
select * from kelimeler WHERE kelime similar to 'ho%|hi%'
--LIKE İLE
select * from kelimeler WHERE kelime ~~* 'ho%' or kelime ~~* 'hi%';
--REGEX ILE
select * from kelimeler WHERE kelime ~* 'h[oi](.*)'; --Regex'te ".(nokta) bir karakteri temsil eder"
-- h[oi]  h parantezine almişiz gibi düşün 
-- (.*) bu da sonunda veya başinda ne olursa olsun gibi oldu
-- Regex'de ikinci karakter icin [] kullanilir. * hepsi anlaminda kullanilir


-----------------------------------------------------------------------------------------

--Sonu 't' veya 'm' ile bitenleri listeleyeniz

--SIMILAR TO ile
select * from kelimeler WHERE kelime similar to '%t|%m'; 
--REGEX ILE
select * from kelimeler WHERE kelime ~* '(.*)[tm]$'; --$ karakteri bitişi gösterir

-----------------------------------------------------------------------------------------

-- h ile başlayıp t ile biten 3 harfli kelimeleri listeleyeniz

--SIMILAR TO ile
select * from kelimeler WHERE kelime similar to 'h[a-z,A-Z,0-9]t';
--LIKE İLE
select * from kelimeler WHERE kelime ~~* 'h_t';
--REGEX ILE
select * from kelimeler WHERE kelime ~* 'h[a-z,A-Z,0-9]t';
--0-9 bunu yazmamizin sebebi bu sayilar da arasinda varsa bunlarda dahil olsun "h9t" ,hOt"

-----------------------------------------------------------------------------------------

--İlk karakteri 'h', son karakteri 't'
--ve ikinci karakteri 'a'dan 'e'ye herhangi bir karakter olan “kelime" değerlerini çağırın.

--SIMILAR TO ile
select kelime from kelimeler WHERE kelime  similar to 'h[a-e]%t';
-- REGEX ile
select kelime from kelimeler where kelime ~* 'h[a-e](.*)t'


-----------------------------------------------------------------------------------------

--İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın.

select * from kelimeler where kelime ~ '^[say](.*)' -- ^ başlangıç'ı temsil eder

--Son karakteri 'm', 'a' veya 'f' olan "kelime" değerlerini çağırın.
select * from kelimeler where kelime ~ '(.*)[maf]$'

-----------------------------------------------------------------------------------------

--İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım.

--SIMILAR TO ile
select * from kelimeler WHERE kelime similar to 'h[a|i]t';
-- REGEX ile
select * from kelimeler where kelime ~ '^h[a|i]t$'


-----------------------------------------------------------------------------------------
--İlk harfi 'b dan ‘s'ye bir karakter olan ve ikinci harfi herhangi bir karakter 
--olup üçüncü harfi ‘l' olan “kelime" değerlerini çağırın.

select * from kelimeler WHERE kelime ~ '^[b|s].l(.*)'

-----------------------------------------------------------------------------------------

--içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
--SIMILAR TO ile
select * from kelimeler WHERE kelime similar to '%[o][o]%';
select * from kelimeler WHERE kelime similar to '%[o]{2}%'
--Süslü parantez icinde belirttigimiz rakam bir önceki köşeli parantez içinde 
--kaç tane oldugunu belirtir
--REGEX ILE
SELECT * FROM kelimeler WHERE kelime ~ '(.*)o(.*)o(.*)'


--içerisinde  o ve l barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler WHERE kelime similar to '%[o][l]%';

-----------------------------------------------------------------------------------------

--içerisinde en az 4 adet oooo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler WHERE kelime similar to '%[o]{4}%';


--'a', 's' yada 'y' ile başlayan VE 'm' yada 'f' ile biten "kelime" değerlerini çağırın.
--REGEX ILE
select * from kelimeler WHERE kelime ~ '^[a|s|y](.*)[m|f]$';
