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

-- 3. Skills (competencia de arma)
DELETE FROM `playercreateinfo_skills`
WHERE `raceMask` = 1024 AND `classMask` = 1024
  AND `skill` IN (136, 54, 160, 173, 473, 229, 162);

INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES
(1024, 1024, 136, 0, 'Draenei Druid - Staves'),
(1024, 1024, 54,  0, 'Draenei Druid - Maces'),
(1024, 1024, 160, 0, 'Draenei Druid - Two-Handed Maces'),
(1024, 1024, 173, 0, 'Draenei Druid - Daggers'),
(1024, 1024, 473, 0, 'Draenei Druid - Fist Weapons'),
(1024, 1024, 229, 0, 'Draenei Druid - Polearms'),
(1024, 1024, 162, 0, 'Draenei Druid - Unarmed');