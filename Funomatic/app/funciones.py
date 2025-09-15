import os
from groq import Groq
from datetime import datetime
import psycopg2
from variables import config
from dotenv import load_dotenv
from variables import config
from pathlib import Path
import os

# Construir la ruta absoluta al .env
env_path = Path(__file__).resolve().parent / ".." / "config" / ".env"
env_path = env_path.resolve()  # Esto convierte ".." en la ruta absoluta real

load_dotenv(dotenv_path=env_path)
# Cargar variables desde el archivo .env
load_dotenv()

config = {
    "host": os.getenv("DB_HOST"),
    "user": os.getenv("DB_USER"),
    "password": os.getenv("DB_PASSWORD"),
    "port": int(os.getenv("DB_PORT")),
    "dbname": os.getenv("DB_NAME")
}

def crear_tabla():
    try:
        conn = psycopg2.connect(**config)
        cursor = conn.cursor()
        cursor.execute("""
            CREATE TABLE IF NOT EXISTS preguntas_respuestas (
                id SERIAL PRIMARY KEY,
                preguntas TEXT NOT NULL,
                respuestas TEXT NOT NULL,
                fechas TIMESTAMP DEFAULT CURRENT_TIMESTAMP
            );
        """)
        conn.commit()
        cursor.close()
        conn.close()
        print("Tabla verificada/creada ✅")
    except Exception as e:
        print("Error creando la tabla:", e)


def bbdd(pregunta, respuesta):
    try:
        conn = psycopg2.connect(**config)
        cursor = conn.cursor()
        query = "INSERT INTO preguntas_respuestas(preguntas, respuestas, fechas) VALUES (%s,%s, %s)"
        cursor.execute(query, (pregunta, respuesta, datetime.now()))
        conn.commit()
        cursor.close()
        conn.close()
        return True
    except Exception as e:
        print("Error al insertar en la BBDD:", e)
        return False 


def llm(lugar, tipo, companeros):
    client = Groq(api_key=os.getenv("KEY_GROQ"))
    user_prompt = f"""

El usuario ha respondido lo siguiente:
- Lugar: {lugar} (dentro o fuera)
- Tipo de actividad: {tipo} (tranquilo, creativo, emocionante, deportivo o “elige por mí”)
- Compañía: {companeros} (solo o acompañado)

Genera un Top 3 de planes cortos adaptados a estas condiciones. Cada plan debe:

- Ser muy imaginativo y divertido.
- Ser **fácilmente realizable**, usando objetos que se tengan en casa o que se puedan encontrar en la calle (piedras, hojas, botellas vacías, lápices, papel, tiza…), la imaginación o los sonidos ambientes.
- Explicar claramente los pasos para que cualquiera pueda seguirlos sin problemas.
- Ser breve: 1–2 frases por plan.
- Numerar los planes (1, 2, 3).
- Usar lenguaje para niños, divertido y con acción.

Instrucciones especiales:

1. **Lugar**: adapta la actividad al entorno indicado (dentro o fuera).
2. **Tipo**: si es “elige por mí”, mezcla tipos de manera equilibrada.
3. **Compañía**:
   - Solo → la actividad se realiza individualmente.
   - Acompañado → cada plan debe incluir interacción directa con la otra persona. Explicita:
     * Qué hace el usuario.
     * Qué hace la otra persona.
     * Cómo interactúan (cooperando, compitiendo, turnándose, creando juntos, descubriendo algo…).

Al final, añade la pregunta:
"¿Te ha gustado alguna de estas ideas?"
Si la respuesta fuera afirmativa, añade:
"¡Pues a por ello! ¡Que te lo pases muy bien!"
Si la respuesta fuera negativa, añade:
"¿Quieres que genere nuevas ideas para ti?"
"""

    chat_completion = client.chat.completions.create(
        messages=[
            {"role": "system", "content": "Eres un asistente creativo que genera actividades para niños. Eres muy imaginativo y divertido"},
            {"role": "user", "content": user_prompt}
        ],
        model="openai/gpt-oss-20b",
        stream=False,
    )

    return chat_completion.choices[0].message.content


