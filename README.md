# :earth_americas: GDP dashboard template

A simple Streamlit app showing the GDP of different countries in the world.

[![Open in Streamlit](https://static.streamlit.io/badges/streamlit_badge_black_white.svg)](https://gdp-dashboard-template.streamlit.app/)

### How to run it on your own machine

1. Install the requirements

   ```
   $ pip install -r requirements.txt
   ```

2. Run the app

   ```
   $ streamlit run streamlit_app.py
   ```

## 서버 운영

Streamlit 앱(`streamlit_app.py`)이며 기본 포트는 **8501** 입니다. 헬스체크 엔드포인트: `GET /_stcore/health` → `ok`.

### Docker Compose (권장)

```bash
docker compose up -d --build
# 호스트 포트를 바꾸려면: HOST_PORT=8080 docker compose up -d --build
curl http://localhost:8501/_stcore/health
```

### Docker 단독

```bash
docker build -t gdp-dashboard .
docker run -d -p 8501:8501 --name gdp-dashboard gdp-dashboard
```

이미지에는 `HEALTHCHECK`가 포함되어 있어 `docker ps`에서 상태(healthy/unhealthy)를 확인할 수 있습니다.

### Docker 없이 실행

```bash
./serve.sh               # .venv 생성 후 의존성 설치, 0.0.0.0:8501 에서 실행
PORT=8080 ./serve.sh     # 포트 변경
SKIP_VENV=1 ./serve.sh   # 가상환경 없이 현재 Python 사용
```

### 환경 변수 / 비밀값

현재 앱은 비밀값(API 키 등)이 필요하지 않습니다. 추후 필요해지면 저장소에 커밋하지 말고
환경 변수나 `.env` 파일(`.gitignore`/`.dockerignore`에 포함됨)로 주입하세요.
