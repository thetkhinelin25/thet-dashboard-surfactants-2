#!/bin/bash
PORT=${PORT:-8000}
streamlit run main.py --server.port=$PORT --server.enableCORS false
