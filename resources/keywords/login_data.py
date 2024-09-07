# login_data.py
import pandas as pd

def get_all_login_data(file_path, user_row=0):
    # Đọc dữ liệu từ file CSV
    df = pd.read_csv(file_path)

    # Lấy thông tin người dùng từ dòng chỉ định (user_row)
    # user_data = df.iloc[user_row]
    # email = user_data['email']
    # password = user_data['password']
    #
    # return email, password
    return df.to_dict(orient='records')