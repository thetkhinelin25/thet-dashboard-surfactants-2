#!/bin/bash

# Activate Python environment (if using virtualenv)
if [ -d "antenv" ]; then
  source antenv/bin/activate
fi

# Install dependencies if not present (useful for CI/CD edge cases)
if [ ! -f ".dependencies_installed" ]; then
  pip install -r requirements.txt
  touch .dependencies_installed
fi

# Run Streamlit with Azure-optimized settings
streamlit run main.py \
  --server.port=$PORT \
  --server.enableCORS=false \
  --server.enableXsrfProtection=false \
  --server.headless=true \
  --logger.level=error

