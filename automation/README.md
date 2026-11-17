# Otomasi — pengingat latihan harian & cek pengumuman rutin

Skill ini punya dua otomasi yang bisa dipasang sekali dan jalan sendiri selama masa seleksi. Keduanya opsional — skill tetap bisa dipakai manual tanpa otomasi apa pun.

## 1. Pengingat latihan harian (19:00)

Mengingatkanmu latihan setiap hari selama 30 hari persiapan. Setup sekali, lalu berhenti sendiri saat rencana belajar selesai.

**Linux / macOS (cron):**

1. Buat script bisa dijalankan:
   ```bash
   chmod +x automation/run-daily.sh
   ```
2. Pasang jadwalnya:
   ```bash
   crontab -e
   ```
   Tempel baris pertama dari `cron.example` (sesuaikan path folder skill). Jadwalnya: **setiap hari 19:00** waktu lokal.
3. Pastikan Claude Code sudah login dan bisa jalan headless (`claude -p "halo"` sebagai tes).

**Windows (Task Scheduler):**

Buat task baru → Trigger: setiap hari 19:00 → Action: jalankan `claude -p "latihan soal CPNS hari ini"` dengan "Start in" diisi folder skill ini.

**Yang terjadi tiap hari:** tiap run menjalankan sesi latihan sesuai `templates/rencana-belajar.md`: memberi soal latihan hari itu (TWK/TIU/TKP sesuai jadwal), membahas jawaban, dan mencatat progres di log harian.

**Berhenti otomatis:** ubah field **Status persiapan** di `templates/profile.md` menjadi `selesai belajar`. Script harian akan berhenti sendiri mulai run berikutnya. Tidak perlu hapus cron-nya.

## 2. Cek pengumuman CPNS rutin (07:00)

Setiap pagi skill mengecek halaman pengumuman resmi — portal SSCASN (https://sscasn.bkn.go.id/) dan website BKN (https://www.bkn.go.id/) — untuk info baru seleksi CPNS (jadwal, formasi, hasil SKD/SKB, pengumuman kelulusan). **Hanya dilaporkan kalau ada yang baru atau berubah.** Kalau tidak ada perubahan, tidak ada laporan — jadi kamu tidak dibanjiri notifikasi.

**Cara kerja:** `automation/cek-pengumuman.sh` mengunduh teks pengumuman dari kedua sumber resmi, membandingkannya dengan catatan terakhir yang tersimpan di `~/.cpns-apply/pengumuman-terakhir.txt` (file lokal di komputermu, bukan di repo skill), dan hanya menjalankan skill kalau isinya berubah. Script tidak pernah mengarang tanggal, jadwal, atau hasil — semua info yang dilaporkan harus berasal dari sumber resmi.

**Setup (Linux / macOS):**

1. Buat script bisa dijalankan:
   ```bash
   chmod +x automation/cek-pengumuman.sh
   ```
2. Pasang jadwalnya:
   ```bash
   crontab -e
   ```
   Tempel baris kedua dari `cron.example` (sesuaikan path folder skill). Jadwalnya: **setiap hari 07:00** waktu lokal.
3. Run pertama menyimpan catatan awal (baseline) dan memberi ringkasan pengumuman yang sedang berlaku. Run berikutnya hanya melapor kalau ada perubahan.

**Kalau sumber tidak bisa dijangkau** (offline atau server down), run itu dilewati diam-diam dan dicoba lagi besok — tidak ada laporan error.

**Berhenti:** hapus baris `cek-pengumuman.sh` dari crontab (`crontab -e`). Catatan lokal di `~/.cpns-apply/` bisa dihapus kapan saja; run berikutnya akan menyimpan baseline baru.

## Catatan

- Tetap bisa latihan manual kapan saja — ketik `latihan soal CPNS` ke Claude Code.
- Tetap bisa cek pengumuman manual kapan saja — ketik `cek pengumuman CPNS` ke Claude Code.
- Kalau satu hari latihan terlewat, jangan menumpuk dua hari latihan jadi satu sesi — lanjutkan dari hari berikutnya.
