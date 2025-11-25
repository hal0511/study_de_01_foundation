# %% 
import requests

# urlを指定してapiを叩いてみる
url = 'https://jsonplaceholder.typicode.com/todos/1'
responce = requests.get(url=url)

# ステータスコード
print('Status:', responce.status_code)

# jsonの中身
data = responce.json()
print('Responce JSON:')
print(data)
