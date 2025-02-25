#include "script_component.hpp"

if (!hasInterface) exitWith {};

["CBA_settingsInitialized", {
    if (GVAR(enhanced)) then {
        [] call FUNC(deficiency);
        [] call FUNC(rebreatherAudio);
    };
}] call CBA_fnc_addEventHandler;

// For gasmask cartridge efficiency.
GVAR(modifiers) = 0;
