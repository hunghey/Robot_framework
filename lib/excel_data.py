# login_data.py
import pandas as pd
import os

def get_all_login_data_excel(file_path, user_row=0):
    print(os.getcwd())

    df = pd.read_excel(os.getcwd()+'/data/login_data.xlsx', sheet_name='Sheet1', engine='openpyxl')
    df = df.where(pd.notnull(df),'')
    return df.to_dict(orient='records')