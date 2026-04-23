#include "script_component.hpp"

if !(isServer) exitWith {};

if !(isClass (missionConfigFile >> "CfgMisery_ForgeData")) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), "CfgMisery_ForgeData class not found in description.ext, skipping loading of anvil / smithing framework..."] call EFUNC(common,debugMessage);
};

if (isClass (missionConfigFile >> "CfgMisery_AnvilData")) then {
    [] call FUNC(parseData);

    private _anvilAction = [
        QGVAR(anvil_menu),
        localize ECSTRING(common,UseAnvil),
        QPATHTOEF(icons,data\anvil_ca.paa),
        {
            params ["_target", "_player"];
            createDialog QCLASS(anvil_ui);
        },
        {true},
        {},
        ["_target", "_player"],
        [0, 0, 0],
        3
    ] call ace_interact_menu_fnc_createAction;

    [QCLASS(anvil), 0, ["ACE_MainActions"], _anvilAction] call ace_interact_menu_fnc_addActionToClass;
} else {
    [QUOTE(COMPONENT_BEAUTIFIED), "CfgMisery_AnvilData class not found in description.ext, skipping data parser..."] call EFUNC(common,debugMessage);
};
