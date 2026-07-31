#!/usr/bin/env bash
set -euo pipefail

# Build both resume variants and archive timestamped copies into versions/
# so previous outputs are kept for side-by-side comparison.

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"

VERSIONS_DIR="versions"
mkdir -p "$VERSIONS_DIR"

STAMP="$(date +%Y%m%d-%H%M%S)"

echo "Compiling resume.pdf (plain)..."
typst compile resume.typ resume.pdf

echo "Compiling resume-photo.pdf (with photo)..."
typst compile --input photo=true resume.typ resume-photo.pdf

cp resume.pdf "$VERSIONS_DIR/resume_${STAMP}.pdf"
cp resume-photo.pdf "$VERSIONS_DIR/resume-photo_${STAMP}.pdf"

echo ""
echo "Latest outputs:  resume.pdf, resume-photo.pdf"
echo "Archived copies:"
echo "  $VERSIONS_DIR/resume_${STAMP}.pdf"
echo "  $VERSIONS_DIR/resume-photo_${STAMP}.pdf"
