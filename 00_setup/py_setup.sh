#!/usr/bin/env bash
set -euo pipefail

# Shared cache
export UV_CACHE_DIR=/fh/fast/_IRC/FHIL/grp/bioinfo_tools/package_caches

if [ $# -gt 0 ]; then
  PROJECT_DIR=$1
else
  PROJECT_DIR=$(dirname "$(dirname "$(readlink -f "$0")")")
fi
PROJECT_NAME=$(basename "$PROJECT_DIR")

echo "🔧 Initializing project: $PROJECT_NAME (cache=$UV_CACHE_DIR)"

cd "$PROJECT_DIR"

# Initialize uv project if not already
if [ ! -f "uv.lock" ]; then
    uv init --python=3.11 --bare
fi

# Register kernel with Jupyter
uv run python -m ipykernel install \
  --name="proj-$PROJECT_NAME" \
  --display-name="Python (project: $PROJECT_NAME)"
  
export 

echo "✅ Project $PROJECT_NAME initialized with Jupyter kernel."
