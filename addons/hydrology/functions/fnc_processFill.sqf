#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * Hydrology Fill Processor
 * Fills selected container from GUI using PFH for scheduled execution
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_hydrology_fnc_processFill;
 *
 * Public: No
*/

private _dialog = findDisplay 982380;
private _selectedItem = lbData [1500, (lbCurSel 1500)];

private _waterSource = GVAR(lastInteractedSource);
private _sourceID = GVAR(lastInteractedSourceID);

if (isNull _waterSource) exitWith {};

private _rawModel = toLower (getModelInfo _waterSource select 0);

// strip .p3d extension off comparison
private _cleanModel = (_rawModel splitString ".") select 0;

private _sourceData = GVAR(data) getOrDefault [_cleanModel, createHashMap];
private _recipesMap = _sourceData getOrDefault ["recipes", createHashMap];
private _recipe = _recipesMap getOrDefault [_selectedItem, createHashMap];

if (_recipe isEqualTo createHashMap) exitWith {
    ctrlSetText [1001, localize LSTRING(NoMatchingContainer)];
};

private _requiredItem = _recipe getOrDefault ["required", _selectedItem];
private _outputItem = _recipe getOrDefault ["output", ""];
private _waterAmount = _recipe getOrDefault ["waterAmount", 1];
private _fillingTime = _recipe getOrDefault ["fillingTime", 5];
private _audio = _recipe getOrDefault ["audio", ""];

private _progressBar = _dialog displayCtrl 1010;

if !([[_requiredItem]] call EFUNC(common,hasItem)) exitWith {
    ctrlSetText [1001, localize LSTRING(MissingContainer)];
};

private _maxWaterCapacity = _sourceData getOrDefault ["capacity", 500];
private _currentWaterLevel = missionNamespace getVariable [_sourceID, _maxWaterCapacity];

if (_currentWaterLevel < _waterAmount) exitWith {
    ctrlSetText [1001, format [localize LSTRING(NotEnoughWater), _waterAmount, _currentWaterLevel toFixed 1]];
};

[982380, [1600, 1601, 1602], false] call EFUNC(common,displayShowControls);
[982380, [1010], true] call EFUNC(common,displayShowControls);

[ACE_player, "Gear"] call ACEFUNC(common,doAnimation);

if (_audio isNotEqualTo "") then {
    playSound3D [_audio, ACE_player, false, getPosASL ACE_player, 4, 1, 10];
};

[_outputItem] call EFUNC(common,getItemData) params ["_displayName"];

ACE_player setVariable [QCLASS(isFilling), true];

private _fillInterrupt = _dialog displayAddEventHandler ["KeyDown", {
    params ["_displayOrControl", "_key"];
    if (_key isEqualTo DIK_ESCAPE) then {
        ACE_player setVariable [QCLASS(isFilling), false];
        [982380, [1010], false] call EFUNC(common,displayShowControls);
        [QEGVAR(common,tileText), localize LSTRING(Interrupted)] call CBA_fnc_localEvent;

        // create simple water spill effect
        private _waterSpillPos = getPosASL ACE_player;
        _waterSpillPos set [2, getTerrainHeightASL _waterSpillPos];

        private _waterSpill = createSimpleObject ["WaterSpill_01_Small_New_F", _waterSpillPos];
        _waterSpill setVectorUp surfaceNormal _waterSpillPos;

        if (isClass (missionConfigFile >> "CfgGradPersistence")) then {
            [_waterSpill] call GRADFUNC(persistence,blacklistObjects);
        };

        [{
            deleteVehicle _this;
        }, _waterSpill, 15] call CBA_fnc_waitAndExecute;
    };
}];

private _totalSteps = _fillingTime * 2;
private _waterPerStep = _waterAmount / _totalSteps;
private _currentStep = 0;
private _drainedAmount = 0;

[{
    params ["_args", "_handle"];
    _args params [
        "_requiredItem",
        "_outputItem",
        "_dialog",
        "_fillInterrupt",
        "_totalSteps",
        "_currentStep",
        "_displayName",
        "_progressBar",
        "_sourceID",
        "_waterPerStep",
        "_maxWaterCapacity",
        "_drainedAmount"
    ];

    if (!(ACE_player getVariable [QCLASS(isFilling), false]) || !alive ACE_player) exitWith {
        ACE_player setVariable [QCLASS(isFilling), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _fillInterrupt];
        [982380, [1600, 1601, 1602], true] call EFUNC(common,displayShowControls);
        [982380, [1010], false] call EFUNC(common,displayShowControls);

        [_sourceID, _drainedAmount, _maxWaterCapacity] call FUNC(syncWaterSource);

        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    private _liveWater = missionNamespace getVariable [_sourceID, _maxWaterCapacity];

    if ((_liveWater - _drainedAmount) <= 0) exitWith {
        ctrlSetText [1001, localize LSTRING(WaterSourceEmpty)];
        ACE_player setVariable [QCLASS(isFilling), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _fillInterrupt];
        [982380, [1600, 1601, 1602], true] call EFUNC(common,displayShowControls);
        [982380, [1010], false] call EFUNC(common,displayShowControls);

        [_sourceID, _drainedAmount, _maxWaterCapacity] call FUNC(syncWaterSource);;

        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    _currentStep = _currentStep + 1;
    _drainedAmount = _drainedAmount + _waterPerStep;

    _args set [5, _currentStep];
    _args set [11, _drainedAmount];

    private _progress = (_currentStep / _totalSteps);
    _progressBar progressSetPosition _progress;
    ctrlSetText [1001, format [localize LSTRING(FillingProgress), (_progress * 100) toFixed 0, "%"]];

    if (_currentStep >= _totalSteps) then {
        [ACE_player, _requiredItem] call CBA_fnc_removeItem;
        [ACE_player, _outputItem, true] call CBA_fnc_addItem;

        ctrlSetText [1001, format [localize LSTRING(FilledSuccess), _displayName]];

        ACE_player setVariable [QCLASS(isFilling), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _fillInterrupt];
        [982380, [1600, 1601, 1602], true] call EFUNC(common,displayShowControls);
        [982380, [1010], false] call EFUNC(common,displayShowControls);

        [_sourceID, _drainedAmount, _maxWaterCapacity] call FUNC(syncWaterSource);;

        [_handle] call CBA_fnc_removePerFrameHandler;
    };
}, 0.5, [
    _requiredItem,
    _outputItem,
    _dialog,
    _fillInterrupt,
    _totalSteps,
    _currentStep,
    _displayName,
    _progressBar,
    _sourceID,
    _waterPerStep,
    _maxWaterCapacity,
    _drainedAmount
]] call CBA_fnc_addPerFrameHandler;
