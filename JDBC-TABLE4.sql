--Function olusturma
-- 1.Ornek: IKI PARAMETRE İLE CALİSİP BU PARAMETRELERİ TOPLAYARAK RETURN YAPAN BİR FONKSİYON OLUSTURUN.

CREATE FUNCTION toplamaF(x NUMERIC,y NUMERIC) --2 PARAMETRESİ OLAN BİR FUNCTİON OLUSTURDU
RETURNS NUMERIC
LANGUAGE plpgsql --postgreSQL in simini yazidk burda
AS
$$ -- bunlari parantez yerine kullaniyoruz
BEGIN

RETURN x+y;

END
$$-- bunlari parantez yerine kullaniyoruz

SELECT * FROM toplamaF(15,25) AS toplam; --toplamak istedigimiz parametreleri bunun icine koyuyoruz
