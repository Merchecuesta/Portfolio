from prefect import flow, task, get_run_logger
from googleapiclient.discovery import build
from google_auth_oauthlib.flow import InstalledAppFlow
from google.auth.transport.requests import Request
import pickle
import os
import base64
import time
import logging
from email.mime.text import MIMEText
import re

# ---------------- CONFIGURACIÓN DE LOGS ----------------
BASE_DIR = r"C:\Users\Merche\MIS_PROYECTOS\Automatización correos"
LOG_FILE = os.path.join(BASE_DIR, "logs_gmail.txt")

# Rotar logs si el archivo supera 5 MB
if os.path.exists(LOG_FILE) and os.path.getsize(LOG_FILE) > 5_000_000:
    timestamp = time.strftime("%Y%m%d-%H%M%S")
    os.rename(LOG_FILE, os.path.join(BASE_DIR, f"logs_gmail_{timestamp}.txt"))

# Crear logger global
logger_global = logging.getLogger("gmail_bot_logger")
logger_global.setLevel(logging.INFO)

if not logger_global.handlers:
    file_handler = logging.FileHandler(LOG_FILE, encoding="utf-8")
    formatter = logging.Formatter("%(asctime)s - %(levelname)s - %(message)s")
    file_handler.setFormatter(formatter)
    logger_global.addHandler(file_handler)

logger_global.info(" Inicio de flujo Prefect Gmail Bot")
print(f"Los logs se guardarán en: {LOG_FILE}")

# ---------------- PERMISOS GMAIL ----------------
SCOPES = [
    "https://www.googleapis.com/auth/gmail.readonly",
    "https://www.googleapis.com/auth/gmail.send",
    "https://www.googleapis.com/auth/gmail.modify"
]

# ---------------- FUNCIONES AUXILIARES ----------------
def imagen_a_base64(ruta):
    """Convierte imagen local a Base64"""
    with open(ruta, "rb") as f:
        return base64.b64encode(f.read()).decode()

LOGO_B64 = imagen_a_base64(os.path.join(BASE_DIR, "Images/logo.png"))
HTML_IMG = f'<img src="data:image/png;base64,{LOGO_B64}" alt="Logo" width="300" style="border-radius:8px;"/>'

def limpiar_respuesta(texto):
    """
    Devuelve solo el contenido nuevo del correo,
    eliminando forwards o mensajes previos.
    """
    separadores = [
        "---------- Forwarded message ---------",
        "On ",
        "From:",
        "Sent:",
        "To:",
        "Subject:"
    ]
    for sep in separadores:
        if sep in texto:
            texto = texto.split(sep)[0]

    # Quitar líneas citadas que empiezan con ">"
    texto = "\n".join([line for line in texto.splitlines() if not line.strip().startswith(">")])

    # Quitar bloques HTML citados (blockquote)
    texto = re.sub(r"<blockquote.*?>.*?</blockquote>", "", texto, flags=re.DOTALL | re.IGNORECASE)

    return texto.strip()

# ---------------- PLANTILLAS HTML ----------------
RESPUESTAS = {
    "soporte": f"""
    <html><body style="font-family:Arial;background:#f4f4f4;">
      <table align="center" width="600" style="background:#fff;border-radius:8px;overflow:hidden;">
        <tr><td style="background:#004aad;color:#fff;padding:20px;text-align:center;"><h1>Programa Neuroeduca - Soporte</h1></td></tr>
        <tr><td style="padding:20px;color:#333;">
          <h2>¡Hola!</h2>
          <p>Hemos recibido tu mensaje y nuestro equipo de soporte está revisándolo.</p>
          <p>Mientras tanto, te invitamos a consultar nuestra página con recursos online gratuitos.</p>
          <p style="text-align:center;">
            <a href="https://www.programaneuroeduca.com/recursos" style="background:#004aad;color:#fff;padding:10px 20px;border-radius:5px;text-decoration:none;">Ver Recursos</a>
          </p>
          <p style="text-align:center;">{HTML_IMG}</p>
          <p>Gracias por confiar en nosotros.</p>
        </td></tr>
        <tr><td style="background:#f0f0f0;text-align:center;padding:10px;font-size:12px;color:#777;">© 2025 Programa Neuroeduca.</td></tr>
      </table></body></html>
    """,

    "ventas": f"""
    <html><body style="font-family:Arial;background:#fff7e6;">
      <table align="center" width="600" style="background:#fff;border-radius:8px;overflow:hidden;">
        <tr><td style="background:#ff9900;color:#fff;padding:20px;text-align:center;"><h1>Programa Neuroeduca - Ventas</h1></td></tr>
        <tr><td style="padding:20px;color:#333;">
          <h2>¡Hola!</h2>
          <p>Gracias por tu interés en nuestros servicios y cursos.</p>
          <p>Nuestro equipo de ventas se pondrá en contacto contigo pronto.</p>
          <p style="text-align:center;">
            <a href="https://www.programaneuroeduca.com/red-profesional" style="background:#ff9900;color:#fff;padding:10px 20px;border-radius:5px;text-decoration:none;">Ver formaciones</a>
          </p>
          <p style="text-align:center;">{HTML_IMG}</p>
          <p>Estamos emocionados de ayudarte a crecer.</p>
        </td></tr>
        <tr><td style="background:#fff2e6;text-align:center;padding:10px;font-size:12px;color:#777;">© 2025 Programa Neuroeduca.</td></tr>
      </table></body></html>
    """,

    "consulta general": f"""
    <html><body style="font-family:Arial;background:#e6f7ff;">
      <table align="center" width="600" style="background:#fff;border-radius:8px;overflow:hidden;">
        <tr><td style="background:#007acc;color:#fff;padding:20px;text-align:center;"><h1>Programa Neuroeduca - Consulta</h1></td></tr>
        <tr><td style="padding:20px;color:#333;">
          <h2>¡Hola!</h2>
          <p>Hemos recibido tu consulta y la estamos revisando cuidadosamente.</p>
          <p>Mientras tanto, puedes explorar nuestros artículos y recursos.</p>
          <p style="text-align:center;">
            <a href="https://www.programaneuroeduca.com/blog" style="background:#007acc;color:#fff;padding:10px 20px;border-radius:5px;text-decoration:none;">Ver artículos</a>
          </p>
          <p style="text-align:center;">{HTML_IMG}</p>
          <p>Gracias por escribirnos.</p>
        </td></tr>
        <tr><td style="background:#e6f2ff;text-align:center;padding:10px;font-size:12px;color:#777;">© 2025 Programa Neuroeduca.</td></tr>
      </table></body></html>
    """
}

