from funciones import generar_hash, obtener_personajes, procesar_personajes
from variables import filename

def main():
    ts, hash_result = generar_hash()
    characters = obtener_personajes(ts, hash_result)

    if characters:
        df = procesar_personajes(characters)
        df.to_csv(filename, index=False, encoding="utf-8")
        print(f"Archivo {filename} creado con éxito.")
    else:
        print("No se pudo obtener la información de personajes.")

if __name__ == "__main__":
    main()
