#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Syncs water source across network
 *
 * Arguments:
 * 0: Source <OBJECT>
 * 1: Drained amount <NUMBER>
 * 2: Max capacity of source <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_hydrology_fnc_applySourceStates;
 *
 * Public: No
*/

params ["_sourceID", "_drainedAmount", "_maxWaterCapacity"];

if (_drainedAmount <= 0) exitWith {};

private _liveWater = missionNamespace getVariable [_sourceID, _maxWaterCapacity];
private _finalWater = (_liveWater - _drainedAmount) max 0;

missionNamespace setVariable [_sourceID, _finalWater, true];

private _masterWaterMap = missionNamespace getVariable [QGVAR(wellStates), createHashMap];

_masterWaterMap set [_sourceID, _finalWater];

missionNamespace setVariable [QGVAR(wellStates), _masterWaterMap, true];
