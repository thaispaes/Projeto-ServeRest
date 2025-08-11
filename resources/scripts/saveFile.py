import json
import os

def Save_users(new_user, arquivo_json="users.json"):
    users = []
    
    if os.path.exists(arquivo_json):
        with open(arquivo_json, "r", encoding="utf-8") as file:
            try:
                users = json.load(file)
            except json.JSONDecoderError:
                users = []
    
    users.append(new_user)
    with open(arquivo_json, "w", encoding="UTF-8") as file:
        json.dump(users, file, ensure_ascii=False, indent=4)
        
    
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
    return qtdIndexs
    
    
def Find_admin_user(find_admin, arquivo_json="users.json"):
    admin_users = {}
    users = {}
    
    if find_admin:
        try:
            with open(arquivo_json, "r", encoding="utf-8") as file:
                users = json.load(file)
        
        except  (FileNotFoundError, json.JSONDecodeError):
            print("Arquivo nao encontrado ou vazio")
            return 
    
        for user in users:
            if user.get("admin") == True:
                return user
            
        if not admin_users:
            print("Nenhum usuario admin encontrado")
            return False

        
    