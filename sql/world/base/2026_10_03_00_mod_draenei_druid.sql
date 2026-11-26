-- ===========================================================
-- Parche Base acore_world: Draenei Druid (Raza 11 / Clase 11)
-- ===========================================================

-- 1. Posición e información de inicio (Isla Bruma Azur)
DELETE FROM `playercreateinfo` WHERE `race` = 11 AND `class` = 11;
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`)
SELECT 11, 11, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`
FROM `playercreateinfo` WHERE `race` = 11 AND `class` = 1 LIMIT 1;

-- 2. Barras de acción iniciales (Copiadas de Druida - Elfo de la Noche)
DELETE FROM `playercreateinfo_action` WHERE `race` = 11 AND `class` = 11;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT 11, 11, `button`, `action`, `type`
FROM `playercreateinfo_action`
WHERE `race` = 4 AND `class` = 11;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(11, 11, 3, 59547, 0);