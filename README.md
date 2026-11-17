# cpns-apply-skill

Bantu kamu lolos seleksi CPNS — dari daftar SSCASN sampai simulasi CAT.

Skill ini berisi: panduan daftar SSCASN langkah demi langkah, cara memilih formasi, bank soal SKD original (TWK, TIU, TKP) lengkap dengan pembahasan, simulasi CAT 110 soal dalam 100 menit, strategi menjawab soal supaya nilai maksimal, rencana belajar 30 hari, dan cek pengumuman resmi CPNS secara rutin (otomatis tiap pagi — hanya melapor kalau ada yang baru).

## Install

```bash
npx skills add rfamax/cpns-apply-skill
```

## Cara pakai

1. **Setup sekali:** isi `templates/profile.md` dengan data diri, pendidikan, dan target formasi kamu. Isi juga `templates/berkas-checklist.md` sambil menyiapkan berkas.
2. **Latihan:** ketik ke Claude Code `latihan soal CPNS` (atau sebut subtesnya: `latihan TWK`, `latihan TIU`, `latihan TKP`).
3. **Simulasi:** ketik `simulasi SKD` — 110 soal dalam 100 menit, lengkap dengan penilaian passing grade.
4. **Rencana belajar:** ikuti `templates/rencana-belajar.md` (30 hari), atau ketik `rencana belajar CPNS hari ke-5`.

## Struktur SKD (formasi umum, KepmenPANRB 321/2024)

| Subtes | Soal | Passing grade | Skor maks |
| ------ | ---- | ------------- | --------- |
| TWK — Tes Wawasan Kebangsaan | 30 | 65 | 150 |
| TIU — Tes Intelegensia Umum | 35 | 80 | 175 |
| TKP — Tes Karakteristik Pribadi | 45 | 166 | 225 |
| **Total** | **110** | **Lolos ketiganya** | **550** |

Durasi: **100 menit** (130 menit untuk disabilitas sensorik netra). Wajib lolos ketiga subtes sekaligus — satu subtes di bawah passing grade berarti gugur. Peserta yang lolos ke SKB maksimal 3x kuota formasi.

## Jadwal CPNS 2026 (yang diketahui)

Pembuatan akun SSCASN sudah dibuka sejak 14 November 2026. Pengumuman rincian formasi dan jadwal direncanakan sekitar 20–23 November 2026, pendaftaran formasi pekan keempat November 2026, sekitar 150.000–158.000 formasi, seleksi sampai semester I-2027. Jadwal dapat berubah — cek pengumuman resmi BKN.

## Isi repo

```
cpns-apply-skill/
├── SKILL.md                    # Instruksi skill (dibaca Claude Code)
├── strategi-menjawab.md        # Tips, trik & strategi menjawab SKD
├── bank-soal/
│   ├── twk.md                  # Bank soal TWK + kunci + pembahasan
│   ├── tiu.md                  # Bank soal TIU + kunci + pembahasan
│   └── tkp.md                  # Bank soal TKP + bobot opsi + pembahasan
├── templates/
│   ├── profile.md              # Data diri & target formasi — isi sekali
│   ├── berkas-checklist.md     # Checklist berkas pendaftaran
│   ├── rencana-belajar.md      # Rencana belajar 30 hari
│   └── hasil-simulasi.md       # Log hasil simulasi CAT
├── automation/
│   ├── run-daily.sh            # Pengingat latihan harian
│   ├── cek-pengumuman.sh       # Cek pengumuman CPNS rutin
│   ├── cron.example            # Contoh baris crontab
│   └── README.md               # Cara pasang otomasi
├── README.md
└── LICENSE
```

## Link resmi

- Portal SSCASN: https://sscasn.bkn.go.id/
- Website BKN: https://www.bkn.go.id/
- Instagram BKN: @bkngoidofficial

Seleksi CPNS **gratis, tidak dipungut biaya**. Jangan percaya pihak yang meminta bayaran dengan dalih meloloskan seleksi.

> Peringatan: passing grade, jadwal, dan rincian formasi bisa berubah di tiap seleksi. Selalu cek pengumuman terbaru di portal BKN sebelum mendaftar.

## Lisensi

MIT. Skill ini bukan afiliasi dari BKN atau instansi pemerintah mana pun. Bank soal di skill ini ditulis original untuk latihan — bukan soal resmi BKN.
