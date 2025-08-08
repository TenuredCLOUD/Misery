#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * Forge Smelting Processor
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_hydrology_fnc_processSmelt;
 *
 * Public: No
*/

private _dialog = findDisplay 982388;
private _selectedItem = lbData [1500, (lbCurSel 1500)];
private _recipe = GVAR(data) select {(_x select 0) isEqualTo _selectedItem} select 0;

private _progressBar = _dialog displayCtrl 1010;

[player] call FUNC(stats) params ["", "_forgeFuel"];

if (isNil "_recipe") exitWith {ctrlSetText [1001, "No matching material found..."];};

private _outputItem = _recipe select 0;
private _requiredItems = _recipe select 1;
private _smeltTime = _recipe select 2;

if !([_requiredItems] call FUNC(canSmeltCheck)) exitWith {
    ctrlSetText [1001, "You don’t have those materials..."];
};

if (_forgeFuel isEqualTo 0) exitWith {
    ctrlSetText [1001, "This forge doesn't have enough fuel to smelt materials..."];
};

{
   findDisplay 982388 displayCtrl _x ctrlShow false;
} forEach [1600, 1602, 1604, 1603];

_progressBar ctrlShow true;

player playAction "Gear";

private _outputDisplayName = getText (configFile >> "CfgWeapons" >> _outputItem >> "displayName");
if (_outputDisplayName isEqualTo "") then {
    _outputDisplayName = getText (configFile >> "CfgMagazines" >> _outputItem >> "displayName");
};
if (_outputDisplayName isEqualTo "") then {
    _outputDisplayName = _outputItem;
};

player setVariable [QGVAR(isSmelting), true];

private _smeltInterrupt = _dialog displayAddEventHandler ["KeyDown", {
    params ["_displayOrControl", "_key"];
    if (_key isEqualTo DIK_ESCAPE) then {
        player setVariable [QGVAR(isSmelting), false];
        _progressBar ctrlShow false;
        [parseText "<t font='PuristaMedium' size='1'>Smelting interrupted...</t>", true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
    };
}];

private _totalSteps = _smeltTime * 2;
private _currentStep = 0;

private _soundDummy = "#particlesource" createVehicleLocal getPosATL player;
_soundDummy say3D QCLASS(audio_sound_metalSmelt);

[{
    params ["_args", "_handle"];
    _args params [
        "_requiredItems",
        "_outputItem",
        "_dialog",
        "_smeltButton",
        "_exitButton",
        "_smeltInterrupt",
        "_totalSteps",
        "_currentStep",
        "_soundDummy",
        "_outputDisplayName",
        "_progressBar"
    ];

    if (!(player getVariable [QGVAR(isSmelting), false]) || !alive player) exitWith {
        if (_soundDummy isNotEqualTo objNull) then {
            deleteVehicle _soundDummy;
        };
        player setVariable [QGVAR(isSmelting), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _smeltInterrupt];
        {
            findDisplay 982388 displayCtrl _x ctrlShow true;
        } forEach [1600, 1602, 1604, 1603];
        _progressBar ctrlShow false;
        _handle call CBA_fnc_removePerFrameHandler;
    };

    _currentStep = _currentStep + 1;
    _args set [7, _currentStep];

    private _progress = (_currentStep / _totalSteps);
    _progressBar progressSetPosition _progress;
    ctrlSetText [1001, format ["Smelting materials... %1%2 complete", (_progress * 100) toFixed 0, "%"]];

    if (_currentStep >= _totalSteps) then {
        {
            private _item = _x select 0;
            private _count = _x select 1;
            for "_j" from 1 to _count do {
                [player, _item] call CBA_fnc_removeItem;
            };
        } forEach _requiredItems;

        [player, _outputItem, true] call CBA_fnc_addItem;

        ctrlSetText [1001, format ["You smelted: %1...", _outputDisplayName]];
        player setVariable [QGVAR(isSmelting), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _smeltInterrupt];
        if (_soundDummy isNotEqualTo objNull) then {
            deleteVehicle _soundDummy;
        };

        {
            findDisplay 982388 displayCtrl _x ctrlShow true;
        } forEach [1600, 1602, 1604, 1603];

        _progressBar ctrlShow false;

        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 0.5, [
    _requiredItems,
    _outputItem,
    _dialog,
    _smeltButton,
    _exitButton,
    _smeltInterrupt,
    _totalSteps,
    _currentStep,
    _soundDummy,
    _outputDisplayName,
    _progressBar
]] call CBA_fnc_addPerFrameHandler;
