CREATE TABLE sirketler
(
	sirket_id int,
	sirket_isim VARCHAR(20)
);

INSERT INTO sirketler VALUES(100, 'Toyota');
INSERT INTO sirketler VALUES(101, 'Honda');
INSERT INTO sirketler VALUES(102, 'Ford');
INSERT INTO sirketler VALUES(103, 'Hyundai');
                                                 --sirket_id ler ortak oldugu icin field lardan baglanti kuruldu
CREATE TABLE siparisler                          --sirketler          siparisler
(
	siparis_id int,
	sirket_id int,
	siparis_tarihi DATE
);

INSERT INTO siparisler VALUES(11, 101, '2022-04-17');
INSERT INTO siparisler VALUES(22, 102, '2022-04-18');
INSERT INTO siparisler VALUES(33, 103, '2022-04-19');
INSERT INTO siparisler VALUES(44, 104, '2022-04-20');
INSERT INTO siparisler VALUES(55, 105, '2022-04-21');

select * from sirketler;
select * from siparisler;

-----------------------------------------------------------------------------------

 --sirket_id ler ortak oldugu icin field lardan baglanti kuruldu
--sirketler          siparisler
  --100                 101**          ** ortak id leri isaretledik
  --101**               102**
  --102**               103**
  --103**               104
                      --105
					
-----------------------------------------------------------------------------------					
					  
--SORU1: Iki Tabloda sirket_id’si ayni olanlarin; sirket_ismi, siparis_id ve
-- siparis_tarihleri listeleyen bir sorgu yaziniz.	

SELECT A.sirket_id, A.sirket_isim,B.siparis_id,B.siparis_tarihi 
FROM siparisler AS B
INNER JOIN sirketler AS A
ON A.sirket_id=B.sirket_id;

-- sirket_id karismasin diye tablolara A-b gibi isimler veredik
--SİRKETLER TABLOSU=A
--SIPARISLER TABLOSU=B OLDU hangi bilgiyi nereden getiriyorsak basina tabloya verdigimiz ismi koyuyorz

					
-----------------------------------------------------------------------------------	

--SORU2: sirketler tablosundaki tum sirketleri ve bu sirketlere ait olan
--siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.

--LEFT ILE COZUM
SELECT A.sirket_isim,A.sirket_id, B.siparis_id,B.siparis_tarihi
FROM sirketler AS A
LEFT JOIN siparisler AS B
ON A.sirket_id=B.sirket_id;

--RIGTH ILE COZUM
SELECT A.sirket_isim,A.sirket_id, B.siparis_id,B.siparis_tarihi
FROM siparisler AS B
RIGHT JOIN sirketler AS A
ON A.sirket_id=B.sirket_id;

--IKI TABLODA DA ORTAK NOKTA sirket_id oldugu icin ON ile bunlari birbirine bagladik


-----------------------------------------------------------------------------------	

--SORU3: siparisler tablosundaki tum siparis_id ve siparis_tarihleri ile
--bunlara karşılık gelen sirket_isimlerini listeleyen bir sorgu yaziniz.

SELECT B.sirket_id, B.sirket_isim, A.siparis_id, A.siparis_tarihi 
FROM siparisler AS A
FULL JOIN sirketler AS B
ON A.sirket_id=B.sirket_id;

-----------------------------------------------------------------------------------	







