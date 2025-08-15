#!/usr/bin/env bash
set -euo pipefail

# Shared cache
export RENV_PATHS_CACHE=/fh/fast/_IRC/FHIL/grp/bioinfo_tools/package_caches/renv

if [ $# -gt 0 ]; then
  PROJECT_DIR=$1
else
  PROJECT_DIR=$(dirname "$PWD")
fi
PROJECT_NAME=$(basename "$PROJECT_DIR")

echo "🔧 Attaching to R project: $PROJECT_NAME"

cd "$PROJECT_DIR"

if [ ! -f "renv.lock" ]; then
    echo "❌ No renv project found. Did you run r_setup.sh?"
    exit 1
fi

# Check if renv is properly initialized
if [ ! -d "renv" ]; then
    echo "❌ renv directory not found. Did you run r_setup.sh?"
    exit 1
fi

# Ensure .Rprofile exists and sources renv
if [ ! -f ".Rprofile" ]; then
    echo "📝 Creating .Rprofile..."
    cat > .Rprofile << 'EOF'
# Project-specific .Rprofile for renv
source("renv/activate.R")
EOF
fi

# Activate renv and check status
echo "🔄 Activating renv environment..."
R --no-echo -e "
source('renv/activate.R')
cat('Restoring packages from lockfile...\n')
renv::restore()
cat('\nrenv status:\n')
renv::status()
"

echo "✅ Attached to existing renv project $PROJECT_NAME."
echo ""
echo "📋 Available commands:"
echo "   - renv::status() - Check package status"
echo "   - renv::snapshot() - Record current state"
echo "   - renv::install('package_name') - Install new packages"
