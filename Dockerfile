FROM python:3.9

WORKDIR /src

COPY requirements.txt requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

# アプリケーションソースコードをコピー
COPY . .

# Cloud Run用にPORT環境変数を使用
ENV PORT 8080

# Uvicornサーバーを起動
CMD ["uvicorn", "api.main:app", "--host", "0.0.0.0", "--port", "${PORT}"]
