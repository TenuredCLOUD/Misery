#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Populates fire crafting GUI combo boxes and updates fuel progress bar
 *
 * Arguments:
 * 0: Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [findDisplay 982388] call misery_fire_fnc_populate
 */

[{!isNull findDisplay 982388},
{

private _tinderCombo = findDisplay 982388 displayCtrl 2100;
private _fuelCombo = findDisplay 982388 displayCtrl 2101;
private _ignitionCombo = findDisplay 982388 displayCtrl 2102;
private _craftProgressBar = findDisplay 982388 displayCtrl 1010;
private _noteBox = findDisplay 982388 displayCtrl 1001;

_craftProgressBar ctrlShow false;

lbClear _tinderCombo;
lbClear _fuelCombo;
lbClear _ignitionCombo;

// Populate tinder
{
    private _displayName = getText (configFile >> "CfgWeapons" >> _x >> "displayName");
    if (_displayName == "") then {
        _displayName = getText (configFile >> "CfgMagazines" >> _x >> "displayName");
    };
    if (_x in items player || _x in magazines player) then {
        private _index = _tinderCombo lbAdd _displayName;
        _tinderCombo lbSetData [_index, _x];
    };
} forEach [MACRO_FIRE_TINDER];

// Populate fuel
private _fuelItems = [MACRO_FIRE_FUEL];
private _nearbyFire = objNull;
private _nearbyType = "";
{
    if (player distance (_x select 0) < 2.5 && !inflamed (_x select 0) && {_x select 1 in ["big", "barrel"]}) exitWith {
        _nearbyFire = _x select 0;
        _nearbyType = _x select 1;
    };
} forEach GVAR(activeFires);

// Check untracked unlit fires
if (isNull _nearbyFire) then {
    private _nearbyObjects = nearestObjects [player, ["Fireplace_base_F", "Land_Fire_barrel_F"], 2.5];
    {
        if (!inflamed _x) exitWith {
            _nearbyFire = _x;
            _nearbyType = switch (true) do {
                case (_x isKindOf "Land_Fire_barrel_F"): {"barrel"};
                case (_x isKindOf "Land_Campfire_F" || _x isKindOf "Campfire_burning_F"): {"big"};
                default {"small"};
            };
        };
    } forEach _nearbyObjects;
};

if (!isNull _nearbyFire && {QCLASS(firewood) in items player} && {_nearbyType in ["big", "barrel"]}) then {
    _fuelItems pushBackUnique QCLASS(firewood);
};
{
    private _displayName = getText (configFile >> "CfgWeapons" >> _x >> "displayName");
    if (_x in items player) then {
        private _index = _fuelCombo lbAdd _displayName;
        _fuelCombo lbSetData [_index, _x];
    };
} forEach _fuelItems;

// Populate ignition
{
    private _displayName = getText (configFile >> "CfgWeapons" >> _x >> "displayName");
    if (_displayName == "") then {
        _displayName = getText (configFile >> "CfgMagazines" >> _x >> "displayName");
    };
    if (_x in items player || _x in magazines player) then {
        private _index = _ignitionCombo lbAdd _displayName;
        _ignitionCombo lbSetData [_index, _x];
    };
} forEach [MACRO_FIRE_IGNITION];

_tinderCombo lbSetCurSel 0;
_fuelCombo lbSetCurSel 0;
_ignitionCombo lbSetCurSel 0;

}, []] call CBA_fnc_waitUntilAndExecute;
