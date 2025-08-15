import json
import os

#Função responsável por salvar os usuários criados no json "users"
def Save_users(new_user, arquivo_json="users.json"):
    users = []
    
    if os.path.exists(arquivo_json):
        with open(arquivo_json, "r", encoding="utf-8") as file:
            try:
                users = json.load(file)
            except json.JSONDecoderError:
                users = []
    
    users.append(new_user) #Salva o novo usuário na lista de dicionários
    with open(arquivo_json, "w", encoding="UTF-8") as file:
        json.dump(users, file, ensure_ascii=False, indent=4) #Salva o usuário no arquivo "users" no formato json
        
#Responsável por pegar a quantidade de usuários no arquivo, contar e retornar quantos estão salvos  
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
    
#Procura dentro do arquivo de usuários qual o primeiro usuário da lista que é admin e retorna os seus dados
def Find_admin_user(arquivo_json="users.json"):
    users = []
    
    try:
        with open(arquivo_json, "r", encoding="utf-8") as file:
            users = json.load(file)
        
    except  (FileNotFoundError, json.JSONDecodeError):
        print("Arquivo nao encontrado ou vazio")
        return 
    
    for user in users:
        if user.get("admin") == True:
                
            return {
                "name": user.get("name"),
                "email":user.get("email"),
                "password":user.get("password")
            }
            
    if not user:
        print("Nenhum usuario admin encontrado")
        return False

        
    