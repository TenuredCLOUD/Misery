#include "script_component.hpp"
#include "XEH_PREP.hpp"

//Loot
if (MiseryLootEnabled) then {
[] execVM "\z\misery\addons\loot\functions\fnc_Start.sqf";
};
