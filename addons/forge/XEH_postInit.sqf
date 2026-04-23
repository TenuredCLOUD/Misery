#include "script_component.hpp"

if !(isServer) exitWith {};

GVAR(tracked) = [];

call FUNC(track);

if (isClass (missionConfigFile >> "CfgMisery_ForgeData")) then {
    [] call FUNC(parseData);
    [] call FUNC(burnFuel);

    private _forgeAction = [
        QGVAR(forge_menu),
        localize ECSTRING(common,UseForge),
        QPATHTOEF(icons,data\anvil_ca.paa),
        {
            params ["_target", "_player"];
            createDialog QCLASS(forge_ui);
        },
        {true},
        {},
        ["_target", "_player"],
        [0, 0, 0],
        3
    ] call ace_interact_menu_fnc_createAction;

    [QCLASS(forge), 0, ["ACE_MainActions"], _forgeAction] call ace_interact_menu_fnc_addActionToClass;

} else {
    [QUOTE(COMPONENT_BEAUTIFIED), "CfgMisery_ForgeData class not found in description.ext, skipping data parser..."] call EFUNC(common,debugMessage);
};
