#include "script_component.hpp"

if !(GVAR(enabled)) exitWith {};

player setVariable [QGVAR(furnitureInventory), []];
player setVariable [QGVAR(placedFurniture), []];

[
    "furniture_menu",
    "Place Objects",
    {call FUNC(condition)},
    {
        [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
        [] call FUNC(openInventory);
        GVAR(objectPlacementDone) = false;
        GVAR(objectPlacementCancelled) = false;
    },
    "",
    "",
    ""
] call EFUNC(actions,addAction);

[
    "vehicleFurniture_menu",
    "Open Vehicle Cargo",
    {[player] call EFUNC(common,nearVehicle) params ["_isNearVehicle"]; _isNearVehicle && isNull objectParent player},
    {
        [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
        [player] call EFUNC(common,nearVehicle) params ["", "_nearestVehicle"];
        [_nearestVehicle] call FUNC(openVehicleInventory);
    },
    "",
    "",
    ""
] call EFUNC(actions,addAction);

if (GVAR(maxCarryMass) isNotEqualTo -1) then {
    call FUNC(encumbered)
};
