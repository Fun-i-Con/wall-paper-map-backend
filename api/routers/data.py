from fastapi import APIRouter
import pandas as pd
import os
from fastapi.responses import FileResponse
router = APIRouter()

IMAGE_DIRECTORY = "api/images"
# CSVファイルのパス
file_path = 'api\data\map.csv'
import pandas as pd  # ここにPandasのインポートを追加


@router.get("/data")
def get_data():
    # CSVファイルの読み込み
    data = pd.read_csv('api/data/map.csv', header=None, names=["id", "x", "y"])
    # データをリスト形式で取得
    result = data.to_dict(orient='records')
    return result


@router.get("/images/{image_name}", response_class=FileResponse)
async def get_image(image_name: str):
    image_path = os.path.join(IMAGE_DIRECTORY, image_name)
    if os.path.exists(image_path):
        return FileResponse(image_path)
    else:
        return {"error": "Image not found"}, 404
