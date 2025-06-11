-- dummy_data.sql

INSERT INTO users (nama_lengkap, email, no_wa, role)
VALUES 
('Rani Putri', 'rani@mail.com', '081234567890', 'freelancer'),
('Doni Saputra', 'doni@mail.com', '082233445566', 'klien');

INSERT INTO services (user_id, nama_jasa, deskripsi, kategori, harga)
VALUES 
(1, 'Desain Poster Aesthetic', 'Poster digital full HD ukuran A4 dan A3', 'desain', 30000),
(1, 'Jasa Ketik Makalah', 'Ketik rapi + cover + daftar isi', 'pengetikan', 15000);

INSERT INTO orders (service_id, klien_id, status, catatan)
VALUES 
(1, 2, 'proses', 'Tolong buatkan poster tema teknologi');

INSERT INTO reviews (order_id, rating, komentar)
VALUES 
(1, 5, 'Hasilnya keren dan tepat waktu, makasih!');
