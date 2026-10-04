# AzerothCore: Módulo Draenei Druida

Este módulo para **AzerothCore (WotLK 3.3.5a)** habilita la combinación de raza y clase **Draenei Druida**. Incluye los scripts automatizados necesarios para parchear los archivos del cliente y del servidor de forma legal, sin distribuir binarios protegidos por derechos de autor.

> **IMPORTANTE:** Por motivos de derechos de autor, no se proporcionan los archivos de datos originales del juego de ninguna manera. Debes extraer los archivos DBC base desde tu propio cliente.

Los archivos requeridos para que este módulo funcione son:
* `CharBaseInfo.dbc`
* `CharStartOutfit.dbc`
* `SkillLineAbility.dbc`

---

## Paso 1: Parcheo y Creación del Archivo MPQ

1. Coloca tus 3 archivos DBC originales limpios en el mismo directorio donde se encuentran los scripts de instalación.
2. Abre tu terminal y otorga permisos de ejecución al script principal:

       chmod +x draenei_druid.sh

3. Ejecuta el script:

       ./draenei_druid.sh

**El script automatizado se encargará de realizar todo el trabajo pesado:**
* Verificará e instalará la herramienta `mpqcli` automáticamente si no la tienes en tu sistema.
* Ejecutará el script de Python (`draenei_druid.py`) para inyectar la lógica de clase y raza en tus archivos DBC.
* Creará la estructura interna requerida para el juego (`DBFilesClient/`) y copiará los DBCs ahí.
* Empaquetará la carpeta dentro de un archivo MPQ personalizado llamado `patch-y.mpq`.

---

## Paso 2: Instalación en el Servidor (AzerothCore)

Para que el emulador reconozca que el Draenei puede ser Druida, necesita leer las tablas actualizadas.

1. Toma los archivos DBC ya modificados por el script (`CharBaseInfo.dbc`, `CharStartOutfit.dbc`, `SkillLineAbility.dbc`).
2. Copia estos archivos dentro de la carpeta de datos de AzerothCore: 
   `bin/Data/dbc/` (o `data/dbc/` según la estructura de tu compilación).
3. Reinicia tu servidor (`worldserver`) para que cargue los nuevos DBCs en memoria.

---

## Paso 3: Instalación en el Cliente

Para que tu cliente de World of Warcraft 3.3.5a te permita crear el personaje y ver sus hechizos sin errores:

1. Toma el archivo `patch-y.mpq` generado por el script automatizado.
2. Guarda el archivo `patch-y.mpq` directamente en la carpeta `Data/` de tu cliente de World of Warcraft 3.3.5a.
3. Elimina la carpeta `Cache` ubicada en la raíz de tu cliente de WoW.
4. ¡Inicia el juego!

> **Nota:** La inyección de la base de datos (SQL) es manejada automáticamente por el gestor de módulos de AzerothCore al compilar, por lo que no requieres realizar pasos manuales en tu gestor de base de datos.

---

## Apoyo
Si este módulo te ha sido de utilidad y deseas apoyar mi trabajo, puedes invitarme un café:
☕ [buymeacoffee.com/foliaprintempo](https://buymeacoffee.com/foliaprintempo)