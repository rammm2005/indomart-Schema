<!-- Indomart Databases By Rama -->


<h4 style="color:pink; font-weight:800; font-size:2rem;">Rama Indomart Databases</h4>
<p style="font-size:1.5rem; font-weight:bold;">Indomart Database Schema</p>
<p style="font-size:1.3rem;">This document outlines the database schema for Indomart, a fictional retail store. The schema includes tables for managing various aspects of the store's operations, such as inventory, sales, and customers.</p>

# Database Setup
Create a database named indomart:

`SQL CODE : `

# CREATE DATABASE indomart;

Gunakan kode dengan hati-hati. Pelajari lebih lanjut

`SQL CODE  :` 
# USE indomart;
<p>USE INDOMART DATABASES</p>

# Tables tbl_jenis_barang

This table stores information about product categories.

| Column Name | Data Type | Description |
|---|---|---|
| kode_jenis_barang | CHAR(5) | Unique identifier for the product category |
| nama_jenis_barang | VARCHAR(20) | Name of the product category |
| deskripsi | TEXT | Description of the product category |
| createdAt | DATETIME(4) | Timestamp when the record was created |
| updatedAt | DATETIME(4) | Timestamp when the record was last updated |


# Tables tbl_merk

Column Name |	Data Type | Description |
|---|---|---|
|id_merk	INTEGER(15) | Auto-incrementing identifier for the product brand |
|nama_merk	| VARCHAR(25) |	Name of the product brand |
|deskripsi	| TEXT	| Description of the product brand |
|createdAt	| DATETIME(4) |	Timestamp when the record was created |
|updatedAt	| DATETIME(4) |	Timestamp when the record was last updated |


# Tables barang

<p>This table stores information about products.</p>

|Column Name |	Data Type |	Description |
|---|---|---|
|kode_barang |	CHAR(10) |	Unique identifier for the product |
|nama_barang |	VARCHAR(50) |	Name of the product |
|harga_barang |	FLOAT |	Price of the product |
|stok |	INTEGER(5) |	Quantity of the product in stock |
|deskripsi |	TEXT |	Description of the product |
|kode_jenis_barang |	CHAR(5) |	Foreign key referencing the kode_jenis_barang column in the tbl_jenis_barang table |
|id_merk |	INTEGER(15) |	Foreign key referencing the id_merk column in the tbl_merk table |
|createdAt |	DATETIME(4) |	Timestamp when the record was created |
|updatedAt |	DATETIME(4) |	Timestamp when the record was last updated |


# Tables member
<p>This table stores information about Indomart members.</p>

|Column Name |	Data Type |	Description |
|---|---|---|
|kode_member |	CHAR(5) |	Unique identifier for the member |
|nama_member |	VARCHAR(20) |	Name of the member |
|deskripsi |	TEXT |	Description of the member's membership |
|createdAt |	DATETIME(4) |	Timestamp when the record was created |
|updatedAt |	DATETIME(4) |	Timestamp when the record was last updated |

# Tables pelanggan 
<p>This table stores information about Indomart customers.</p>

|Column Name |	Data Type |	Description |
|---|---|---|
|id_pelanggan |	INTEGER(15)	Auto-incrementing identifier for the customer |
|nama_pelanggan |	VARCHAR(50) |	Name of the customer |
|alamat |	VARCHAR(100) |	Customer's address |
|no_tlp |	VARCHAR(14) |	Customer's phone number |
|email |	VARCHAR(50) |	Customer's email address |
|kode_member |	CHAR(5) |	Foreign key referencing the kode_member column in the member table |
|createdAt |	DATETIME(4) |	Timestamp when the record was created |
|updatedAt |	DATETIME(4) |	Timestamp when the record was last updated |


# Tables divisi

<p>This table stores information about Indomart departments.</p>

|Column Name |	Data Type |	Description |
|---|---|---|
|kode_divisi |	CHAR(5) |	Unique identifier for the department |
|nama_divisi |	VARCHAR(20) |	Name of the department |
|deskripsi |	TEXT |	Description of the department |
|createdAt |	DATETIME(4) |	Timestamp when the record was created |
|updatedAt |	DATETIME(4) | Timestamp when the record was last updated |

# Tables pegawai
<p>This table stores information about Indomart employees.</p>

|Column Name |	Data Type |	Description |
|---|---|---|
|id_pegawai |	INTEGER(15) |	Auto-incrementing identifier for the employee |
|nama_pegawai |	VARCHAR(50) |	Employee's name |

### Tabel `tipe_pembayaran`

This table stores information about payment types.

