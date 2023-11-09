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
    id_pelanggan INTEGER(15) NOT NULL,
    nama_pelanggan VARCHAR(50) NOT NULL,
    alamat VARCHAR(100) NOT NULL,
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
    id_pegawai INTEGER(15) NOT NULL,
    nama_pegawai VARCHAR(50) NOT NULL,
    no_tlp VARCHAR(14) NOT NULL,
    email VARCHAR(50) NOT NULL,
    alamat VARCHAR(50) NOT NULL,
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
    kode_barang CHAR(10) NOT NULL,
    no_nota CHAR(10) NOT NULL,
    id_pegawai INTEGER(15) NOT NULL,
    jumlah INTEGER(5) NOT NULL,
    harga_jual FLOAT(15) NOT NULL,
    createdAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    updatedAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    PRIMARY KEY (kode_barang, no_nota, id_pegawai),
    FOREIGN KEY (kode_barang) REFERENCES barang (kode_barang) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (no_nota) REFERENCES penjualan (no_nota) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_pegawai) REFERENCES pegawai (id_pegawai) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE tbl_detail_pembelian (
    kode_barang CHAR(10) NOT NULL,
    no_nota CHAR(10) NOT NULL,
    id_pelanggan INTEGER(15) NOT NULL,
    jumlah INTEGER(5) NOT NULL,
    harga_beli FLOAT(15) NOT NULL,
    createdAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    updatedAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    PRIMARY KEY (kode_barang, no_nota, id_pelanggan),
    FOREIGN KEY (kode_barang) REFERENCES barang (kode_barang) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (no_nota) REFERENCES pembelian (no_nota) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan (id_pelanggan) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create Some Field
INSERT INTO tbl_jenis_barang (
	kode_jenis_barang,
	nama_jenis_barang,
	deskripsi
) VALUES (
	'B1000',
	'Makanan',
	'Ini Adalah Makanan Apa saja yang bisa masuk makanan ya di gigit'
),('B1001', 'Minuman Kaleng','Pake Nanya'),('B1002', 'Minuman Saset','Pake Nanya Lagi');
