#!/usr/bin/env bash
set -euo pipefail

# Build all resume variants and archive timestamped copies into versions/
# so previous outputs are kept for side-by-side comparison.

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"

VERSIONS_DIR="versions"
mkdir -p "$VERSIONS_DIR"

STAMP="$(date +%Y%m%d-%H%M%S)"

echo "Compiling resume-modern.pdf (plain)..."
typst compile --root . templates/modern.typ resume-modern.pdf

echo "Compiling resume-modern-photo.pdf (with photo)..."
typst compile --root . --input photo=true templates/modern.typ resume-modern-photo.pdf

echo "Compiling resume-original.pdf (plain)..."
typst compile --root . templates/original.typ resume-original.pdf

echo "Compiling resume-original-photo.pdf (with photo)..."
typst compile --root . --input photo=true templates/original.typ resume-original-photo.pdf

echo "Compiling resume.pdf (default = modern)..."
typst compile --root . resume.typ resume.pdf

echo "Compiling resume-photo.pdf (default = modern, with photo)..."
typst compile --root . --input photo=true resume.typ resume-photo.pdf

cp resume-modern.pdf "$VERSIONS_DIR/resume-modern_${STAMP}.pdf"
cp resume-modern-photo.pdf "$VERSIONS_DIR/resume-modern-photo_${STAMP}.pdf"
cp resume-original.pdf "$VERSIONS_DIR/resume-original_${STAMP}.pdf"
cp resume-original-photo.pdf "$VERSIONS_DIR/resume-original-photo_${STAMP}.pdf"
cp resume.pdf "$VERSIONS_DIR/resume_${STAMP}.pdf"
cp resume-photo.pdf "$VERSIONS_DIR/resume-photo_${STAMP}.pdf"

echo ""
echo "Latest outputs:"
echo "  resume-modern.pdf, resume-modern-photo.pdf"
echo "  resume-original.pdf, resume-original-photo.pdf"
echo "  resume.pdf, resume-photo.pdf (default = modern)"
echo "Archived copies in $VERSIONS_DIR/ with stamp $STAMP"
