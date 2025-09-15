# Funomatic-Flask

---

## Descripción

Funomatic-Flask es una aplicación web de IA generativa que permite a los usuarios interactuar con un modelo de lenguaje para obtener respuestas automáticas a sus consultas.  
La aplicación está desarrollada en Python con Flask y está completamente dockerizada para facilitar su despliegue y escalabilidad.

---

## Tecnologías utilizadas

- Python 3.11  
- Flask  
- Docker  
- PostgreSQL (opcional, para almacenar historial de interacciones)  
- Docker Hub para distribución de la imagen  

---

## Estructura del proyecto

fun-o-matic/
├── app/ # Código fuente principal
│ ├── app.py # Código principal de la app
│ ├── funciones.py # Funciones auxiliares
│ ├── variables.py # Variables de configuración
│ └── test.py # Test de verificación
├── front/ # Archivos para HTML
│ ├── fondo/ # Fondo del HTML u otros recursos
│ └── index.html # HTML principal
├── config/ # Configuración
│ └── .env.example # Archivo ejemplo variables de entorno 
├── docker/ # Archivos de Docker
│ └── Dockerfile
├── requirements.txt # Dependencias de Python
├── README.md # Documentación principal


---

## Instalación y ejecución

### 1. Ejecutar localmente sin Docker

bash

--Crear entorno virtual
python -m venv venv
source venv/bin/activate   # Linux/macOS
venv\Scripts\activate      # Windows

--Instalar dependencias
pip install -r requirements.txt

--Ejecutar aplicación
python app/app.py
Accede en tu navegador: http://localhost:5000

2. Ejecutar usando Docker (recomendado)

bash

--Construir la imagen localmente
docker build -t funomatic-flask .

--Ejecutar el contenedor
docker run -d -p 5000:5000 funomatic-flask
Accede en tu navegador: http://localhost:5000

3. Usar la imagen desde Docker Hub

bash

docker pull cuestame/funomatic-flask:latest
docker run -d -p 5000:5000 cuestame/funomatic-flask:latest
Accede en tu navegador: http://localhost:5000


##Ejemplos de uso


Abrir la aplicación y enviar consultas al modelo de lenguaje.

Ver la respuesta generada automáticamente en la interfaz web.

Todas las interacciones se pueden almacenar en la base de datos para análisis futuro (opcional).


##Consideraciones de seguridad y despliegue


El servidor Flask no está optimizado para producción.

Para producción se recomienda:

WSGI server: Gunicorn o uWSGI

Reverse proxy: Nginx

HTTPS para proteger la información de los usuarios

Evitar exponer la app directamente a Internet sin seguridad adicional.


##Contacto


Autor: Merche Cuesta

GitHub: Portfolio Funomatic-Flask

Docker Hub: cuestame/funomatic