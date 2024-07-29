FROM python:3.9-buster

ENV PYTHONUNBUFFERED=1

WORKDIR /src

# poetry をインストール
RUN pip install poetry

# pyproject.toml と poetry.lock をコピー
COPY pyproject.toml poetry.lock ./

# 仮想環境をプロジェクト内に作成し、依存関係をインストール
RUN poetry config virtualenvs.in-project true
RUN poetry install --no-root

# 残りのアプリケーションソースコードをコピー
COPY . .

# ポート番号を環境変数から取得
ENV PORT 8080

# アプリケーションを起動
CMD ["sh", "-c", "poetry run uvicorn api.main:app --host 0.0.0.0 --port ${PORT}"]
