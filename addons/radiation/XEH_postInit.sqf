#include "script_component.hpp"

if (isServer) then {
    [] call FUNC(inArea);
};

if !(hasInterface) exitWith {};

[QGVAR(radiationEvent), FUNC(process)] call CBA_fnc_addEventHandler;
