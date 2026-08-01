#!/usr/bin/env bash
set -euo pipefail

# Build all resume variants (profiles × templates × photo) and archive
# timestamped copies into versions/ for side-by-side comparison.

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"

VERSIONS_DIR="versions"
mkdir -p "$VERSIONS_DIR"

STAMP="$(date +%Y%m%d-%H%M%S)"
PROFILES=(tech-lead java engineering-manager)
TEMPLATES=(modern original)

compile_profile_template() {
  local profile="$1"
  local template="$2"
  local photo_flag="${3:-}"

  local base="resume-${profile}-${template}"
  local output="${base}.pdf"
  local input_args=(--input "profile=${profile}")

  if [[ -n "$photo_flag" ]]; then
    output="${base}-photo.pdf"
    input_args+=(--input photo=true)
  fi

  echo "Compiling ${output}..."
  typst compile --root . "${input_args[@]}" "templates/${template}.typ" "${output}"
}

for profile in "${PROFILES[@]}"; do
  for template in "${TEMPLATES[@]}"; do
    compile_profile_template "$profile" "$template"
    compile_profile_template "$profile" "$template" photo
  done
done

# Backward-compatible aliases (default profile = tech-lead, default template = modern)
echo "Compiling backward-compatible aliases..."
cp resume-tech-lead-modern.pdf resume-modern.pdf
cp resume-tech-lead-modern-photo.pdf resume-modern-photo.pdf
cp resume-tech-lead-original.pdf resume-original.pdf
cp resume-tech-lead-original-photo.pdf resume-original-photo.pdf
cp resume-tech-lead-modern.pdf resume.pdf
cp resume-tech-lead-modern-photo.pdf resume-photo.pdf

# Archive all outputs
for profile in "${PROFILES[@]}"; do
  for template in "${TEMPLATES[@]}"; do
    local_base="resume-${profile}-${template}"
    cp "${local_base}.pdf" "${VERSIONS_DIR}/${local_base}_${STAMP}.pdf"
    cp "${local_base}-photo.pdf" "${VERSIONS_DIR}/${local_base}-photo_${STAMP}.pdf"
  done
done

cp resume.pdf "${VERSIONS_DIR}/resume_${STAMP}.pdf"
cp resume-photo.pdf "${VERSIONS_DIR}/resume-photo_${STAMP}.pdf"
cp resume-modern.pdf "${VERSIONS_DIR}/resume-modern_${STAMP}.pdf"
cp resume-modern-photo.pdf "${VERSIONS_DIR}/resume-modern-photo_${STAMP}.pdf"
cp resume-original.pdf "${VERSIONS_DIR}/resume-original_${STAMP}.pdf"
cp resume-original-photo.pdf "${VERSIONS_DIR}/resume-original-photo_${STAMP}.pdf"

echo ""
echo "Latest outputs (per profile × template):"
for profile in "${PROFILES[@]}"; do
  for template in "${TEMPLATES[@]}"; do
    echo "  resume-${profile}-${template}.pdf, resume-${profile}-${template}-photo.pdf"
  done
done
echo ""
echo "Backward-compatible aliases:"
echo "  resume.pdf, resume-photo.pdf (tech-lead + modern)"
echo "  resume-modern.pdf, resume-modern-photo.pdf (tech-lead + modern)"
echo "  resume-original.pdf, resume-original-photo.pdf (tech-lead + original)"
echo "Archived copies in $VERSIONS_DIR/ with stamp $STAMP"
