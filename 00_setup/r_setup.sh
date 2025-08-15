#!/usr/bin/env bash
set -euo pipefail

# Shared cache for R packages
export RENV_PATHS_CACHE="/fh/fast/_IRC/FHIL/grp/bioinfo_tools/package_caches/renv"

if [ $# -gt 0 ]; then
  PROJECT_DIR=$1
else
  PROJECT_DIR=$(dirname "$PWD")
fi
PROJECT_NAME=$(basename "$PROJECT_DIR")

echo "🔧 Initializing R project: $PROJECT_NAME"
echo "   Project dir: $PROJECT_DIR"
echo "   Shared cache: $RENV_PATHS_CACHE"

cd "$PROJECT_DIR"

# Ensure shared cache exists
mkdir -p "$RENV_PATHS_CACHE"

# Initialize renv project if not already initialized
if [ ! -f "renv.lock" ]; then
    echo "📦 Initializing renv for project..."
    R --no-echo -e "renv::init()"
fi

# Ensure renv is up to date
echo "🔄 Updating renv..."
R --no-echo -e "renv::upgrade()"

# Create a basic .Rprofile if it doesn't exist
if [ ! -f ".Rprofile" ]; then
    echo "📝 Creating .Rprofile..."
    cat > .Rprofile << 'EOF'
# Project-specific .Rprofile for renv
source("renv/activate.R")
EOF
fi

echo "✅ R project $PROJECT_NAME initialized with renv."
echo ""
echo "📋 Next steps:"
echo "   - Open R/RStudio in this directory"
echo "   - Install additional packages with: install.packages('package_name')"
echo "   - Take snapshots with: renv::snapshot()"
echo "   - Restore packages with: renv::restore()"
echo "   - Check status with: renv::status()"
echo ""
echo "💾 Package cache location: $RENV_PATHS_CACHE"
