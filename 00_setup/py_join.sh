#!/usr/bin/env bash
set -euo pipefail

# Shared cache
export UV_CACHE_DIR=/fh/fast/_IRC/FHIL/grp/bioinfo_tools/package_caches/uv

if [ $# -gt 0 ]; then
  PROJECT_DIR=$1
else
  PROJECT_DIR=$(dirname "$(dirname "$(readlink -f "$0")")")
fi
PROJECT_NAME=$(basename "$PROJECT_DIR")

export UV_PROJECT_ENVIRONMENT="$PROJECT_DIR/.venv"

echo "🔧 Attaching to project: $PROJECT_NAME"

cd "$PROJECT_DIR"

if [ ! -d ".venv" ]; then
    echo "❌ No shared venv found. Did you run project_init.sh?"
    exit 1
fi

# Ensure the kernel is visible to the user
uv run python -m ipykernel install \
  --user \
  --name="proj-$PROJECT_NAME" \
  --display-name="Python (project: $PROJECT_NAME)"

echo "✅ Attached to existing venv for project $PROJECT_NAME."
