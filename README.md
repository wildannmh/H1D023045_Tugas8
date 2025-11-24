<h1>Nama: Wildan Munawwar Habib<br>
NIM: H1D023045</h1>

## Fitur Utama & Penjelasan Kode

### 1. Halaman Login (`LoginPage`)

<img width="437" height="1009" alt="image" src="https://github.com/user-attachments/assets/6659e6c1-a4de-49c2-9c12-1f4229060502" />

**Penjelasan Kode (`login_page.dart`):**
- **State Management:** Menggunakan `StatefulWidget` karena ada perubahan state pada form input.
- **Validasi:** Menggunakan `GlobalKey<FormState>` untuk memvalidasi bahwa kolom email dan password tidak boleh kosong sebelum tombol ditekan.
- **Obscure Text:** Pada kolom password, properti `obscureText: true` diaktifkan agar karakter sandi tidak terlihat.
- **Navigasi:** - Tombol **Login** memproses input user.
  - Teks **Registrasi** menggunakan widget `InkWell` untuk navigasi ke halaman `RegistrasiPage`.

---

### 2. Halaman Registrasi (`RegistrasiPage`)

<img width="438" height="1007" alt="image" src="https://github.com/user-attachments/assets/a4b9928a-37ba-4e9c-986b-317537d191f6" />

**Penjelasan Kode (`registrasi_page.dart`):**
- **Controller:** Menggunakan `TextEditingController` untuk menangkap input nama, email, dan password.
- **Validasi Lanjutan:**
  - **Email:** Menggunakan **RegEx (Regular Expression)** untuk memastikan format email valid (mengandung `@` dan domain).
  - **Password:** Minimal input harus 6 karakter.
  - **Konfirmasi Password:** Memastikan input password kedua sama persis dengan password pertama.
- **Form:** Semua input dibungkus dalam widget `Form` untuk memudahkan pengecekan validitas data secara bersamaan.

---

### 3. Halaman Daftar Produk (`ProdukPage`)
Halaman yang menampilkan seluruh daftar produk yang tersedia.

<img width="438" height="1014" alt="image" src="https://github.com/user-attachments/assets/9f8d6f32-d8a9-441a-9849-82ba8588e2dc" />

**Penjelasan Kode (`produk_page.dart`):**
- **ListView:** Menggunakan widget `ListView` untuk menampilkan daftar produk yang bisa di-scroll.
- **Model Integration:** Data yang ditampilkan diambil dari model `Produk` (contoh: Kamera, Kulkas, Mesin Cuci).
- **Navigation Drawer:** Terdapat sidebar (Drawer) di sebelah kiri yang berisi opsi **Logout**.
- **GestureDetector:** Setiap item produk dibungkus `GestureDetector` agar bisa diklik dan mengarahkan pengguna ke halaman `ProdukDetail`.
- **Floating Action/AppBar Action:** Terdapat ikon `+` di pojok kanan atas untuk menavigasi ke halaman `ProdukForm` (Tambah Data).

---

### 4. Halaman Detail Produk (`ProdukDetail`)
Menampilkan informasi rinci mengenai satu produk tertentu.

<img width="435" height="1007" alt="image" src="https://github.com/user-attachments/assets/372ea7c5-a396-4bed-a9f0-7a10eeb787db" />

**Penjelasan Kode (`produk_detail.dart`):**
- **Passing Data:** Halaman ini menerima objek `Produk` dari halaman sebelumnya melalui constructor, lalu menampilkannya (Kode, Nama, Harga).
- **Edit & Delete:**
  - Tombol **EDIT** akan mengarahkan ke `ProdukForm` dengan membawa data produk saat ini.
  - Tombol **DELETE** memicu fungsi `confirmHapus()`.
- **Alert Dialog:** Fungsi `confirmHapus()` memunculkan popup konfirmasi. Jika user memilih "Ya", aplikasi memanggil `ProdukBloc.deleteProduk(id)` untuk menghapus data di server.

---

### 5. Halaman Form Produk (`ProdukForm`)
Halaman ini bersifat dinamis (Reusable), digunakan baik untuk **Menambah Produk Baru** maupun **Mengedit Produk Lama**.

<img width="438" height="1005" alt="image" src="https://github.com/user-attachments/assets/e6b41a2a-afaf-417e-8c7c-e573b0fad2a8" />
<img width="436" height="1012" alt="image" src="https://github.com/user-attachments/assets/7d603f95-4925-42d5-aaeb-1e12110006c4" />

**Penjelasan Kode (`produk_form.dart`):**
- **Logika `isUpdate()`:** - Fungsi ini dijalankan saat `initState`.
  - Jika `widget.produk` tidak null (ada data dikirim), mode berubah menjadi **UBAH** (Judul: "UBAH PRODUK", tombol: "UBAH", kolom terisi data lama).
  - Jika null, mode menjadi **TAMBAH** (Judul: "TAMBAH PRODUK", tombol: "SIMPAN", kolom kosong).
- **Input Type:** Kolom harga menggunakan `keyboardType: TextInputType.number` agar keyboard yang muncul khusus angka.

---

## Struktur Folder Project

```text
lib/
├── bloc/
│   └── produk_bloc.dart      # Logika bisnis penghubung UI dan Service
├── model/
│   ├── login.dart            # Model data untuk respon Login
│   ├── produk.dart           # Model data untuk objek Produk
│   └── registrasi.dart       # Model data untuk respon Registrasi
├── service/
│   └── produk_service.dart   # Menangani HTTP Request (API)
├── ui/
│   ├── login_page.dart       # Tampilan Login
│   ├── produk_detail.dart    # Tampilan Detail Produk
│   ├── produk_form.dart      # Tampilan Form (Tambah/Edit)
│   ├── produk_page.dart      # Tampilan List Produk
│   └── registrasi_page.dart  # Tampilan Registrasi
├── widget/
│   └── warning_dialog.dart   # Widget custom untuk alert
└── main.dart                 # Entry point aplikasi
