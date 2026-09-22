#!/usr/bin/env bash
set -euo pipefail

# Gemini SEO - setup script
# Creates the isolated Python runtime (venv + dependencies) and installs
# Playwright Chromium for rendered-page features. Safe to re-run any time.

launcher_dir="$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

echo "════════════════════════════════════════"
echo "║   Gemini SEO - Setup                  ║"
echo "════════════════════════════════════════"

if [[ "${1:-}" == "--skip-browser" ]]; then
    exec "${launcher_dir}/scripts/gemini-seo" setup --skip-browser
fi
exec "${launcher_dir}/scripts/gemini-seo" setup