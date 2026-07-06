#include "script_component.hpp"

if (!hasInterface) exitWith {};

// Grab nearby building positions in 100m and cache them as used so no loot generates infront of player on spawn / reload inside buildings
[{!isNull player}, {
    [player, 100] call EFUNC(common,nearBuilding) params ["", "", "_nearBuildings"];
    private _toCache = [];

    {
        _toCache pushBackUnique _x;
    } forEach _nearBuildings;

    GVAR(building_used) append _toCache;

    publicVariableServer QGVAR(building_used);
}, []] call CBA_fnc_waitUntilAndExecute;
