-- schema.sql

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    nama_lengkap TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    no_wa VARCHAR(15),
    role VARCHAR(20) CHECK (role IN ('freelancer', 'klien')) NOT NULL,
    tanggal_gabung TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE services (
    service_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    nama_jasa TEXT NOT NULL,
    deskripsi TEXT,
    kategori TEXT,
    harga INT CHECK (harga >= 0),
    tanggal_ditambahkan TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    service_id INT REFERENCES services(service_id),
    klien_id INT REFERENCES users(user_id),
    status TEXT CHECK (status IN ('pending', 'proses', 'selesai', 'dibatalkan')) DEFAULT 'pending',
    tanggal_pesan TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    catatan TEXT
);

CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    rating INT CHECK (rating >= 1 AND rating <= 5),
    komentar TEXT,
    tanggal_ulasan TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
