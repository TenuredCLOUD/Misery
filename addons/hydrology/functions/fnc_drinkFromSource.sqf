#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * Hydrology Drink from Source Processor
 * Drink from source action with delayed sickness
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_hydrology_fnc_drinkFromSource;
 *
 * Public: No
*/

private _dialog = findDisplay 982380;

private _waterSource = GVAR(lastInteractedSource);
private _sourceID = GVAR(lastInteractedSourceID);

if (isNull _waterSource) exitWith {};

private _rawModel = toLower (getModelInfo _waterSource select 0);
private _cleanModel = (_rawModel splitString ".") select 0;

private _sourceData = GVAR(data) getOrDefault [_cleanModel, createHashMap];
private _maxWaterCapacity = _sourceData getOrDefault ["capacity", 500];

private _currentWaterLevel = missionNamespace getVariable [_sourceID, _maxWaterCapacity];

private _drinkAmount = 0.5; // half Liter consumed per drink action

if (_currentWaterLevel < _drinkAmount) exitWith {
    ctrlSetText [1001, localize LSTRING(WaterSourceEmpty)];
};

[_sourceID, _drinkAmount, _maxWaterCapacity] call FUNC(syncWaterSource);

[982380, [1600, 1601, 1602], false] call EFUNC(common,displayShowControls);

ACE_player switchMove QACEGVAR(field_rations,drinkFromSourceLow);

playSound QCLASS(audio_sound_drink);

[0.5, "thirst"] call EFUNC(common,addStatusModifier);

[0.015, "radiation"] call EFUNC(common,addStatusModifier);

if ([EGVAR(survival,turbidWaterChance)] call EFUNC(common,rollChance)) then {
    [0.01, "parasites"] call EFUNC(common,addStatusModifier);
};

[982380, [1600, 1601, 1602], true] call EFUNC(common,displayShowControls);
