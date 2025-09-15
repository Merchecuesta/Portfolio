import numpy as np
import random
import time

def mostrar_reglas():
    print("""
🚢 ******* ¡Bienvenido a Hundir la Flota! ******* 🚢
          
🎯 Objetivo:

 Hundir toda la flota enemiga antes de que ellos hundan la tuya.
          

📋 Instrucciones:
          
1️⃣  Para disparar, introduce primero el número de la fila (0-9) y luego el de la columna (0-9).

2️⃣  Tus barcos aparecen en tu tablero como "O".

3️⃣  Cuando un disparo da en un barco (tuyo o de tu enemigo), ese lugar se marca con una "X" ("Tocado").

4️⃣  Si falláis, la casilla se marca con un "-" ("Agua").

5️⃣  ¡El jugador que hunda toda la flota contraria gana la partida!
          

🔥 ¡Buena suerte y que gane el mejor estratega! 🔥
""")

def crea_tablero(lado=10):
    return np.full((lado, lado), " ")

def coloca_barco_plus(tablero, barco):
    tablero_temp = tablero.copy()
    num_max_filas = tablero.shape[0]
    num_max_columnas = tablero.shape[1]
    for pieza in barco:
        fila, columna = pieza
        if fila < 0 or fila >= num_max_filas or columna < 0 or columna >= num_max_columnas:
            return False
        if tablero[pieza] in ["O", "X"]:
            return False
        tablero_temp[pieza] = "O"
    return tablero_temp

def colocar_barcos(tablero):
    esloras = [2, 2, 2, 3, 3, 4]
    for eslora in esloras:
        colocado = False
        intentos = 0
        print(f"🔧 Intentando colocar barco de eslora {eslora}...")
        while not colocado and intentos < 200:
            intentos += 1
            barco = []
            fila = random.randint(0, 9)
            col = random.randint(0, 9)
            orientacion = random.choice(["N", "S", "E", "O"])
            barco.append((fila, col))
            for _ in range(eslora - 1):
                if orientacion == "N": fila -= 1
                elif orientacion == "S": fila += 1
                elif orientacion == "E": col += 1
                elif orientacion == "O": col -= 1
                barco.append((fila, col))
            tablero_temp = coloca_barco_plus(tablero, barco)
            if isinstance(tablero_temp, np.ndarray):
                tablero = tablero_temp
                colocado = True
                print(f"✅ Barco de eslora {eslora} colocado ")
                time.sleep(0.7)
        if not colocado:
            print(f"⚠️ No se pudo colocar el barco de eslora {eslora} después de muchos intentos.")
            time.sleep(0.7)
    return tablero

def mostrar_tablero(tablero, oculto=False):
    # Imprimir números de columnas
    print("  ", end="")
    for i in range(tablero.shape[1]):
        print(i, end=" ")
    print() # Salto de línea al final de la fila
    
    # Imprimir filas con números y contenido
    for i in range(tablero.shape[0]):
        print(i, end=" ")
        for c in tablero[i]:
            if oculto and c == "O":
                print(" ", end=" ")
            else:
                print(c, end=" ")
        print()  # Salto de línea al final de la fila

def contar_barcos_restantes(tablero):
    return np.sum(tablero == "O")

def obtener_coordenada_usuario():
    while True:
        try:
            fila = int(input("Introduce la fila (0-9): "))
            col = int(input("Introduce la columna (0-9): "))
            if 0 <= fila < 10 and 0 <= col < 10:
                return (fila, col)
            else:
                print("Coordenadas fuera de rango.")
        except:
            print("Entrada inválida, usa números enteros.")

def disparo_maquina(tablero, disparos_previos):
    while True:
        fila = random.randint(0, 9)
        col = random.randint(0, 9)
        if (fila, col) not in disparos_previos:
            return (fila, col)

def recibir_disparo(tablero, coordenada):
    if tablero[coordenada] == "O":
        tablero[coordenada] = "X"
        print(f"💥 ¡Tocado en {coordenada}!")
        time.sleep(1)
    elif tablero[coordenada] == "X" or tablero[coordenada] == "-":
        print(f"⛔ Ya disparaste a {coordenada}, prueba otro lugar.")
        time.sleep(1)
    else:
        tablero[coordenada] = "-"
        print(f"🌊 Agua en {coordenada}.")
        time.sleep(1)

def todos_hundidos(tablero):
    return not np.any(tablero == "O")
