#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * Anvil recipe Processor
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_anvil_fnc_process;
 *
 * Public: No
*/

private _dialog = findDisplay 274840;
private _selectedItem = lbData [1500, (lbCurSel 1500)];
private _recipe = GVAR(data) select {(_x select 0) isEqualTo _selectedItem} select 0;

private _progressBar = _dialog displayCtrl 1010;

[player] call FUNC(nearestForgeStats) params ["_closestForge", "_forgeFuel"];

if (isNil "_recipe") exitWith {ctrlSetText [1001, "No matching material found..."]};

private _outputItem = _recipe select 0;
private _requiredItems = _recipe select 1;
private _smeltTime = _recipe select 2;

if !([_requiredItems] call FUNC(canProcessCheck)) exitWith {
    ctrlSetText [1001, "You don’t have those materials..."];
};

if (isNull _closestForge) exitWith {
    ctrlSetText [1001, "You need a forge near your anvil in order to smith items..."];
};

if (_forgeFuel isEqualTo 0) exitWith {
    ctrlSetText [1001, "Nearest forge doesn't have enough fuel to reheat ingots..."];
};

if !([[MACRO_ANVIL_HAMMERS]] call EFUNC(common,hasItem)) exitWith {ctrlSetText [1001, "You need a hammer to process ingots..."]};

[274840, [1600, 1602, 1603], false] call EFUNC(common,displayEnableControls);

[274840, [1010], true] call EFUNC(common,displayShowControls);

player playAction "Gear";

[_outputItem] call EFUNC(common,getItemData) params ["_displayName"];

player setVariable [QGVAR(isSmithing), true];

private _smithInterrupt = _dialog displayAddEventHandler ["KeyDown", {
    params ["_displayOrControl", "_key"];
    if (_key isEqualTo DIK_ESCAPE) then {
        player setVariable [QGVAR(isSmithing), false];
        [274840, [1010], false] call EFUNC(common,displayShowControls);
        [parseText "<t font='PuristaMedium' size='1'>Smithing interrupted...</t>", true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
    };
}];

private _totalSteps = _smeltTime * 2;
private _currentStep = 0;

private _soundDummy = "#particlesource" createVehicleLocal getPosATL player;
_soundDummy say3D QCLASS(audio_sound_anvilHammer);

[{
    params ["_args", "_handle"];
    _args params [
        "_requiredItems",
        "_outputItem",
        "_dialog",
        "_smithInterrupt",
        "_totalSteps",
        "_currentStep",
        "_soundDummy",
        "_displayName",
        "_progressBar"
    ];

    if (!(player getVariable [QGVAR(isSmithing), false]) || !alive player) exitWith {
        if (_soundDummy isNotEqualTo objNull) then {
            deleteVehicle _soundDummy;
        };
        player setVariable [QGVAR(isSmithing), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _smithInterrupt];
        [274840, [1600, 1602, 1603], true] call EFUNC(common,displayEnableControls);
        [274840, [1010], false] call EFUNC(common,displayShowControls);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    _currentStep = _currentStep + 1;
    _args set [5, _currentStep];

    private _progress = (_currentStep / _totalSteps);
    _progressBar progressSetPosition _progress;
    ctrlSetText [1001, format ["Smithing materials... %1%2 complete", (_progress * 100) toFixed 0, "%"]];

    if (_currentStep >= _totalSteps) then {
        {
            private _item = _x select 0;
            private _count = _x select 1;
            for "_j" from 1 to _count do {
                [player, _item] call CBA_fnc_removeItem;
            };
        } forEach _requiredItems;

        [player, _outputItem, true] call CBA_fnc_addItem;

        ctrlSetText [1001, format ["You successfully smithed: %1...", _displayName]];
        player setVariable [QGVAR(isSmithing), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _smithInterrupt];
        if (_soundDummy isNotEqualTo objNull) then {
            deleteVehicle _soundDummy;
        };

        [274840, [1600, 1602, 1603], true] call EFUNC(common,displayEnableControls);
        [274840, [1010], false] call EFUNC(common,displayShowControls);

        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 0.5, [
    _requiredItems,
    _outputItem,
    _dialog,
    _smithInterrupt,
    _totalSteps,
    _currentStep,
    _soundDummy,
    _displayName,
    _progressBar
]] call CBA_fnc_addPerFrameHandler;
