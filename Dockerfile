# python3.9のイメージをダウンロード
FROM python:3.9-buster
ENV PYTHONUNBUFFERED=1

WORKDIR /src

# pipを使ってpoetryをインストール
RUN pip install poetry

# poetryの定義ファイルをコピー
COPY pyproject.toml* ./

# poetryでライブラリをインストール (poetry.lockがない場合はupdateを使用)
RUN poetry config virtualenvs.in-project true
RUN if [ -f poetry.lock ]; then poetry install --no-root; else poetry update; fi

# アプリケーションソースコードをコピー
COPY . .

# uvicornのサーバーを立ち上げる
CMD ["sh", "-c", "poetry run uvicorn api.main:app --host 0.0.0.0 --port ${PORT}"]
