#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, Drongo
 * Calculates clothing warmth for temperature core
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * 0: Array of Variables <ARRAY>
 *     0: Total warmth (0–50) <NUMBER>
 *     1: Individual contributions per clothing piece <ARRAY>
 *     2: Debug string <STRING>
 *
 * Example:
 * [player] call misery_temperature_fnc_clothing;
 *
 * Public: No
*/

params [["_unit", player]];

private _uniformWarmth = 0;
private _vestWarmth = 0;
private _headgearWarmth = 0;
private _facewearWarmth = 0;

private _uniformMass = getNumber (configFile >> "CfgWeapons" >> (uniform _unit) >> "ItemInfo" >> "mass");
private _vestMass = getNumber (configFile >> "CfgWeapons" >> (vest _unit) >> "ItemInfo" >> "mass");
private _headgearMass = getNumber (configFile >> "CfgWeapons" >> (headgear _unit) >> "ItemInfo" >> "mass");
private _facewearMass = getNumber (configFile >> "CfgGlasses" >> (goggles _unit) >> "ItemInfo" >> "mass");

if (_uniformMass > 0) then {
    _uniformWarmth = (_uniformMass / 4) min 15;
    if (((toLower (uniform _unit)) find "ghillie") > -1) then {
        _uniformWarmth = (_uniformWarmth * 1.5) min 25;
        };
    if (((toLower (uniform _unit)) find "gorka") > -1) then {
        _uniformWarmth = (_uniformWarmth * 1.5) min 25;
        };
    if (((toLower (uniform _unit)) find "wetsuit") > -1) then {
        _uniformWarmth = (_uniformWarmth * 1.3) min 20;
        };
};

if (_vestMass > 0) then {
    _vestWarmth = (_vestMass / 6) min 15;
};

if (_headgearMass > 0) then {
    _headgearWarmth = (_headgearMass / 8) min 4;
    if (((((((toLower (headgear _unit)) find "watchcap") > -1) || ((toLower (headgear _unit)) find "ushanka") > -1) || ((toLower (headgear _unit)) find "bala") > -1) || ((toLower (headgear _unit)) find "shem") > -1)) then {
        _headgearWarmth = (_headgearWarmth * 1.5) min 7;
    };
};

if (_facewearMass > 0) then {
    _facewearWarmth = (_facewearMass / 10) min 2;
    if (((((toLower (goggles _unit)) find "bala") > -1) || ((toLower (goggles _unit)) find "shem") > -1)) then {
        _facewearWarmth = (_facewearWarmth * 1.5) min 3;
    };
};

private _warmth = (_uniformWarmth + _vestWarmth + _headgearWarmth + _facewearWarmth) min 50;

private _text = format ["Uniform: %1  Vest: %2  Headwear: %3  Facewear: %4", round _uniformWarmth, round _vestWarmth, round _headgearWarmth, round _facewearWarmth];

[_warmth, [_uniformWarmth, _vestWarmth, _headgearWarmth, _facewearWarmth], _text]
