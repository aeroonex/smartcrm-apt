#!/usr/bin/env bash
# SmartCRM apt manbasini ulaydi va `smartcrm` paketini o'rnatadi (Ubuntu/Debian).
#   curl -fsSL https://aeroonex.github.io/smartcrm-apt/setup.sh | sudo bash
set -euo pipefail
[ "$(id -u)" -eq 0 ] || { echo "Root huquqi kerak: ... | sudo bash" >&2; exit 1; }
command -v apt-get >/dev/null 2>&1 || { echo "Bu skript faqat Ubuntu/Debian uchun (apt kerak)." >&2; exit 1; }

BASE="https://aeroonex.github.io/smartcrm-apt"
echo "==> SmartCRM apt manbasi ulanmoqda"
echo "    Kalit:   /usr/share/keyrings/smartcrm.gpg"
echo "    Manba:   /etc/apt/sources.list.d/smartcrm.list  ($BASE)"
apt-get update -qq && apt-get install -y -qq curl ca-certificates >/dev/null
curl -fsSL "$BASE/smartcrm.gpg" -o /usr/share/keyrings/smartcrm.gpg
echo "deb [signed-by=/usr/share/keyrings/smartcrm.gpg] $BASE stable main" > /etc/apt/sources.list.d/smartcrm.list
apt-get update -qq
apt-get install -y smartcrm
echo
echo "✓ Tayyor. Endi tizimni o'rnating:   sudo smartcrm install"
