#!/usr/bin/env bash
# Docker 없이 Streamlit 앱을 실행합니다.
# 사용법: ./serve.sh            (기본 포트 8501)
#         PORT=8080 ./serve.sh
set -euo pipefail
cd "$(dirname "$0")"

PORT="${PORT:-8501}"
HOST="${HOST:-0.0.0.0}"
VENV_DIR="${VENV_DIR:-.venv}"

if [ "${SKIP_VENV:-0}" != "1" ]; then
  if [ ! -d "$VENV_DIR" ]; then
    python3 -m venv "$VENV_DIR"
  fi
  # shellcheck disable=SC1091
  . "$VENV_DIR/bin/activate"
fi

python3 -m pip install -q -r requirements.txt

exec python3 -m streamlit run streamlit_app.py \
  --server.headless true \
  --server.address "$HOST" \
  --server.port "$PORT" \
  --browser.gatherUsageStats false
