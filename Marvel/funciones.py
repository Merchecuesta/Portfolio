import hashlib
import datetime
import requests
import pandas as pd
from variables import public_key, private_key, initial

pd.set_option("max_colwidth", 100)


def generar_hash():
    ts = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
    to_hash = ts + private_key + public_key
    hash_result = hashlib.md5(to_hash.encode()).hexdigest()
    return ts, hash_result

def obtener_personajes(ts, hash_result):
    url = "https://gateway.marvel.com/v1/public/characters"
    params = {
        "ts": ts,
        "apikey": public_key,
        "hash": hash_result,
        "nameStartsWith": initial,
        "limit": 100
    }

    response = requests.get(url, params=params)

    if response.status_code == 200:
        data = response.json()
        characters = data["data"]["results"]
        return characters
    else:
        print(f"Error en la petición: {response.status_code}")
        return []

def procesar_personajes(characters):
    ids = []
    names = []
    picture_urls = []

    for char in characters:
        ids.append(char['id'])
        names.append(char['name'])
        thumbnail = char['thumbnail']
        picture_url = f"{thumbnail['path']}.{thumbnail['extension']}"
        picture_urls.append(picture_url)

    df = pd.DataFrame({
        "id": ids,
        "name": names,
        "picture_url": picture_urls
    })

    return df
