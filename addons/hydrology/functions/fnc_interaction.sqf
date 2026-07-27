#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Add dynamic action to water sources
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_hydrology_fnc_interaction;
 *
*/

[] call FUNC(condition) params ["_found", "_waterObject", "_sourceData", "_hitPos"];

if (_found) then {

    GVAR(activeLogic) = "ACE_LogicDummy" createVehicleLocal [0, 0, 0];

    private _sourcePos = getPosWorld _waterObject;

    private _zOffset = _sourceData getOrDefault ["zOffset", 0];

    // If zOffset is set in config, make interaction logic float above initial position (needed for some models)
    if (_zOffset isNotEqualTo 0) then {
        _sourcePos set [2, (_sourcePos select 2) + _zOffset];
    };

    GVAR(activeLogic) setPosWorld _sourcePos;

    private _sourceID = format [QGVAR(waterSourceLogic_%1), _sourcePos];

    GVAR(activeLogic) setVariable [QGVAR(sourceID), _sourceID];

    GVAR(activeLogic) setVariable [QGVAR(targetObject), _waterObject];

    private _maxCapacity = _sourceData getOrDefault ["capacity", 500];

    private _masterWaterMap = missionNamespace getVariable [QGVAR(wellStates), createHashMap];

    if !(_sourceID in _masterWaterMap) then {
        _masterWaterMap set [_sourceID, _maxCapacity];
        missionNamespace setVariable [QGVAR(wellStates), _masterWaterMap, true];
    };

    private _currentCapacity = _masterWaterMap getOrDefault [_sourceID, _maxCapacity];

    missionNamespace setVariable [_sourceID, _currentCapacity, true];

    private _action = [
        QGVAR(hydrology_menu),
        localize LSTRING(Action),
        QPATHTOEF(icons,data\waves_arrow_up_ca.paa),
        {
            params ["_target", "", "_params"];
            _params params ["_found", "_waterObject", "_sourceData", "_sourceID"];

            GVAR(lastInteractedSource) = _waterObject;
            GVAR(lastInteractedSourceID) = _sourceID;

            if (createDialog QCLASS(hydrology_ui)) then {
                private _recipes = _sourceData getOrDefault ["recipes", createHashMap];

                [_recipes] call FUNC(containersListed);
            };
        },
        {true},
        {},
        [_found, _waterObject, _sourceData, _sourceID],
        [0, 0, 0],
        5
    ] call ACEFUNC(interact_menu,createAction);

    private _checkAction = [
        QGVAR(checkSource_menu),
        localize LSTRING(CheckWaterLevel),
        QPATHTOEF(icons,data\droplets_ca.paa),
        {
            params ["_target", "", "_params"];
            _params params ["_waterObject", "_sourceData", "_sourceID"];

            private _maxCap = _sourceData getOrDefault ["capacity", 500];
            private _currentCap = missionNamespace getVariable [_sourceID, _maxCap];

            private _msg = format [localize LSTRING(WaterRemaining), _currentCap, _maxCap];
            [[_msg, 1, [1, 1, 1, 1]], [], true] call CBA_fnc_notify;
        },
        {true},
        {},
        [_waterObject, _sourceData, _sourceID],
        [0, 0, 0],
        5
    ] call ACEFUNC(interact_menu,createAction);

    [GVAR(activeLogic), 0, [QUOTE(ACE_MainActions)], _action] call ACEFUNC(interact_menu,addActionToObject);
    [GVAR(activeLogic), 0, [QUOTE(ACE_MainActions)], _checkAction] call ACEFUNC(interact_menu,addActionToObject);
};
