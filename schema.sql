-- Schema Database for Indomart Tugas Basis Data Semester Ganjil
-- Rama :)
-- Make The Db name 
CREATE DATABASE indomart;
USE indomart;
SHOW TABLES;
DESCRIBE TABLE_NAME;
-- Model Databases
CREATE TABLE tbl_jenis_barang (
    kode_jenis_barang CHAR(5) NOT NULL,
    nama_jenis_barang VARCHAR(20) NOT NULL,
    deskripsi TEXT,
    createdAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    updatedAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    PRIMARY KEY (kode_jenis_barang)
);
CREATE TABLE tbl_merk(
    id_merk INTEGER(15) AUTO_INCREMENT NOT NULL,
    nama_merk VARCHAR(25) NOT NULL,
    deskripsi TEXT,
    createdAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    updatedAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    PRIMARY KEY (id_merk)
);
CREATE TABLE barang (
    kode_barang CHAR(10) NOT NULL,
    nama_barang VARCHAR(50) NOT NULL,
    harga_barang FLOAT NOT NULL,
    stok INTEGER(5) NOT NULL,
    deskripsi TEXT,
    kode_jenis_barang CHAR(5) NOT NULL,
    id_merk INTEGER(15) NOT NULL,
    createdAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    updatedAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    PRIMARY KEY (kode_barang),
    FOREIGN KEY (kode_jenis_barang) REFERENCES tbl_jenis_barang (kode_jenis_barang) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_merk) REFERENCES tbl_merk (id_merk) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE member(
    kode_member CHAR(5) NOT NULL,
    nama_jenis VARCHAR(20) NOT NULL,
    deskripsi TEXT,
    createdAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    updatedAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    PRIMARY KEY (kode_member)
);
CREATE TABLE pelanggan (
    id_pelanggan INTEGER(15) NOT NULL AUTO_INCREMENT,
    nama_pelanggan VARCHAR(50) NOT NULL,
    jalan VARCHAR(50) NOT NULL,
    kecamatan VARCHAR(50) NOT NULL,
    kabupaten VARCHAR(50) NOT NULL,
    kode_pos INTEGER(5) NOT NULL,
    kelamin ENUM('l','p') NOT NULL,
    no_tlp VARCHAR(14) NOT NULL,
    email VARCHAR(50) NOT NULL,
    kode_member CHAR(5) NOT NULL,
    createdAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    updatedAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    PRIMARY KEY (id_pelanggan),
    FOREIGN KEY (kode_member) REFERENCES member(kode_member) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE divisi(
    kode_divisi CHAR(5) NOT NULL,
    nama_jenis VARCHAR(20) NOT NULL,
    deskripsi TEXT,
    createdAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    updatedAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    PRIMARY KEY (kode_divisi)
);
CREATE TABLE pegawai(
    id_pegawai INTEGER(15) NOT NULL AUTO_INCREMENT,
    nama_pegawai VARCHAR(50) NOT NULL,
    no_tlp VARCHAR(14) NOT NULL,
    email VARCHAR(50) NOT NULL,
    jalan VARCHAR(50) NOT NULL,
    kecamatan VARCHAR(50) NOT NULL,
    kabupaten VARCHAR(50) NOT NULL,
    kode_pos INTEGER(5) NOT NULL,
    kelamin ENUM('l','p') NOT NULL,
    kode_divisi CHAR(5) NOT NULL,
    createdAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    updatedAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    PRIMARY KEY (id_pegawai),
    FOREIGN KEY (kode_divisi) REFERENCES divisi(kode_divisi) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE tipe_pembayaran(
    id_tipe_pembayaran INTEGER(15) AUTO_INCREMENT NOT NULL,
    nama_tipe VARCHAR(30) NOT NULL,
    createdAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    updatedAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    PRIMARY KEY (id_tipe_pembayaran)
);
CREATE TABLE penjualan (
    no_nota CHAR(10) NOT NULL,
    tgl_penjualan DATE NOT NULL,
    jumlah_item INTEGER(5) NOT NULL,
    id_tipe_pembayaran INTEGER(15) NOT NULL,
    createdAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    updatedAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    PRIMARY KEY (no_nota),
    FOREIGN KEY (id_tipe_pembayaran) REFERENCES tipe_pembayaran (id_tipe_pembayaran) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE pembelian (
    no_nota CHAR(10) NOT NULL,
    tgl_pembelian DATE NOT NULL,
    jumlah_item INTEGER(5) NOT NULL,
    id_tipe_pembayaran INTEGER(15) NOT NULL,
    createdAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    updatedAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    PRIMARY KEY (no_nota),
    FOREIGN KEY (id_tipe_pembayaran) REFERENCES tipe_pembayaran (id_tipe_pembayaran) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE tbl_detail_penjualan (
    id INTEGER(11) NOT NULL AUTO_INCREMENT,
    kode_barang CHAR(10) NOT NULL,
    no_nota CHAR(10) NOT NULL,
    id_pegawai INTEGER(15) NOT NULL,
    jumlah INTEGER(5) NOT NULL,
    harga_jual FLOAT(15) NOT NULL,
    createdAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    updatedAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (kode_barang) REFERENCES barang (kode_barang) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (no_nota) REFERENCES penjualan (no_nota) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_pegawai) REFERENCES pegawai (id_pegawai) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE tbl_detail_pembelian (
    id INTEGER(11) NOT NULL AUTO_INCREMENT,
    kode_barang CHAR(10) NOT NULL,
    no_nota CHAR(10) NOT NULL,
    id_pelanggan INTEGER(15) NOT NULL,
    jumlah INTEGER(5) NOT NULL,
    harga_beli FLOAT(15) NOT NULL,
    createdAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    updatedAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (kode_barang) REFERENCES barang (kode_barang) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (no_nota) REFERENCES pembelian (no_nota) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan (id_pelanggan) ON DELETE CASCADE ON UPDATE CASCADE
);
-- ALTER TABLE 
ALTER TABLE barang
MODIFY COLUMN harga_barang FLOAT(9, 3);
-- INSERT VALUE INTO TABLES
INSERT INTO tbl_jenis_barang (
        kode_jenis_barang,
        nama_jenis_barang,
        deskripsi
    )
VALUES (
        'B1000',
        'Makanan',
        'Ini Adalah Makanan Apa saja yang bisa masuk makanan ya di gigit'
    ),
    ('B1001', 'Minuman Kaleng', 'Pake Nanya'),
    ('B1002', 'Minuman Saset', 'Pake Nanya Lagi');
-- Inseert Tabel Merk
INSERT INTO tbl_merk (nama_merk, deskripsi)
VALUES (
        "Indomilk",
        "Merupakan sebuah Brand Minuman yang merujuk ke susu segar"
    ),
    ("Mie Sedap", "Merupakan sebuah Brand Mie Instan"),
    (
        "Sari Roti",
        "Merupakan sebuah Brand Roti yang sangat di gemari di Indonesia"
    );
-- Insert Tabel Barang
INSERT INTO barang (
        kode_barang,
        nama_barang,
        harga_barang,
        stok,
        deskripsi,
        kode_jenis_barang,
        id_merk
    )
VALUES (
        "BIX069428G",
        "Beng Beng",
        2.500,
        100,
        "Beng beng adalah makanan yang memiliki 4 layer kenikmatan yang mantap setiap gigitannya menghasilkan kenikmatan",
        "B1000",
        "1"
    ),
    (
        "BIX0920UDI",
        "Dorayaki",
        6.500,
        200,
        "Dorayaki Sari Roti adalah makanan yang memiliki kenikmatan yang mantap setiap gigitannya menghasilkan kenikmatan",
        "B1000",
        "3"
    );
-- Insert Table Divisi
INSERT INTO divisi (kode_divisi, nama_jenis, deskripsi)
VALUES (
        "DP001",
        "Sales",
        "Divisi yang bekerja untuk menjual barang"
    ),
    (
        "DP002",
        "Designer",
        "Divisi yang bekerja sebagai tim design untuk produk"
    );
-- Insert Member
INSERT INTO member (kode_member, nama_jenis, deskripsi)
VALUES (
        "MU00S",
        "Super Premium",
        "Pelanggan dengan Member status Premium"
    ),
    (
        "MU00B",
        "Basic",
        "Pelanggan dengan Mmeber Status Basic"
    );
-- Inser Into Pegawai
INSERT INTO pegawai (nama_pegawai, no_tlp, email, jalan, kode_pos, kecamatan, kelamin, kabupaten, kode_divisi) VALUE (
        "Nolan",
        "087994279027",
        "nolan@gmail.com",
        "Jln.Jimbaran",
        80289,
        "Kelan",
        'p',
        "badung",
        "DP001"
    ),
    (
        "Sisna",
        "08542738784387",
        "sisna@gmail.com",
        "Jln.Batuaji",
         80282,
        "Sukawati",
        'p',
        "Giayar",
        "DP002"
    ),
    (
        "Putu",
        "08542738784387",
        "putu@gmail.com",
        "Jln.siulan",
         80223,
        "Pemcutan",
        'p',
        "Denpasar",
        "DP002"
    );
-- Isert Into Pelanggan
INSERT INTO pelanggan (
        nama_pelanggan,
        jalan, kode_pos, kecamatan, kelamin, kabupaten,
        no_tlp,
        email,
        kode_member
    )
VALUES (
        "Rama Ganteng",
        "Jln.Jimbaran",
        80289,
        "Kelan",
        'p',
        "badung",
        "0867467929",
        "ramaTmvan@gmail.com",
        "MU00S"
    ),
    (
        "Ray",
        "Jln.Kereneng",
        80289,
        "Kreneng",
        'p',
        "Denpasar",
        "0876565226",
        "ray@gmail.com",
        "MU00B"
    ),
    (
        "Rusdi",
        "Jln.Sudirman",
        80220,
        "Kreneng",
        'p',
        "Denpasar",
        "08002909393",
        "rudf@gmail.com",
        "MU00B"
    );


INSERT INTO penjualan ()

-- Updated Tables Pelanggan
UPDATE pelanggan SET email='ramaTampan@gmail.com' WHERE id_pelanggan=1;


-- Delete Data in Table 
DELETE FROM pelanggan WHERE id_pelanggan=3;



/*[22-Nov 15:03:03][2 ms]*/ UPDATE pegawai SET kelamin='l' WHERE id_pegawai=1; 
/*[22-Nov 15:03:24][2 ms]*/ UPDATE pegawai SET kelamin='l' WHERE id_pegawai=3; 
/*[22-Nov 15:03:27][0 ms]*/ UPDATE pegawai SET kelamin='l' WHERE id_pegawai=3; 
/*[22-Nov 15:04:02][3 ms]*/ UPDATE pegawai SET nama_pegawai='Michie',email='michie@gmail.com' WHERE id_pegawai=2; 


-- Show all pegawai Data
SELECT * FROM pegawai


-- Show nama Pegawai yang tinggal di Denpasar
SELECT nama_pegawai FROM pegawai WHERE kabupaten="Denpasar"

-- Show nama Pegawai yang Bernama Putu
SELECT nama_pegawai FROM pegawai WHERE nama_pegawai="Putu"

-- Count all data pegawai
SELECT COUNT(*) FROM pegawai;


-- Sort dari denpasar dan jenis kelamin laki"
SELECT * FROM pegawai WHERE kelamin='l' AND kabupaten='Denpasar';

-- Sort pegawai berdasarkan alamat
SELECT COUNT(jalan) FROM pegawai;

-- Jumlah data barang yang terjual
SELECT kode_barang, SUM(jumlah) AS total_terjual
FROM tbl_detail_penjualan
GROUP BY kode_barang;

-- total pendapatan dari barang yang terjual
SELECT kode_barang, SUM(jumlah * harga_jual) AS total_pendapatan
FROM tbl_detail_penjualan
GROUP BY kode_barang;

-- nama barang dan jumlah terjual
SELECT barang.`nama_barang`, SUM(tbl_detail_penjualan.jumlah) AS jumlah_terjual
FROM tbl_detail_penjualan
JOIN barang ON tbl_detail_penjualan.`kode_barang` = barang.`kode_barang`
GROUP BY barang.nama_barang;

-- tapi kalo misalnya nama barang sudah ada di field relasi pake ini COMMENTSELECT barang.`nama_barang`, SUM(tbl_detail_penjualan.jumlah) AS jumlah_terjual
SELECT `nama_barang`, SUM(jumlah) AS jumlah_terjual
FROM tbl_detail_penjualan
GROUP BY barang.nama_barang;

-- Fungsi Agregat
SELECT tbl_jenis_barang, SUM(stoke) FROM barang GROUP BY tbl_jenis_barang ;





