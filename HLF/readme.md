# 🚢 Hundir la Flota - Juego en Python 🎯

Este es un juego de consola estilo **"Hundir la Flota"**, desarrollado en Python. ¡Enfréntate contra una máquina que coloca y dispara de forma aleatoria, y hunde su flota antes de que hunda la tuya!

---

## 📆 Presentación del proyecto

Este proyecto fue realizado como ejercicio individual de un curso de programación. Incluye:

- Clonación del repositorio y ejecución local del juego.
- Explicación de la estructura del proyecto.
- Demostración del funcionamiento del juego desde la terminal.

---

## 📆 Requisitos

- Python 3.7 o superior
- Biblioteca:
  - `numpy`

Para instalarla:

```bash
pip install numpy
```

---

## ▶️ Cómo jugar

1. Clona el repositorio:

```bash
git clone https://github.com/Merchecuesta/mi_porfolio
```

2. Ejecuta el juego desde terminal:

```bash
python main.py
```

---

## 🔹 Instrucciones del juego

- Introduce una **fila (0-9)** y luego una **columna (0-9)** para disparar.
- Tu tablero muestra tus barcos como "O".
- Si aciertas, verás una "X" (tocado); si fallas, un "-" (agua).
- El tablero enemigo oculta sus barcos hasta ser tocados.
- Gana quien hunda todos los barcos del oponente primero.

---

## 📀 Estructura del proyecto

- `main.py`: Bucle principal del juego. Controla los turnos y el flujo.
- `utils.py`: Contiene las funciones auxiliares:
  - `mostrar_reglas()`: Muestra las reglas del juego.
  - `mostrar_tablero()`: Imprime los tableros de juego.
  - `colocar_barcos()`: Coloca los barcos de forma aleatoria.
  - `recibir_disparo()`: Procesa el disparo y actualiza el tablero.
  - `todos_hundidos()`: Comprueba si todos los barcos han sido hundidos.

---

## 🌟 Características destacadas

- Interfaz con emojis para hacerlo más visual.
- Colocación aleatoria de barcos con animaciones.
- Turnos alternos entre jugador y máquina.
- Pausas realistas con `time.sleep()`.
- Código modular y limpio.

---

## 📈 Captura simulada del juego

```
🫵 Tu tablero:
  0 1 2 3 4 5 6 7 8 9
0     O     O
1       O
2 -   X
...

🗼 Tablero enemigo:
  0 1 2 3 4 5 6 7 8 9
0       -     
1     X     
...
```

---

## 📚 Créditos

Desarrollado por Mercedes Cuesta como parte de un proyecto individual de programación en Python.

📕 Junio 2025

