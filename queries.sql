-- İlk sorgu: Öğrenci bilgileri ile sınav sonuçlarını birleştirerek öğrenci adı, soyadı, sınav tarihi ve notu bilgilerini getirme
-- Bu sorgu, ogrenci, sinav_sonuclari ve sinav_programi tablolarını birleştirir. Öğrenci adı ve soyadı ile ilgili sınav bilgilerini getirir.
-- İlk iç birleştirme öğrenci ID'lerini ve sınav sonuçları arasındaki ilişkiyi, ikinci iç birleştirme ise sınav sonuçları ve sınav programı arasındaki ilişkiyi sağlar.

SELECT ogrenci.ad, ogrenci.soyad, sinav_programi.sinav_tarihi, sinav_sonuclari.notu
FROM ogrenci
INNER JOIN sinav_sonuclari ON ogrenci.ogrenci_id = sinav_sonuclari.ogrenci_id
INNER JOIN sinav_programi ON sinav_sonuclari.sinav_id = sinav_programi.sinav_id;


-- İkinci sorgu: Öğretmen ve ders bilgilerini birleştirerek ders adı, öğretmen adı ve soyadı bilgilerini getirme
-- Bu sorgu ise ders_bilgileri ve ogretmen tablolarını birleştirir. Ders adları ile ilgili öğretmen adı ve soyadı bilgilerini getirir.
-- İki tablo arasındaki birleştirme, derslerin öğretmenlerle ilişkisini kurar.

SELECT ders_bilgileri.ders_adi, ogretmen.ogretmen_adi, ogretmen.ogretmen_soyadi
FROM ders_bilgileri
INNER JOIN ogretmen ON ders_bilgileri.ogretmen_id = ogretmen.ogretmen_id;