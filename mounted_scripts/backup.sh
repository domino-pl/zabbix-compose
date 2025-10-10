#!/bin/sh
set -e

DAY=$(date +%A)
TARGET="/backups/$DAY"
LOGFILE="$TARGET/backup.log"

echo "[INFO] Starting backup for day: $DAY"
rm -rf "$TARGET"
mkdir -p "$TARGET"

echo "[INFO] Backup start: $(date)" 2>&1 | tee "$LOGFILE"
mariadb-backup --backup \
  --user="root" \
  --password="${MARIADB_ROOT_PASSWORD:?}" \
  --target-dir="$TARGET" 2>&1 | tee "$LOGFILE"
echo "[INFO] Backup finished: $(date)" 2>&1 | tee "$LOGFILE"

echo "Backup complete."
