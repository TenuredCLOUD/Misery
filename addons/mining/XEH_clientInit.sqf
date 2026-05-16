#include "script_component.hpp"

if (!hasInterface) exitWith {};

if (isClass (missionConfigFile >> "CfgMisery_MiningData")) then {

    [QCLASSACE(interactMenuOpened), {
        params ["_type"];
        if (_type isNotEqualTo 0) exitWith {};

        [] call FUNC(interaction);
    }] call CBA_fnc_addEventHandler;
};
