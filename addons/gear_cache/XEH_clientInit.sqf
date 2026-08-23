#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(activeLogic) = objNull;

["CBA_loadingScreenDone", {

    [QCLASSACE(interactMenuOpened), {
        params ["_type"];
        if (_type isNotEqualTo 0) exitWith {};

        [ACE_player] call FUNC(condition) params ["_found"];

        if !(_found) exitWith {};

        [] call FUNC(interaction);
    }] call CBA_fnc_addEventHandler;

    [QCLASSACE(interactMenuClosed), {
        if (!isNull GVAR(activeLogic)) then {
            [GVAR(activeLogic), 0, [QUOTE(ACE_MainActions), QGVAR(cache_menu)]] call ACEFUNC(interact_menu,removeActionFromObject);
            deleteVehicle GVAR(activeLogic);
            GVAR(activeLogic) = objNull;
        };
    }] call CBA_fnc_addEventHandler;
}] call CBA_fnc_addEventHandler;
