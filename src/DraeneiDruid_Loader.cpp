#include "ScriptMgr.h"

// Clase base vacía para registrar el módulo en el emulador
class mod_draenei_druid : public PlayerScript {
public:
    mod_draenei_druid() : PlayerScript("mod_draenei_druid") {}
};

// Función de carga requerida por AzerothCore
void Addmod_draenei_druidScripts() {
    new mod_draenei_druid();
}