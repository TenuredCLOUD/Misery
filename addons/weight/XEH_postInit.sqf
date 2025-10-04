#include "script_component.hpp"

if !(GVAR(action)) exitWith {};

[
    "weightCheck_menu",
    localize "STR_MISERY_CheckGearweight",
    {true},
    {
        private _bagweightload = loadAbs player / getNumber (configFile >> "CfgInventoryGlobalVariable" >> "maxSoldierLoad");
        [QEGVAR(common,inventoryTile), [format [localize "STR_MISERY_GearweightVAL", round(_bagweightload * 100), round((_bagweightload * 100) / 2.2)], 5]] call CBA_fnc_localEvent;
    },
    "",
    "",
    ""
] call EFUNC(actions,addAction);