| Column Name           | Data Type          | Description                                       |
|-----------------------|-------------------|---------------------------------------------------|
| id_tipe_pembayaran    | INTEGER(15) AUTO_INCREMENT NOT NULL | Unique identifier for the payment type |
| nama_tipe             | VARCHAR(30)        | Name of the payment type                        |
| createdAt             | DATETIME(4)        | Timestamp when the record was created            |
| updatedAt             | DATETIME(4)        | Timestamp when the record was last updated       |
| PRIMARY KEY (id_tipe_pembayaran) |

### Tabel `penjualan`

This table stores information about sales transactions.

| Column Name         | Data Type    | Description                                  |
|---------------------|-------------|----------------------------------------------|
| no_nota             | CHAR(10)     | Unique identifier for the sales transaction |
| tgl_penjualan       | DATE        | Date of the sales transaction                |
| jumlah_item         | INTEGER(5)   | Number of items sold                         |
| id_tipe_pembayaran  | INTEGER(15) NOT NULL | Payment type for the transaction       |
| createdAt           | DATETIME(4)  | Timestamp when the record was created       |
| updatedAt           | DATETIME(4)  | Timestamp when the record was last updated |
| PRIMARY KEY (no_nota) |
| FOREIGN KEY (id_tipe_pembayaran) REFERENCES tipe_pembayaran (id_tipe_pembayaran) ON DELETE CASCADE ON UPDATE CASCADE |

### Tabel `pembelian`

This table stores information about purchase transactions.

| Column Name         | Data Type    | Description                                  |
|---------------------|-------------|----------------------------------------------|
| no_nota             | CHAR(10)     | Unique identifier for the purchase transaction |
| tgl_pembelian       | DATE        | Date of the purchase transaction                |
| jumlah_item         | INTEGER(5)   | Number of items purchased                         |
| id_tipe_pembayaran  | INTEGER(15) NOT NULL | Payment type for the transaction       |
| createdAt           | DATETIME(4)  | Timestamp when the record was created       |
| updatedAt           | DATETIME(4)  | Timestamp when the record was last updated |
| PRIMARY KEY (no_nota) |
| FOREIGN KEY (id_tipe_pembayaran) REFERENCES tipe_pembayaran (id_tipe_pembayaran) ON DELETE CASCADE ON UPDATE CASCADE |

### Tabel `tbl_detail_penjualan`

This table stores information about sales details.

| Column Name | Data Type | Description |
|-------------|----------|-------------|
| kode_barang | CHAR(10) | Unique identifier for the product |
| no_nota     | CHAR(10) | Unique identifier for the sales transaction |
| id_pegawai  | INTEGER(15) | Identifier for the employee handling the sale |
| jumlah      | INTEGER(5) | Number of items sold |
| harga_jual  | FLOAT(15) | Selling price of the product |
| createdAt   | DATETIME(4) | Timestamp when the record was created |
| updatedAt   | DATETIME(4) | Timestamp when the record was last updated |
| PRIMARY KEY (kode_barang, no_nota, id_pegawai) |
| FOREIGN KEY (kode_barang) REFERENCES barang (kode_barang) ON DELETE CASCADE ON UPDATE CASCADE |
| FOREIGN KEY (no_nota) REFERENCES penjualan (no_nota) ON DELETE CASCADE ON UPDATE CASCADE |
| FOREIGN KEY (id_pegawai) REFERENCES pegawai (id_pegawai) ON DELETE CASCADE ON UPDATE CASCADE |

### Tabel `tbl_detail_pembelian`

This table stores information about purchase details.

| Column Name | Data Type | Description |
|-------------|----------|-------------|
| kode_barang | CHAR(10) | Unique identifier for the product |
| no_nota     | CHAR(10) | Unique identifier for the purchase transaction |
| id_pelanggan | INTEGER(15) | Identifier for the customer making the purchase |
| jumlah      | INTEGER(5) | Number of items purchased |
| harga_beli  | FLOAT(15) | Purchase price of the product |
| createdAt   | DATETIME(4) | Timestamp when the record was created |
| updatedAt   | DATETIME(4) | Timestamp when the record was last updated |
| PRIMARY KEY (kode_barang, no_nota, id_pelanggan) |
| FOREIGN KEY (kode_barang) REFERENCES barang (kode_barang) ON DELETE CASCADE ON UPDATE CASCADE |
| FOREIGN KEY (no_nota) REFERENCES pembelian (no_nota) ON DELETE CASCADE ON UPDATE CASCADE |
| FOREIGN KEY (id_pelanggan) REFERENCES pelanggan (id_pelanggan) ON DELETE CASCADE ON UPDATE CASCADE |



# Developer Updated
<h4 style="color:blue; font-size:2rem; font-weight:700;">STILL ON Updated</h4>
<p style="font-size:1.3rem; color:white;">Masih ada byang belum di masukin ON Updated !!!</p>
<p style="font-size:1.6rem; color:yellow;">Byeeee :)</p>
###