# ---------------- CATEGORÍAS ----------------
CATEGORIAS = {
    "soporte": ["problema", "problemas", "error", "errores", "fallo", "fallos", "soporte", "ticket"],
    "ventas": ["precio", "precios", "tarifa", "tarifas", "compra", "comprar", "compras", "formación", "curso", "cursos"],
    "consulta general": ["información", "duda", "pregunta", "dudas", "preguntas", "asesoramiento"]
}

# ---------------- TAREAS PREFECT ----------------
@task
def autorizar_gmail():
    logger = get_run_logger()
    creds = None
    if os.path.exists("token.pickle"):
        with open("token.pickle", "rb") as token:
            creds = pickle.load(token)
    if not creds or not creds.valid:
        if creds and creds.expired and creds.refresh_token:
            creds.refresh(Request())
        else:
            flow_oauth = InstalledAppFlow.from_client_secrets_file("credentials.json", SCOPES)
            creds = flow_oauth.run_local_server(port=8080)
        with open("token.pickle", "wb") as token:
            pickle.dump(creds, token)
    service = build("gmail", "v1", credentials=creds)
    logger.info("Autenticación Gmail completada correctamente.")
    logger_global.info("Autenticación Gmail completada correctamente.")
    return service

@task
def leer_correos(service, max_emails=5):
    logger = get_run_logger()
    result = service.users().messages().list(userId="me", maxResults=max_emails, q="is:unread").execute()
    mensajes = result.get("messages", [])
    correos = []
    for m in mensajes:
        msg = service.users().messages().get(userId="me", id=m["id"]).execute()
        from_email = next((h["value"] for h in msg["payload"]["headers"] if h["name"].lower() == "from"), "")
        if "mercumu@gmail.com" not in from_email.lower():
            correos.append(msg)
    logger.info(f"Se encontraron {len(correos)} correos no leídos.")
    logger_global.info(f"Se encontraron {len(correos)} correos no leídos.")
    return correos

@task
def extraer_cuerpo(correo):
    def decode_base64(data):
        return base64.urlsafe_b64decode(data).decode(errors="ignore")
    if "parts" in correo["payload"]:
        for part in correo["payload"]["parts"]:
            if part["mimeType"] == "text/plain":
                return decode_base64(part["body"]["data"])
        for part in correo["payload"]["parts"]:
            if part["mimeType"] == "text/html":
                return decode_base64(part["body"]["data"])
    else:
        return decode_base64(correo["payload"]["body"]["data"])
    return ""

@task
def clasificar_correo_diccionario(cuerpo):
    cuerpo_lower = cuerpo.lower()
    contador = {cat: 0 for cat in CATEGORIAS}
    for categoria, palabras in CATEGORIAS.items():
        for palabra in palabras:
            contador[categoria] += cuerpo_lower.count(palabra)
    max_c = max(contador, key=contador.get)
    return max_c if contador[max_c] > 0 else "consulta general"

@task
def enviar_respuesta(service, correo):
    logger = get_run_logger()
    from_email = next(h["value"] for h in correo["payload"]["headers"] if h["name"].lower() == "from")
    cuerpo = extraer_cuerpo(correo)
    cuerpo = limpiar_respuesta(cuerpo)  # 🔹 Nuevo: limpiar respuestas y forwards
    categoria = clasificar_correo_diccionario(cuerpo)
    mensaje_html = RESPUESTAS.get(categoria, "<p>Hola, gracias por tu correo.</p>")

    subjects = {
        "soporte": "Neuroeduca - Soporte",
        "ventas": "Neuroeduca - Gracias por interesarte en nuestros productos",
        "consulta general": "Neuroeduca - Gracias por contactarnos"
    }
    subject = subjects.get(categoria, "Neuroeduca: Gracias por tu correo")

    mensaje = MIMEText(mensaje_html, "html")
    mensaje["to"] = from_email
    mensaje["subject"] = subject
    raw = base64.urlsafe_b64encode(mensaje.as_bytes()).decode()

    service.users().messages().send(userId="me", body={"raw": raw, "threadId": correo["threadId"]}).execute()
    service.users().messages().modify(userId="me", id=correo["id"], body={"removeLabelIds": ["UNREAD"]}).execute()

    logger.info(f"Correo respondido a {from_email} como {categoria}")
    logger_global.info(f"Correo respondido a {from_email} como {categoria}")

    time.sleep(0.5)  # 🔹 Pausa ligera entre envíos

# ---------------- FLUJO PRINCIPAL ----------------
@flow
def flujo_respuestas_html():
    logger = get_run_logger()
    service = autorizar_gmail()
    correos = leer_correos(service)
    for correo in correos:
        enviar_respuesta(service, correo)
    logger.info("Flujo completado correctamente.")
    logger_global.info("Flujo completado correctamente.")

# ---------------- EJECUCIÓN ----------------
if __name__ == "__main__":
    flujo_respuestas_html()

