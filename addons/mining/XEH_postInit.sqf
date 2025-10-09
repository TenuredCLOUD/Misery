#include "script_component.hpp"

if (!isServer) exitWith {};

private _miningEnabled = isClass (missionConfigFile >> "CfgMisery_MiningData");

if (_miningEnabled) then {
    [] call FUNC(parseData);
} else {
    [QUOTE(COMPONENT_BEAUTIFIED), "CfgMisery_MiningData class not found in description.ext, skipping data parser..."] call EFUNC(common,debugMessage);
};

if (_miningEnabled) then {
    [
        "mineOre_menu",
        "Mine ore",
        {
            [player] call FUNC(condition) select 0
        },
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            [player] call FUNC(condition) params ["_found", "_miningObject", "_objectData"];
            [_found, _miningObject, _objectData] call FUNC(action);
        },
        "",
        QPATHTOEF(icons,data\pickaxe_ca.paa),
        ""
    ] call EFUNC(actions,addAction);
};

