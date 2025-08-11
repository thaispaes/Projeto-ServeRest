import os
import json

def Count_users(arquivo_json="users.json"):
    users = []
    
    if os.path.exists(arquivo_json):
        with open(arquivo_json, "r", encoding="utf-8") as file:
            try:
                users = json.load(file)
            except  (FileNotFoundError, json.JSONDecodeError):
                print("Arquivo nao encontrado ou vazio")
                return 
    
    qtdIndexs = len(users)
    print(qtdIndexs)
    return qtdIndexs
    
Count_users()