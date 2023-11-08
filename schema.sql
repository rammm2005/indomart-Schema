-- Schema Database for Indomart Tugas Basis Data Semester Ganjil
-- Rama :)

-- Make The Db name 
CREATE DATABASE indomart; 

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
    kode_jenis_barang CHAR(10) NOT NULL,
    id_merk INTEGER(15) NOT NULL,

    createdAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    updatedAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,


    PRIMARY KEY (kode_barang),
    FOREIGN KEY kode_jenis_barang REFERENCES tbl_jenis_barang (kode_jenis_barang) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY id_merk REFERENCES tbl_merk (id_merk) ON DELETE CASCADE ON UPDATE CASCADE
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
    FOREIGN KEY kode_member REFERENCES member(kode_member) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE member(
    kode_member CHAR(5) NOT NULL,
    nama_jenis VARCHAR(20) NOT NULL,
    deskripsi TEXT,
    createdAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    updatedAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    PRIMARY KEY (kode_member)
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
    FOREIGN KEY kode_divisi REFERENCES divisi(kode_divisi) ON DELETE CASCADE ON UPDATE CASCADE
);


CRETAE TABLE divisi(
    kode_divisi CHAR(5) NOT NULL,
    nama_jenis VARCHAR(20) NOT NULL,
    deskripsi TEXT,

    createdAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,
    updatedAt DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) NOT NULL,

    PRIMARY KEY (kode_divisi)
);