#include "script_component.hpp"

if (!hasInterface) exitWith {};

if (isClass (missionConfigFile >> "CfgMisery_MiningData")) then {

    ["CBA_loadingScreenDone", {

        [QCLASSACE(interactMenuOpened), {
            params ["_type"];
            if (_type isNotEqualTo 0) exitWith {};

            [] call FUNC(condition) params ["_found"];

            if !(_found) exitWith {};

            [] call FUNC(interaction);
        }] call CBA_fnc_addEventHandler;

        [QCLASSACE(interactMenuClosed), {
            if (!isNull GVAR(activeLogic)) then {
                [GVAR(activeLogic), 0, [QUOTE(ACE_MainActions), QGVAR(mineOre_menu)]] call ACEFUNC(interact_menu,removeActionFromObject);
                deleteVehicle GVAR(activeLogic);
                GVAR(activeLogic) = objNull;
            };
        }] call CBA_fnc_addEventHandler;
    }] call CBA_fnc_addEventHandler;
};
