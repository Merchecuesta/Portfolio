from flask import request, Flask, jsonify
import os
from funciones import llm, bbdd
from flask_cors import CORS
from funciones import crear_tabla
crear_tabla()

app = Flask(__name__)
CORS(app)
app.config["DEBUG"] = True

@app.route("/", methods=["GET"])
def main():
    return "API Asistente Anti-Aburrimiento"

@app.route("/planes", methods=["POST"])
def planes():
    # Ejemplo de JSON de entrada: {"lugar":"dentro", "tipo":"creativo", "companeros":"solo", "preferencia_divertida":"absurdo"}
    data = request.get_json()

    lugar = data.get("lugar")
    tipo = data.get("tipo")
    companeros = data.get("companeros")
    
    # Llamada al LLM
    respuesta = llm(lugar, tipo, companeros)

    # Guardar en la BBDD
    pregunta_json = str(data)
    resultado_bbdd = bbdd(pregunta_json, respuesta)

    if resultado_bbdd:
        return jsonify({"inputs": data, "respuesta": respuesta})
    else:
        return jsonify({"error": "Error al guardar los datos en la base de datos"}), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port = 5000, debug = True)

