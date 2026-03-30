#include "script_component.hpp"

if !(GVAR(action)) exitWith {};

[
    "weightCheck_menu",
    localize ECSTRING(common,CheckGearWeight),
    {true},
    {
        private _bagweightload = loadAbs player / getNumber (configFile >> "CfgInventoryGlobalVariable" >> "maxSoldierLoad");
        [QEGVAR(common,inventoryTile), [format [localize ECSTRING(common,GearWeightVal), round(_bagweightload * 100), round((_bagweightload * 100) / 2.2)], 5]] call CBA_fnc_localEvent;
    },
    "",
    QPATHTOEF(icons,data\weight_tilde_ca.paa),
    ""
] call EFUNC(actions,addAction);

