from funciones import llm, bbdd

def test_llm():
    print("=== Probando LLM ===")
    try:
        tipo = "emocionante"
        lugar = "fuera"
        companeros = "solo"
        respuesta = llm(tipo, lugar, companeros)
        if respuesta:
            print("✅ LLM funciona. Respuesta:")
            print(respuesta)
        else:
            print("❌ LLM no devolvió respuesta")
    except Exception as e:
        print("❌ Error en LLM:", e)

def test_bbdd():
    print("\n=== Probando BBDD ===")
    preguntas = [
        "¿Cuál es tu color favorito?",
        "¿Qué te gusta hacer los fines de semana?",
        "¿Prefieres montaña o playa?"
    ]
    respuestas = [
        "Azul",
        "Leer libros y pasear",
        "Playa"
    ]
    for p, r in zip(preguntas, respuestas):
        resultado = bbdd(p, r)
        if resultado:
            print(f"✅ Inserción correcta: '{p}' -> '{r}'")
        else:
            print(f"❌ Fallo al insertar: '{p}' -> '{r}'")

def test_flujo_completo():
    print("\n=== Probando flujo completo (LLM -> BBDD) ===")
    try:
        tipo = "creativo"
        lugar = "dentro"
        companeros = "acompañado"
        respuesta = llm(tipo, lugar, companeros)
        pregunta = f"Planes {tipo}, {lugar}, {companeros}"
        resultado = bbdd(pregunta, respuesta)
        if resultado:
            print("✅ Flujo completo funciona. Pregunta y respuesta guardadas en BBDD")
            print("Pregunta:", pregunta)
            print("Respuesta:", respuesta)
        else:
            print("❌ Flujo completo falló al guardar en BBDD")
    except Exception as e:
        print("❌ Error en flujo completo:", e)

if __name__ == "__main__":
    test_llm()
    test_bbdd()
    test_flujo_completo()

