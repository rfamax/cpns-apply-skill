---
name: cpns-apply
description: Bantu lolos seleksi CPNS — daftar SSCASN langkah demi langkah, pilih formasi sesuai pendidikan, latihan soal SKD (TWK, TIU, TKP) dengan pembahasan, simulasi CAT 110 soal dalam 100 menit lengkap dengan penilaian passing grade, strategi menjawab soal supaya nilai maksimal, rencana belajar 30 hari, dan pantau pengumuman resmi CPNS. Gunakan saat pengguna minta "CPNS", "daftar CPNS", "latihan soal CPNS", "simulasi SKD", "belajar TWK", "belajar TIU", "belajar TKP", "strategi menjawab soal CPNS", atau "cek pengumuman CPNS".
---

# cpns-apply

Bantu siapa saja lolos seleksi CPNS — dari membuat akun SSCASN, memilih formasi, sampai latihan soal SKD dan simulasi CAT. Semua data pribadi diisi sendiri oleh pengguna di `templates/profile.md`; skill ini tidak menyimpan data siapa pun.

## Struktur SKD yang dipakai skill ini

Seleksi Kompetensi Dasar (SKD) — formasi umum, KepmenPANRB 321/2024:

| Subtes | Jumlah soal | Passing grade | Skor maks | Penilaian |
| ------ | ----------- | ------------- | --------- | --------- |
| TWK (Tes Wawasan Kebangsaan) | 30 | 65 | 150 | Benar +5, salah 0 |
| TIU (Tes Intelegensia Umum) | 35 | 80 | 175 | Benar +5, salah 0 |
| TKP (Tes Karakteristik Pribadi) | 45 | 166 | 225 | Tiap opsi berbobot 1–5, tidak ada jawaban salah |
| **Total** | **110** | **Lolos ketiganya** | **550** | — |

- Durasi: **100 menit** (130 menit untuk peserta disabilitas sensorik netra).
- **Wajib lolos ketiga subtes sekaligus** — satu subtes di bawah passing grade berarti gugur, walau total skor tinggi.
- Peserta yang lolos ke SKB maksimal **3x kuota formasi**.
- Catatan: passing grade TKP 166 ini untuk CPNS formasi umum. Jangan dicampur dengan Sekolah Kedinasan 2026 (TKP 156, KepmenPANRB 406/2026).

> **PERINGATAN — SELALU CEK SUMBER RESMI.** Passing grade, jadwal, dan rincian formasi bisa berubah di tiap seleksi. Angka di skill ini merujuk pada KepmenPANRB 321/2024 dan pengumuman BKN yang diketahui saat skill ditulis. Sebelum mendaftar atau berlatih untuk seleksi berjalan, cek pengumuman terbaru di https://sscasn.bkn.go.id/ dan Instagram @bkngoidofficial. **Jangan pernah mengarang jadwal, jumlah formasi, atau passing grade** — kalau belum ada pengumuman resmi, katakan belum diumumkan.

## Jadwal CPNS 2026 (yang diketahui saat skill ditulis)

- Pembuatan akun SSCASN sudah dibuka sejak Sabtu, 14 November 2026 di https://sscasn.bkn.go.id/.
- Pengumuman rincian formasi dan jadwal direncanakan sekitar 20–23 November 2026.
- Pendaftaran formasi direncanakan pekan keempat November 2026.
- Jumlah formasi sekitar 150.000–158.000.
- Seleksi berlangsung sampai semester I-2027.
- Seleksi GRATIS, tidak dipungut biaya.

Jadwal di atas dapat berubah — selalu cocokkan dengan pengumuman resmi BKN sebelum bertindak.

## Cara pakai

