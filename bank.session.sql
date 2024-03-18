-- Mohamad Ilham Praditya Arifatul Nesta

CREATE DATABASE bank;

CREATE TABLE nasabah(
    id_nasabah bigserial primary key,
    nama_lengkap varchar(255) not null,
    tanggal_lahir varchar(255) not null,
    jenis_kelamin varchar(255) not null,
    nik integer not null,
    no_telpon varchar(255) not null,
    alamat varchar(255) not null
);

CREATE TABLE akun(
    id_akun bigserial primary key,
    username varchar(255) not null,
    password varchar(255) not null,
    email varchar(255) not null,
    no_rekening integer not null,
    saldo integer not null,
    id_nasabah integer not null references nasabah(id_nasabah)
);

CREATE TABLE transaksi(
    id_transaksi bigserial primary key,
    tgl_transaksi varchar(255) not null,
    jenis_transaksi varchar(255) not null,
    nominal_transaksi bigint not null,
    rekening_tujuan bigint not null,
    keterangan varchar(255),
    id_akun integer not null references akun(id_akun)
);

-- insert data

-- NASABAH
INSERT into nasabah(nama_lengkap,tanggal_lahir,jenis_kelamin,nik,no_telpon,alamat) VALUES ('ilham praditya','25 juni 2003', 'laki laki', 341203451, '08567','mojokerto');
INSERT into nasabah(nama_lengkap,tanggal_lahir,jenis_kelamin,nik,no_telpon,alamat) VALUES ('azizatul fara','21 juni 2003', 'perempuan', 351483451, '08987','surabaya');
INSERT into nasabah(nama_lengkap,tanggal_lahir,jenis_kelamin,nik,no_telpon,alamat) VALUES ('joko ganteng','29 juli 2003', 'laki laki', 381323451, '08754','surabaya');

-- AKUN
INSERT INTO akun(username, password, email, no_rekening, saldo, id_nasabah) VALUES ('ilhamprdty', 'ilham87', 'ilhampraditya@gmail.com', 2345678, 500000, 1);
INSERT INTO akun(username, password, email, no_rekening, saldo, id_nasabah) VALUES ('azizafara','fara39','fara@gmail.com',56786577,700000, 2);
INSERT INTO akun(username, password, email, no_rekening, saldo, id_nasabah) VALUES ('jokogans','joko124','joko@gmail.com',12323468,800000, 3);

-- TRANSAKSI
INSERT INTO transaksi(tgl_transaksi,jenis_transaksi, nominal_transaksi, rekening_tujuan, keterangan,id_akun) VALUES ('18 maret 2024','tranfer', 100000, 34565434, 'uang makan' , 1);
INSERT INTO transaksi(tgl_transaksi,jenis_transaksi, nominal_transaksi, rekening_tujuan, keterangan,id_akun) VALUES  ('17 maret 2024','deposit',200000, 45677777, '', 2 );
INSERT INTO transaksi(tgl_transaksi,jenis_transaksi, nominal_transaksi, rekening_tujuan, keterangan,id_akun) VALUES ('16 maret 2024','withdraw', 300000, 34565434, '' ,3);



-- READ DATA
-- ---------------------
-- NASABAH
SELECT * FROM nasabah;
SELECT * FROM nasabah WHERE id_nasabah = '1';

-- AKUN
SELECT * FROM akun;
SELECT * FROM akun WHERE id_akun = '1';

-- TRANSAKSI
SELECT * FROM transaksi;
SELECT * FROM transaksi WHERE id_transaksi = '1';


-- UPDATE DATA
-- ----------------------
UPDATE transaksi SET keterangan = 'investasi' WHERE id_transaksi = '2';

-- DELETE DATA 
-- -------------------
DELETE FROM transaksi WHERE id_transaksi = '3';

