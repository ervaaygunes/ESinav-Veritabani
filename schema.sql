
CREATE TABLE adres (
    il_id INT(5) PRIMARY KEY,         
    il_adi VARCHAR(20)        
);


CREATE TABLE ogretmen (
    ogretmen_id INT(10) PRIMARY KEY,
    ogretmen_adi VARCHAR(20) NOT NULL,
    ogretmen_soyadi VARCHAR(20) NOT NULL,
    il_id INT(5) NOT NULL,
    FOREIGN KEY (il_id) REFERENCES adres(il_id)
);


CREATE TABLE ders_bilgileri (
    ders_id INT(10) PRIMARY KEY,   
    ders_adi VARCHAR(20) NOT NULL,  
    ders_kredisi INT(3) NOT NULL,  
    ogretmen_id INT(10) NOT NULL,  
    FOREIGN KEY (ogretmen_id) REFERENCES ogretmen(ogretmen_id)
);

CREATE TABLE sinav_programi (
    sinav_id INT(20) PRIMARY KEY AUTO_INCREMENT,
    ders_id INT(10) NOT NULL,
    sinav_tarihi DATETIME NOT NULL,
    sinav_saati TIME NOT NULL,
    sinav_suresi INT NOT NULL,
    FOREIGN KEY (ders_id) REFERENCES ders_bilgileri(ders_id)
);


CREATE TABLE sinav_sonuclari (
    sonuc_id INT(10) PRIMARY KEY,
    ogrenci_id INT(10),
    sinav_id INT(20),
    notu INT(4),
    gecme_durumu TINYINT,
    FOREIGN KEY (sinav_id) REFERENCES sinav_programi(sinav_id)
);


CREATE TABLE ogrenci (
    ogrenci_id INT(10) PRIMARY KEY,
    ad VARCHAR(20) NOT NULL,
    soyad VARCHAR(20) NOT NULL,
    dogum_tarihi DATETIME NOT NULL,
    cinsiyet VARCHAR(10),
    tel_no VARCHAR(11),
    sonuc_id INT(10),
    il_id INT(5),
    FOREIGN KEY (sonuc_id) REFERENCES sinav_sonuclari(sonuc_id),
    FOREIGN KEY (il_id) REFERENCES adres(il_id)
);



