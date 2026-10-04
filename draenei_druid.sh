#!/bin/bash
# Script independiente para instalar dependencias, parchear DBCs y empaquetar en MPQ.

PATCH_DIR="patch-y"
PATCH_FILE="patch-y.mpq"
PYTHON_SCRIPT="draenei_druid.py"

echo "=== 1. Verificando e Instalando mpqcli ==="
if ! command -v mpqcli &> /dev/null; then
    echo "[!] mpqcli no encontrado. Instalando mediante el script oficial..."
    # Se utiliza el comando oficial de instalación rápida para Linux
    curl -fsSL https://raw.githubusercontent.com/thegraydot/mpqcli/main/scripts/install.sh | bash
    
    # Refresca el PATH en caso de que el instalador coloque el binario en ~/.local/bin
    export PATH="$HOME/.local/bin:$PATH"
    
    if command -v mpqcli &> /dev/null; then
        echo "[+] mpqcli instalado exitosamente."
    else
        echo "[!] mpqcli se instaló, pero necesitas reiniciar tu terminal o agregarlo manualmente a tu PATH."
    fi
else
    echo "[+] mpqcli ya está instalado en el sistema."
fi

echo "=== 2. Ejecutando el parche de habilidades y razas ==="
if [ -f "$PYTHON_SCRIPT" ]; then
    python3 "$PYTHON_SCRIPT"
else
    echo "[-] No se encontró $PYTHON_SCRIPT en este directorio. Omitiendo parcheo."
fi

echo "=== 3. Preparando la estructura del cliente ==="
# Crea la jerarquía de carpetas desde cero asumiendo que no existen
mkdir -p "$PATCH_DIR/DBFilesClient"

# Copia los archivos .dbc al directorio correcto en lugar de moverlos
for dbc in CharBaseInfo.dbc CharStartOutfit.dbc SkillLineAbility.dbc; do
    if [ -f "$dbc" ]; then
        cp "$dbc" "$PATCH_DIR/DBFilesClient/"
        echo "  -> Copiado $dbc a $PATCH_DIR/DBFilesClient/"
    else
        echo "  [!] Advertencia: No se encontró $dbc para copiar."
    fi
done

echo "=== 4. Empaquetando el archivo MPQ ==="
if [ -d "$PATCH_DIR/DBFilesClient" ]; then
    # Elimina el parche si ya existe para que mpqcli create funcione correctamente
    if [ -f "$PATCH_FILE" ]; then
        echo "  -> Eliminando versión anterior de $PATCH_FILE..."
        rm -f "$PATCH_FILE"
    fi
    
    # Empaqueta la carpeta usando mpqcli create
    mpqcli create "$PATCH_DIR"
    
    echo "=== [+] PROCESO COMPLETADO ==="
    echo "Guarda $PATCH_FILE en la carpeta Data/ de tu cliente World of Warcraft 3.3.5a."
else
    echo "[!] Error: No se encontró la carpeta $PATCH_DIR/DBFilesClient para empaquetar."
fi