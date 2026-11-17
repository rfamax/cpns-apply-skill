#!/bin/bash
# cpns-apply — pengingat latihan harian (19:00)
# Setup sekali: tambahkan ke crontab (lihat cron.example).
# Script ini menjalankan skill lewat Claude Code mode headless.
set -e
cd "$(dirname "$0")/.."

# Berhenti sendiri kalau field Status persiapan di profile.md sudah "selesai belajar"
# (grep dibatasi ke baris Status persiapan supaya teks petunjuk tidak ikut terhitung)
if grep -qiE '^ *- *Status persiapan: *selesai belajar' templates/profile.md 2>/dev/null; then
  echo "Status: selesai belajar — otomasi berhenti."
  exit 0
fi

# Satu perintah yang sama seperti kalau diketik manual.
claude -p "latihan soal CPNS hari ini"
