#include "script_component.hpp"

// CBA Events
[QGVAR(say3D), {(_this select 0) say3D (_this select 1)}] call CBA_fnc_addEventHandler;

if (hasInterface) then {
    if (GVAR(ambientSoundScape)) then {
        [] call FUNC(ambientSoundScape);
    };
};
