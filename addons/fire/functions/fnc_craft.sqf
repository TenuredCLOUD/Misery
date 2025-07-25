#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * Handles fire crafting and reignition via GUI with progress bar
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fire_fnc_craft
 */

private _display = findDisplay 982388;
private _tinderCombo = _display displayCtrl 2100;
private _fuelCombo = _display displayCtrl 2101;
private _ignitionCombo = _display displayCtrl 2102;
private _noteBox = _display displayCtrl 1001;
private _progressBar = _display displayCtrl 1010;

private _tinder = _tinderCombo lbData (lbCurSel _tinderCombo);
private _fuel = _fuelCombo lbData (lbCurSel _fuelCombo);
private _ignition = _ignitionCombo lbData (lbCurSel _ignitionCombo);

call EFUNC(common,nearFire) params ["_nearbyFireObjects", "_nearbyIsInflamed"];

if (_tinder isEqualTo "") exitWith {
    _noteBox ctrlSetText "Select tinder source...";
};

if (_ignition isEqualTo "") exitWith {
    _noteBox ctrlSetText "Select ignition source...";
};

private _nearbyFire = objNull;
private _isReignition = false;
private _fireIndex = -1;
private _fuelType = "";
{
    if (player distance (_x select 0) < 2.5 && !inflamed (_x select 0)) exitWith {
        _nearbyFire = _x select 0;
        _isReignition = true;
        _fireIndex = _forEachIndex;
        _fuelType = _x select 1;
    };
} forEach GVAR(activeFires);

if (isNull _nearbyFire) then {
    {
        if (!_nearbyIsInflamed) exitWith {
            _nearbyFire = _x;
            _isReignition = true;
            _fuelType = switch (true) do {
                case (_x isKindOf "Land_MetalBarrel_F" || _x isKindOf "MetalBarrel_burning_F"): {"barrel"};
                case (_x isKindOf "Land_Campfire_F" || _x isKindOf "Campfire_burning_F"): {"big"};
                default {"small"};
            };
        };
    } forEach _nearbyFireObjects;
};

switch (true) do {
    case (!_isReignition && _fuel isEqualTo ""): {
        _noteBox ctrlSetText "Select fuel for new fire...";
    };
    case (!_isReignition && !(_fuel in [MACRO_FIRE_FUEL])): {
        _noteBox ctrlSetText "Invalid fuel for new fire...";
    };
    case (_isReignition && _fuel != "" && _fuelType in ["big", "barrel"] && _fuel != QCLASS(firewood)): {
        _noteBox ctrlSetText "Use firewood to refuel this fire...";
    };
};

// Disable buttons and show progress bar
{
    _display displayCtrl _x ctrlEnable false;
} forEach [1600, 1601, 1602];

_progressBar ctrlShow true;

// Determine fuel type for new fires
if (!_isReignition) then {
    _fuelType = ["small", "big"] select (_fuel isEqualTo QCLASS(firewood));
};

[QUOTE(COMPONENT_BEAUTIFIED), format ["Crafting fire: isReignition=%1, nearbyFire=%2, fireIndex=%3, fuelType=%4", _isReignition, _nearbyFire, _fireIndex, _fuelType]] call EFUNC(common,debugMessage);

// Play ignition sound
private _ignitionSound = ["\z\misery\addons\audio\sounds\immersion\Match.ogg", "\z\misery\addons\audio\sounds\immersion\Lighter.ogg"] select ([MACRO_FIRE_IGNITION] find _ignition);

playSound3D [_ignitionSound, player, false, getPosASL player, 4, 1, 10];

player playAction "Gear";

player setVariable [QCLASS(isCraftingFire), true];

// Interrupt handler
private _craftInterrupt = _display displayAddEventHandler ["KeyDown", {
    params ["_displayOrControl", "_key"];
    if (_key isEqualTo DIK_ESCAPE) then {
        player setVariable [QCLASS(isCraftingFire), false];
        [parseText "<t font='PuristaMedium' size='1'>Fire crafting interrupted...</t>", true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
    };
}];

private _craftingTime = [5, 10, 15] select (["small", "big", "barrel"] find _fuelType);
if (rain > 0.3 && insideBuilding player isEqualTo 0) then {
    _craftingTime = _craftingTime * 1.5;
};

private _totalSteps = _craftingTime * 2;

private _currentStep = 0;

[{
    params ["_args", "_handle"];
    _args params [
        "_display",
        "_progressBar",
        "_noteBox",
        "_tinder",
        "_fuel",
        "_ignition",
        "_isReignition",
        "_nearbyFire",
        "_fireIndex",
        "_fuelType",
        "_craftInterrupt",
        "_totalSteps",
        "_currentStep"
    ];

    if (!(player getVariable [QCLASS(isCraftingFire), false]) || !alive player) exitWith {
        player setVariable [QCLASS(isCraftingFire), nil];
        _display displayRemoveEventHandler ["KeyDown", _craftInterrupt];
        {
            _display displayCtrl _x ctrlEnable true;
        } forEach [1600, 1601, 1602];
        [player, _tinder] call CBA_fnc_removeItem;
        [_ignition] call EFUNC(common,itemDecrement);
        _noteBox ctrlSetText "Fire crafting interrupted, tinder lost...";
        call FUNC(populate);
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    _currentStep = _currentStep + 1;

    _args set [12, _currentStep];

    private _progress = (_currentStep / _totalSteps);

    _progressBar progressSetPosition _progress;

    _noteBox ctrlSetText format ["Crafting %1 fire... %2%3 complete", _fuelType, (_progress * 100) toFixed 0, "%"];

    if (_currentStep >= _totalSteps) then {

        private _isSuccessful = round random 10 > 1;

    // Rain check & chance to fail:
        if (rain > 0.3) then {
            _isSuccessful = _isSuccessful && round random 10 > 5;
        };

    // Tinder and ignition source depletion:
        [player, _tinder] call CBA_fnc_removeItem;
        [_ignition] call EFUNC(common,itemDecrement);

        if (_isSuccessful) then {
            if (_isReignition) then {
                [_nearbyFire, _fuel, _fuelType, _fireIndex, _noteBox] call FUNC(reignite);
            } else {
                [_fuel, _fuelType, _noteBox] call FUNC(createObject);
            };
        } else {
            _noteBox ctrlSetText "Failed to craft fire...";
        };

        player setVariable [QCLASS(isCraftingFire), nil];
        _display displayRemoveEventHandler ["KeyDown", _craftInterrupt];
        {
            _display displayCtrl _x ctrlEnable true;
        } forEach [1600, 1601, 1602];
        call FUNC(populate);
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
}, 1, [
    _display,
    _progressBar,
    _noteBox,
    _tinder,
    _fuel,
    _ignition,
    _isReignition,
    _nearbyFire,
    _fireIndex,
    _fuelType,
    _craftInterrupt,
    _totalSteps,
    _currentStep
]] call CBA_fnc_addPerFrameHandler;
