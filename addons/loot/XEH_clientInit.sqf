#include "script_component.hpp"

if (!hasInterface) exitWith {};

// Grab nearby building positions in 100m and cache them as used so no loot generates infront of player on spawn / reload inside buildings
if (isClass (missionConfigFile >> "CfgMisery_LootData")) then {
    [{EGVAR(persistence,clientLoaded)}, {
        [ACE_player, 100] call EFUNC(common,nearBuilding) params ["", "", "_nearBuildings"];
        private _toCache = [];

        {
            _toCache pushBackUnique _x;
        } forEach _nearBuildings;

        GVAR(building_used) append _toCache;

        publicVariableServer QGVAR(building_used);
    }, []] call CBA_fnc_waitUntilAndExecute;
};

if (isClass (missionConfigFile >> "CfgMisery_SearchableObjects")) then {

    ["CBA_loadingScreenDone", {

        [QCLASSACE(interactMenuOpened), {
            params ["_type"];
            if (_type isNotEqualTo 0) exitWith {};

            [] call FUNC(searchCondition) params ["_found"];

            if !(_found) exitWith {};

            [] call FUNC(searchInteraction);
        }] call CBA_fnc_addEventHandler;

        [QCLASSACE(interactMenuClosed), {
            if (!isNull GVAR(activeLogic)) then {
                [GVAR(activeLogic), 0, [QUOTE(ACE_MainActions), QGVAR(searchObject_menu)]] call ACEFUNC(interact_menu,removeActionFromObject);
                deleteVehicle GVAR(activeLogic);
                GVAR(activeLogic) = objNull;
            };
        }] call CBA_fnc_addEventHandler;
    }] call CBA_fnc_addEventHandler;
};