1. **Setup sekali:** isi `templates/profile.md` (data diri, pendidikan, target formasi). Isi `templates/berkas-checklist.md` sambil menyiapkan berkas.
2. **Latihan harian:** ketik `latihan soal CPNS` — skill memberi soal dari `bank-soal/` sesuai subtes yang diminta, lalu membahas jawabanmu.
3. **Simulasi CAT:** ketik `simulasi SKD` — skill menyusun 110 soal (30 TWK + 35 TIU + 45 TKP) dalam 100 menit, menghitung skor per subtes, membandingkan dengan passing grade, dan mencatat hasilnya di `templates/hasil-simulasi.md`.
4. **Rencana belajar:** ikuti `templates/rencana-belajar.md` (30 hari) — ketik `rencana belajar CPNS hari ke-N` untuk sesi hari itu.
5. **Otomasi (opsional):** ikuti `automation/README.md` untuk pengingat latihan harian (19:00) dan cek pengumuman CPNS rutin (07:00).
6. **Strategi menjawab:** sebelum latihan atau simulasi, baca `strategi-menjawab.md` — panduan manajemen waktu, teknik eliminasi, dan strategi per subtes supaya nilai maksimal.

## Alur kerja

### 1. Daftar SSCASN langkah demi langkah

Portal resmi: https://sscasn.bkn.go.id/ — seleksi CPNS **GRATIS, tidak dipungut biaya**. Waspada penipuan yang meminta bayaran dengan dalih meloloskan seleksi.

1. Buat akun SSCASN (NIK, nomor KK, data diri, email aktif, password). Akun yang sudah dibuat tetap bisa dipakai untuk seleksi berikutnya — jangan buat akun ganda.
2. Login, lengkapi biodata, unggah pas foto dan dokumen sesuai ketentuan formasi.
3. Pilih formasi (lihat bagian 2 di bawah).
4. Unggah berkas sesuai `templates/berkas-checklist.md`, periksa ulang, lalu cetak kartu pendaftaran.
5. Pantau pengumuman hasil seleksi administrasi di portal yang sama.

**Keamanan data:** NIK, nomor KK, dan password SSCASN hanya diisi langsung di portal resmi. JANGAN tulis NIK atau password di file mana pun di skill ini.

### 2. Cara memilih formasi

1. Baca syarat formasi di pengumuman resmi: kualifikasi pendidikan (jurusan + jenjang), IPK minimal, usia, dan syarat khusus (mis. sertifikat, pengalaman, domisili).
2. Cocokkan dengan `templates/profile.md` — tolak formasi yang syarat pendidikannya tidak sesuai (jurusan tidak tercantum = tidak bisa daftar).
3. Hitung peluang kasar: bandingkan kuota formasi dengan perkiraan jumlah pelamar (lihat pengumuman BKN / data tahun sebelumnya). Formasi dengan pelamar sedikit per kuota lebih aman, tapi jangan memilih formasi yang tidak sesuai minat hanya karena sepi.
4. Prioritaskan formasi yang: (a) pendidikannya cocok persis, (b) syarat khususnya sudah dipenuhi, (c) instansi/lokasinya bisa dijalani.
5. Catat 1 formasi utama + 1 cadangan di profil. CPNS hanya boleh memilih 1 formasi.

### 3. Latihan soal per subtes

Bank soal ada di `bank-soal/` — semuanya soal original yang ditulis untuk skill ini, disusun mengikuti kisi-kisi resmi:

- **TWK** (`bank-soal/twk.md`): nasionalisme, integritas, bela negara, pilar negara (Pancasila, UUD 1945, NKRI, Bhinneka Tunggal Ika), Bahasa Indonesia.
- **TIU** (`bank-soal/tiu.md`): verbal (analogi, silogisme, sinonim, antonim), numerik (deret angka, hitungan cepat, soal cerita), figural (analogi gambar, ketidaksamaan, rotasi).
- **TKP** (`bank-soal/tkp.md`): pelayanan publik, jejaring kerja, sosial budaya, TIK, profesionalisme, anti-radikalisme. Tiap opsi berbobot 1–5 — tidak ada jawaban nol.

Cara latihan: baca dulu `strategi-menjawab.md` (terutama strategi subtes yang akan dilatih), lalu beri 10 soal per sesi (campur atau per subtes), tunggu jawaban pengguna, lalu bahas satu per satu — jawaban benar, pembahasan, dan pola soalnya. Jangan memberi kunci sebelum pengguna menjawab. Catat subtes yang paling lemah untuk sesi berikutnya.

### 4. Simulasi CAT 110 soal / 100 menit

