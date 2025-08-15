#!/usr/bin/env bash
set -euo pipefail

## Convenience script to install as many common dependencies as possible
## without failing. User may still need to manually install some packages.

# Check if we're in a project with UV
if [ ! -f "pyproject.toml" ]; then
    echo "❌ pyproject.toml not found. Did you run the setup script?"
    exit 1
fi

if [ ! -d ".venv" ]; then
    echo "❌ .venv not found. Did you run the setup script?"
    exit 1
fi

echo "📦 Installing common Python dependencies..."

# Common data science packages
pypi_packages=(
    "pandas"
    "numpy"
    "matplotlib"
    "seaborn"
    "scipy"
    # "scikit-learn"
    "jupyter"
    "ipykernel"
    "scanpy"
    "anndata"
    "leidenalg"
)

# Install pypi packages
echo "🔬 Installing pypi packages..."
for package in "${pypi_packages[@]}"; do
    if uv run python -c "import $package" 2>/dev/null; then
        echo "✅ $package already installed"
    else
        echo "📥 Installing $package..."
        if uv add "$package"; then
            echo "✅ $package successfully installed"
        else
            echo "❌ Failed to install $package"
        fi
    fi
done

echo ""
echo "✅ Common dependencies installation complete!"
echo "📋 Next steps:"
echo "   - Check installed packages: uv list"
echo "   - Manually install any missing packages"
echo "   - Add more packages: uv add package_name"
echo "   - Install dev dependencies: uv add --dev package_name"

