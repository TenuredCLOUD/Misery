#include "script_component.hpp"

if (!isServer) exitWith {};

private _miningEnabled = isClass (missionConfigFile >> "CfgMisery_MiningData");

if (_miningEnabled) then {
    [] call FUNC(parseData);
} else {
    [QUOTE(COMPONENT_BEAUTIFIED), "CfgMisery_MiningData class not found in description.ext, skipping data parser..."] call EFUNC(common,debugMessage);
};

if (_miningEnabled) then {
    private _mineOreAction = [
        QGVAR(searchObject_menu),
        localize ECSTRING(common,MineOre),
        QPATHTOEF(icons,data\pickaxe_ca.paa),
        {
            [player] call FUNC(condition) params ["_found", "_miningObject", "_objectData"];
            [_found, _miningObject, _objectData] call FUNC(action);
        },
        {
            [player] call FUNC(condition) select 0
        }
    ] call ACEFUNC(interact_menu,createAction);

    [player, 1, [QUOTE(ACE_SelfActions)], _mineOreAction] call ACEFUNC(interact_menu,addActionToObject);
};