1. Susun 110 soal: 30 TWK + 35 TIU + 45 TKP (acak dari bank soal; kalau bank soal kurang dari 110, gabungkan dengan soal latihan baru yang ditulis mengikuti kisi-kisi yang sama — jangan mengulang soal yang sama persis dalam satu simulasi).
2. Jalankan dalam batas 100 menit. Pakai strategi dari `strategi-menjawab.md`: **kerjakan TKP dulu 30–40 menit** (setiap opsi tetap dapat skor, tidak ada jawaban nol), lalu TWK, lalu TIU.
3. Hitung skor per subtes dan bandingkan dengan passing grade (TWK 65, TIU 80, TKP 166). Nyatakan LULUS/GAGAL per subtes dan keseluruhan.
4. Analisis kelemahan: subtes di bawah passing grade + jenis soal yang paling banyak salah di subtes itu.
5. Catat di `templates/hasil-simulasi.md`: tanggal, skor TWK/TIU/TKP, total, status, dan 3 hal yang harus diperbaiki sebelum simulasi berikutnya.

### 5. Rencana belajar 30 hari

Ikuti `templates/rencana-belajar.md`:

- **Hari 1–10 (fondasi):** TWK — hafal pilar negara, UUD 1945 pasal-pasal kunci, nilai Pancasila per sila. TIU — rumus deret, hitungan cepat, latihan analogi verbal. TKP — pahami 6 aspek dan pola jawaban ideal.
- **Hari 11–20 (latihan terarah):** 20 soal/hari per subtes, fokus ke jenis soal yang paling lemah dari hasil latihan sebelumnya.
- **Hari 21–25 (simulasi):** simulasi CAT penuh 110 soal/100 menit, minimal 2x, analisis hasil tiap simulasi.
- **Hari 26–30 (pemantapan):** ulangi soal yang pernah salah, hafal ringkasan TWK, latihan kecepatan (target: TKP 40 menit, TWK 20 menit, TIU 35 menit, sisa 5 menit untuk cek ulang).

Sesuaikan dengan waktu yang tersedia — kalau hanya punya 1 jam/hari, potong jumlah soal, bukan harinya.

### 6. Cara memantau pengumuman resmi

Ada dua cara — pilih salah satu atau pakai keduanya:

**(a) Cek manual saat diminta.** Ketik `cek pengumuman CPNS` — skill mengecek sumber resmi di bawah dan melaporkan info terbaru seleksi CPNS (jadwal, formasi, hasil SKD/SKB, pengumuman kelulusan). Cocok untuk yang tidak mau pasang otomasi.

**(b) Cek rutin otomatis harian.** Pasang `automation/cek-pengumuman.sh` lewat cron (lihat `automation/README.md`, jadwal tiap pagi 07:00). Script membandingkan isi halaman pengumuman resmi dengan catatan terakhir yang tersimpan, dan **hanya melaporkan kalau ada yang baru atau berubah** — kalau tidak ada perubahan, tidak ada laporan.

Sumber resmi yang dicek (keduanya):
- Portal: https://sscasn.bkn.go.id/ (pengumuman formasi, jadwal, hasil seleksi).
- Website BKN: https://www.bkn.go.id/.
- Instagram: @bkngoidofficial (tambahan — dicek saat cek manual).

Jangan percaya info jadwal/formasi dari akun tidak resmi — cocokkan selalu dengan portal BKN. Jangan pernah mengarang tanggal, jadwal, atau hasil — kalau belum ada pengumuman resmi, katakan belum diumumkan.

## Hal yang tidak pernah dilakukan

- Jangan pernah mengarang jadwal seleksi, jumlah formasi, atau passing grade.
- Jangan pernah meminta atau menyimpan NIK, nomor KK, atau password pengguna.
- Jangan pernah mengklaim bisa meloloskan seleksi dengan bayaran — seleksi CPNS gratis dan berbasis CAT.
- Jangan pernah menyalin soal dari situs bimbel atau sumber berhak cipta lain — bank soal skill ini ditulis original.
- Jangan pernah menjamin kelulusan — skill ini alat latihan, hasil tergantung usaha pengguna.
