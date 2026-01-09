# COTS – Pemrograman Perangkat Bergerak

**Nama**  : Zhafir Zaidan Avail  
**NIM**   : 2311104059  
**Kelas** : SE-07-02  

Aplikasi ini dibuat untuk memenuhi tugas **Coding On The Spot (COTS)** mata kuliah  
**Pemrograman Perangkat Bergerak**.

---

## 📱 Deskripsi Aplikasi

Aplikasi **Resep Masakan** adalah aplikasi mobile berbasis **Flutter** yang digunakan untuk
mengelola data resep makanan.  
Aplikasi ini terhubung ke **Supabase REST API** dan mendukung operasi:

- Menampilkan daftar resep
- Melihat detail resep
- Menambah resep baru
- Mengedit resep (PATCH API)

Aplikasi ini menggunakan **Local State Management (`setState`)** dan
menerapkan **design system** untuk menjaga konsistensi tampilan.

---

## 🚀 Fitur Utama

| Fitur | Keterangan |
|------|----------|
| Dashboard | Halaman utama untuk navigasi |
| Daftar Resep | Menampilkan semua resep dari API |
| Detail Resep | Menampilkan informasi lengkap resep |
| Tambah Resep | Menyimpan resep baru ke Supabase |
| Edit Resep | Mengubah data resep menggunakan PATCH API |
| Validasi Form | Mencegah input kosong |
| Auto Refresh | Data otomatis diperbarui setelah edit/tambah |

---

## 🧩 Teknologi

- Flutter
- Dart
- Supabase REST API
- Local State Management (`setState`)
- Material Design

---

## 📂 Struktur Folder
lib/
├── design_system/
│ ├── colors.dart
│ ├── typography.dart
│ └── spacing.dart
│
├── models/
│ └── recipe_model.dart
│
├── services/
│ └── recipe_service.dart
│
├── presentation/
│ ├── pages/
│ │ ├── dashboard_page.dart
│ │ ├── recipe_list_page.dart
│ │ ├── recipe_detail_page.dart
│ │ ├── add_recipe_page.dart
│ │ └── edit_recipe_page.dart
│ │
│ └── widgets/
│ ├── recipe_card.dart
│ └── primary_button.dart
│
├── config/
│ └── api_config.dart
│
└── main.dart

---

## 🖼️ Screenshot Aplikasi
docs/
├── dashboard.png
├── daftar_resep.png
├── detail_resep.png
└── tambah_resep.png

