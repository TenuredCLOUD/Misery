#include "script_component.hpp"

if !(isServer) exitWith {};

GVAR(tracked) = [];

call FUNC(track);

if (isClass (missionConfigFile >> "CfgMisery_ForgeData")) then {
    [] call FUNC(parseData);
    [] call FUNC(burnFuel);

    private _forgeAction = [
        QGVAR(forge_menu),
        localize LSTRING(Action),
        QPATHTOEF(icons,data\anvil_ca.paa),
        {
            params ["_target", "_player"];
            createDialog QCLASS(forge_ui);
        },
        {true},
        {},
        ["_target", "_player"],
        [0, 1, -1.3],
        3
    ] call ACEFUNC(interact_menu,createAction);

    [QCLASS(forge), 0, [], _forgeAction] call ACEFUNC(interact_menu,addActionToClass);

} else {
    [QUOTE(COMPONENT_BEAUTIFIED), "CfgMisery_ForgeData class not found in description.ext, skipping data parser..."] call EFUNC(common,debugMessage);
};

[{CBA_missionTime > 5}, {

    if (EGVAR(audio,forgeAmbience)) then {
        call FUNC(initAudio);
    };
}, []] call CBA_fnc_waitUntilAndExecute;
