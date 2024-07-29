FROM python:3.9-slim

# 作業ディレクトリを設定
WORKDIR /src

# 必要なファイルをコピー
COPY pyproject.toml poetry.lock /src/

# poetryをインストールして依存関係をインストール
RUN pip install poetry \
    && poetry config virtualenvs.create false \
    && poetry install --no-dev

# アプリケーションのコードをコピー
COPY . /src

# ポートを公開
EXPOSE 8000

# アプリケーションを起動
CMD ["uvicorn", "api.main:app", "--host", "0.0.0.0", "--port", "8000"]
