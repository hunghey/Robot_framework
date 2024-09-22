# login_data.py
import pandas as pd

def get_all_login_data(file_path, user_row=0):
    # Đọc dữ liệu từ file CSV
    df = pd.read_csv(file_path)

    return df.to_dict(orient='records')