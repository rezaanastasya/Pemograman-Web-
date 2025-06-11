# 📚 Freelance Kampus – Database Dokumentasi

Database ini dirancang untuk sistem layanan jasa freelance mahasiswa, seperti jasa ketik dokumen, desain, cetak, dan kebutuhan kampus lainnya. Cocok digunakan untuk startup digital printing dan jasa kampus berbasis kos atau lingkungan sekitar universitas.

---

## 🛠 Teknologi

- Database: PostgreSQL (bisa diadaptasi ke MySQL atau SQLite)
- Struktur data ditulis dalam file `schema.sql`
- Data dummy contoh dalam file `dummy_data.sql`

---

## 📂 Struktur Tabel

### 1. `users` – Data pengguna (freelancer & customer)
| Kolom       | Tipe Data   | Keterangan                              |
|-------------|-------------|-----------------------------------------|
| id          | SERIAL      | Primary key                             |
| name        | VARCHAR     | Nama lengkap                            |
| email       | VARCHAR     | Unik, email pengguna                    |
| password    | TEXT        | Password terenkripsi                    |
| role        | VARCHAR     | 'customer' atau 'freelancer'            |
| created_at  | TIMESTAMP   | Tanggal pendaftaran                     |

---

### 2. `services` – Layanan yang disediakan freelancer
| Kolom       | Tipe Data   | Keterangan                              |
|-------------|-------------|-----------------------------------------|
| id          | SERIAL      | Primary key                             |
| title       | VARCHAR     | Judul layanan (contoh: Jasa CV, PPT)    |
| description | TEXT        | Deskripsi lengkap layanan               |
| price       | INTEGER     | Harga dalam Rupiah                      |
| category    | VARCHAR     | Kategori layanan (CV, PPT, Cetak, dll)  |
| user_id     | INTEGER     | Foreign key ke tabel `users`            |
| created_at  | TIMESTAMP   | Tanggal layanan dibuat                  |

---

### 3. `orders` – Transaksi antara customer dan freelancer
| Kolom       | Tipe Data   | Keterangan                              |
|-------------|-------------|-----------------------------------------|
| id          | SERIAL      | Primary key                             |
| user_id     | INTEGER     | Customer (foreign key ke `users`)       |
| service_id  | INTEGER     | Layanan (foreign key ke `services`)     |
| status      | VARCHAR     | Status pesanan (pending, selesai, dll)  |
| created_at  | TIMESTAMP   | Tanggal order dibuat                    |

---

### 4. `payments` – Data pembayaran
| Kolom          | Tipe Data   | Keterangan                              |
|----------------|-------------|-----------------------------------------|
| id             | SERIAL      | Primary key                             |
| order_id       | INTEGER     | Foreign key ke tabel `orders`           |
| amount         | INTEGER     | Jumlah pembayaran dalam Rupiah          |
| payment_method | VARCHAR     | Metode pembayaran (QRIS, Transfer, dll) |
| status         | VARCHAR     | Status pembayaran (berhasil, pending)   |
| created_at     | TIMESTAMP   | Tanggal pembayaran                      |

---

## 💡 Contoh Data Dummy

Lihat file `dummy_data.sql` untuk data simulasi pengguna, layanan, dan transaksi.

---

## 🔧 Cara Menggunakan

1. **Clone repository** ini:
```bash
git clone https://github.com/namamu/freelance-kampus-db.git
cd freelance-kampus-db
