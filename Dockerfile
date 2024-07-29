# python3.9のイメージをダウンロード
FROM python:3.9-buster

ENV PYTHONUNBUFFERED=1

WORKDIR /src

# pipを使ってpoetryをインストール
RUN pip install poetry

# poetryの定義ファイルをコピー (存在する場合)
COPY pyproject.toml* poetry.lock* ./

# poetryでライブラリをインストール (pyproject.tomlが既にある場合)
RUN poetry config virtualenvs.in-project true
RUN if [ -f pyproject.toml ]; then poetry install --no-root; fi

# requirements.txt を使用する場合
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# アプリケーションソースコードをコピー
COPY . .

# Cloud Run用にPORT環境変数を設定
ENV PORT 8080

# uvicornのサーバーを立ち上げる
CMD ["sh", "-c", "poetry run uvicorn api.main:app --host 0.0.0.0 --port ${PORT}"]
