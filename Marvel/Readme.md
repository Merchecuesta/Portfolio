📦 Proyecto: Marvel Character Downloader
Este proyecto permite consultar la API de Marvel para obtener información de personajes que empiezan con una letra específica (como la inicial de tu nombre), y guardar los resultados en un archivo CSV.

🛠️ Tecnologías usadas
Python 3

requests – para hacer peticiones HTTP a la API de Marvel

pandas – para procesar y guardar los datos en CSV

hashlib, datetime – para generar el hash de autenticación que exige la API

📁 Estructura del proyecto
bash
Copiar
Editar
.
├── main.py             # Script principal que ejecuta todo
├── funciones.py        # Funciones auxiliares (API, procesar datos, etc.)
├── variables.py        # Claves de la API y configuración
└── marvel_characters.csv  # Archivo generado con los personajes

🔑 Requisitos previos

Tener una cuenta en el portal de desarrolladores de Marvel:
👉 https://developer.marvel.com

Obtener tus claves:
public_key
private_key

⚙️ Configuración
Edita el archivo variables.py con tus claves y letra inicial:

python
Copiar
Editar
# variables.py

public_key = "TU_PUBLIC_KEY"
private_key = "TU_PRIVATE_KEY"
initial = "M"  # Letra inicial para buscar personajes
filename = "marvel_characters.csv"

▶️ Cómo ejecutar

Desde la terminal, en la carpeta del proyecto, ejecuta:

bash
Copiar
Editar
python main.py

Esto hará lo siguiente:
Se conecta a la API de Marvel.

Busca personajes que comiencen con la letra indicada.

Guarda su id, name y picture_url en un archivo CSV.

📄 Ejemplo del CSV generado
id	name	picture_url
1009368	Iron Man	http://.../ironman.jpg
1009610	Spider-Man	http://.../spiderman.jpg


🧑‍💻 Autor
Proyecto educativo para practicar integración de APIs y uso de pandas.

