#!/bin/bash
# cpns-apply — cek pengumuman CPNS rutin (harian, 07:00)
# Setup sekali: tambahkan ke crontab (lihat cron.example).
# Script ini membandingkan isi halaman pengumuman resmi dengan catatan
# terakhir yang tersimpan. HANYA kalau ada perubahan, skill dijalankan
# lewat Claude Code mode headless untuk melaporkan info yang baru.
# Script ini TIDAK pernah mengarang tanggal, jadwal, atau hasil —
# semua info yang dilaporkan harus berasal dari sumber resmi.
set -u
cd "$(dirname "$0")/.."

STATE_DIR="$HOME/.cpns-apply"
STATE_HASH="$STATE_DIR/pengumuman-terakhir.sha256"
STATE_TEXT="$STATE_DIR/pengumuman-terakhir.txt"
mkdir -p "$STATE_DIR"

SSCASAN_URL="https://sscasn.bkn.go.id/"
BKN_URL="https://www.bkn.go.id/"
UA="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0 Safari/537.36"

# Ambil teks pengumuman dari satu URL: unduh HTML, buang blok script/style
# dan semua tag (multiline, lewat perl), rapikan spasi.
ambil_teks() {
  curl -sL --max-time 30 -A "$UA" "$1" 2>/dev/null \
    | perl -0777 -pe 's/<(script|style)\b.*?<\/\1>/ /gis; s/<[^>]+>/\n/g; s/\t/ /g; s/&nbsp;/ /g; s/&amp;/\&/g; s/&lt;/</g; s/&gt;/>/g' \
    | sed -e 's/  */ /g' -e 's/^ *//; s/ *$//' | grep -v '^$' \
    || true
}

TAMPUNGAN="$(mktemp)"
trap 'rm -f "$TAMPUNGAN"' EXIT

echo "== SSCASN: $SSCASAN_URL ==" >> "$TAMPUNGAN"
ambil_teks "$SSCASAN_URL" >> "$TAMPUNGAN"
echo "" >> "$TAMPUNGAN"
echo "== BKN: $BKN_URL ==" >> "$TAMPUNGAN"
ambil_teks "$BKN_URL" >> "$TAMPUNGAN"

# Kalau kedua sumber gagal dijangkau (offline / server down): diam, coba lagi besok.
if [ ! -s "$TAMPUNGAN" ]; then
  echo "Cek pengumuman: sumber resmi tidak bisa dijangkau — dilewati, coba lagi besok."
  exit 0
fi

HASH_BARU="$(sha256sum "$TAMPUNGAN" | cut -d' ' -f1)"

# Run pertama: belum ada catatan — simpan baseline dan beri ringkasan sekali.
if [ ! -f "$STATE_HASH" ]; then
  cp "$TAMPUNGAN" "$STATE_TEXT"
  echo "$HASH_BARU" > "$STATE_HASH"
  echo "Cek pengumuman: baseline pertama disimpan — memberi ringkasan pengumuman saat ini."
  claude -p "Cek pengumuman CPNS terbaru dari sumber resmi (portal SSCASN https://sscasn.bkn.go.id/ dan website BKN https://www.bkn.go.id/). Ini cek pertama: ringkas pengumuman seleksi CPNS yang sedang berlaku saat ini (jadwal, formasi, hasil SKD/SKB, kelulusan). Hanya sampaikan info yang benar-benar ada di sumber resmi — jangan mengarang tanggal, jumlah formasi, atau hasil."
  exit 0
fi

HASH_LAMA="$(cat "$STATE_HASH")"
if [ "$HASH_BARU" = "$HASH_LAMA" ]; then
  echo "Cek pengumuman: tidak ada perubahan sejak cek terakhir — tidak ada laporan."
  exit 0
fi

# Ada perubahan: simpan catatan baru, lalu laporkan hanya yang baru/berubah.
cp "$TAMPUNGAN" "$STATE_TEXT"
echo "$HASH_BARU" > "$STATE_HASH"
echo "Cek pengumuman: ada perubahan di sumber resmi — melaporkan info baru."
claude -p "Ada perubahan di halaman pengumuman resmi CPNS (portal SSCASN https://sscasn.bkn.go.id/ dan website BKN https://www.bkn.go.id/) sejak cek terakhir. Cek kedua sumber itu dan laporkan HANYA info yang baru atau berubah (jadwal, formasi, hasil SKD/SKB, pengumuman kelulusan). Kalau perubahannya hanya hal teknis (mis. penghitung pengunjung, tampilan) dan tidak ada pengumuman baru yang penting, katakan tidak ada pengumuman baru. Jangan mengarang tanggal, jumlah formasi, atau hasil — hanya sampaikan yang terverifikasi dari sumber resmi."
