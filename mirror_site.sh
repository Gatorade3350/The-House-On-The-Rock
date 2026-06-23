#!/usr/bin/env bash
# mirror_site.sh — download a static mirror of the official site into `site-mirror/`
# Usage: bash mirror_site.sh
# NOTE: Ensure you have permission to mirror the site's content before running.

set -euo pipefail

TARGET_URL="https://www.thehouseontherock.com/"
OUTPUT_DIR="site-mirror"

echo "Mirroring ${TARGET_URL} into ./${OUTPUT_DIR}"

wget \
  --mirror \
  --convert-links \
  --adjust-extension \
  --page-requisites \
  --no-parent \
  --span-hosts \
  --domains=www.thehouseontherock.com \
  -e robots=off \
  -P "${OUTPUT_DIR}" \
  "${TARGET_URL}"

echo "Mirror complete. Check ./${OUTPUT_DIR}/www.thehouseontherock.com/ for files." 
