import pandas as pd
import csv

def get_all_login_data(file_path, user_row=0):
    # Đọc dữ liệu từ file CSV
    df = pd.read_csv(file_path)

    return df.to_dict(orient='records')

def write_csv(file_path, header, rows):

    file_exists = False
    try:
        with open(file_path, 'r', newline='', encoding='utf-8') as csvfile:
            file_exists = True
    except FileNotFoundError:
        pass

    mode = 'a' if file_exists else 'w'
    with open(file_path, mode, newline='', encoding='utf-8') as csvfile:
        datarow = []
        writer = csv.writer(csvfile)
        if not file_exists:
            writer.writerow(header)
        for row in rows:
            if row == '':
            # import sys, pdb;pdb.Pdb(stdout=sys.__stdout__).set_trace()
                datarow.append('')
            if row !='':
                if isinstance(row[-1],list):
                    row[-1] = ', '.join(row[-1])
                datarow.append(row)
        writer.writerow(datarow)