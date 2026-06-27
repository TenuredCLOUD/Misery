#include "script_component.hpp"

["CBA_settingsInitialized", {
    call FUNC(action);
}] call CBA_fnc_addEventHandler;

[QGVAR(repairVehiclePart), {
    params ["_vehicle", "_repairParams"];
    _vehicle setHitPointDamage _repairParams;
}] call CBA_fnc_addEventHandler;
