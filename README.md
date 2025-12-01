<h1>Nama: Wildan Munawwar Habib<br>
NIM: H1D023045</h1>

---

Aplikasi ini memiliki fitur **Login, Registrasi, dan CRUD Produk (Create, Read, Update, Delete)** menggunakan Flutter.

# 1. Halaman Login

### Screenshot

<img width="434" height="991" alt="image" src="https://github.com/user-attachments/assets/9434d731-6250-4049-9433-8747712780c1" />

### Penjelasan

* Menggunakan `Form` + `TextFormField`.
* Validasi memastikan email & password tidak kosong.
* Tombol **Login** memanggil fungsi dari `LoginBloc`.
* Tautan **Register** menuju halaman registrasi.

### Potongan Kode (login_page.dart)

```dart
final formKey = GlobalKey<FormState>();

if (formKey.currentState!.validate()) {
  LoginBloc.login(
    email: _emailController.text,
    password: _passwordController.text,
  );
}
```

---

# 2. Halaman Registrasi

### Screenshot

<img width="433" height="996" alt="image" src="https://github.com/user-attachments/assets/babaa199-440c-42ac-8f33-1450b9ea7107" />

### Penjelasan

* Validasi format email menggunakan RegEx.
* Password minimal 6 karakter.
* Form memastikan password & konfirmasi password sama.

### Potongan Kode

```dart
if (_passwordController.text != _confirmPassController.text) {
  return "Password tidak sama";
}
```

---

# 3. Halaman Daftar Produk (Home)

### Screenshot

<img width="429" height="993" alt="image" src="https://github.com/user-attachments/assets/5f6bc4d3-a2f8-4ebb-8c42-9b2dbedfb454" />

### Penjelasan

* Menggunakan `ListView.builder()` menampilkan produk.
* Terdapat **Drawer** untuk logout.
* Tombol `+` menuju halaman Tambah Produk.
* Tekan item → menuju halaman **Detail Produk**.

### Potongan Kode

```dart
ListView.builder(
  itemCount: snapshot.data!.length,
  itemBuilder: (context, index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
          MaterialPageRoute(builder: (context) =>
            ProdukDetail(produk: snapshot.data![index])
          )
        );
      },
    );
  },
);
```

---

# 4. Halaman Detail Produk

### Screenshot

<img width="435" height="996" alt="image" src="https://github.com/user-attachments/assets/263baeae-9fbb-4fe8-95d2-fc5fad8dad2f" />

### Penjelasan

* Data produk diterima lewat constructor.
* Tombol **Edit** → membuka form dengan data lama.
* Tombol **Delete** → membuka popup konfirmasi.

---

# 5. Halaman Form Produk (Tambah & Edit)

### Screenshot Mode Tambah

<img width="433" height="992" alt="image" src="https://github.com/user-attachments/assets/3802eead-6393-40ba-94a4-9fd81da0ff83" />

### Screenshot Mode Edit

<img width="433" height="990" alt="image" src="https://github.com/user-attachments/assets/8fa5454e-9a87-4b23-9786-827134754bc2" />

### Penjelasan

* Halaman ini **reusable**, untuk Tambah & Edit sekaligus.
* Jika `produk != null` maka halaman otomatis masuk **mode edit**.

### Logika Cek Mode Edit/Tambah

```dart
bool isUpdate = widget.produk != null;

if (isUpdate) {
  kodeController.text = widget.produk!.kode!;
  namaController.text = widget.produk!.nama!;
  hargaController.text = widget.produk!.harga.toString();
}
```

---

# Popup Berhasil

### Screenshot

<img width="434" height="999" alt="image" src="https://github.com/user-attachments/assets/647765c3-cd78-4496-91df-d8a5afa54e4c" />

**Kode Handler Response:**

```dart
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => SuccessDialog(
      description: "Registrasi berhasil, silahkan login",
      okClick: () {
        Navigator.pop(context);
      },
    ),
  );
```

---

# Popup Gagal

### Screenshot

<img width="433" height="990" alt="image" src="https://github.com/user-attachments/assets/31f18546-bc21-40f6-bbcb-bcb225db9874" />

**Kode Handler Response:**

```dart
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => const WarningDialog(
      description: "Login gagal, silahkan coba lagi",
    ),
  );
```

---

# Popup Konfirmasi Hapus

### Screenshot

<img width="430" height="983" alt="image" src="https://github.com/user-attachments/assets/1001648e-abd3-48a8-a5da-98942ae03620" />

**Kode Handler Response:**

---

# Struktur Folder Project

```
lib/
├── bloc/
│   ├── login_bloc.dart
│   ├── logout_bloc.dart
│   ├── produk_bloc.dart
│   └── register_bloc.dart
├── model/
│   ├── login.dart
│   ├── produk.dart
│   └── registrasi.dart
├── service/
│   └── produk_service.dart
├── ui/
│   ├── login_page.dart
│   ├── produk_detail.dart
│   ├── produk_form.dart
│   ├── produk_page.dart
│   └── registrasi_page.dart
├── widget/
│   ├── success_dialog.dart
│   └── warning_dialog.dart
└── main.dart
```
