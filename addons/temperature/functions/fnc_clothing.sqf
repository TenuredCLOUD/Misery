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

private _config = missionConfigFile >> "CfgMisery_GearData" >> "GearValues";

private _uniform = uniform _unit;
private _vest = vest _unit;
private _headgear = headgear _unit;
private _facewear = goggles _unit;

if (_uniform isNotEqualTo "") then {
    if (isClass _config && {isNumber (_config >> _uniform >> "insulation")}) then {
        _uniformWarmth = getNumber (_config >> _uniform >> "insulation");
    } else {
        private _uniformMass = getNumber (configFile >> "CfgWeapons" >> _uniform >> "ItemInfo" >> "mass");
        if (_uniformMass > 0) then {
            _uniformWarmth = (_uniformMass / 4) min 15;
            if ((toLower _uniform) find "ghillie" > -1) then {
                _uniformWarmth = (_uniformWarmth * 1.5) min 25;
            };
            if ((toLower _uniform) find "gorka" > -1) then {
                _uniformWarmth = (_uniformWarmth * 1.5) min 25;
            };
            if ((toLower _uniform) find "wetsuit" > -1) then {
                _uniformWarmth = (_uniformWarmth * 1.3) min 20;
            };
            if ((toLower _uniform) find "survival" > -1) then {
                _uniformWarmth = (_uniformWarmth * 1.5) min 25;
            };
        };
    };
};

if (_vest isNotEqualTo "") then {
    if (isClass _config && {isNumber (_config >> _vest >> "insulation")}) then {
        _vestWarmth = getNumber (_config >> _vest >> "insulation");
    } else {
        private _vestMass = getNumber (configFile >> "CfgWeapons" >> _vest >> "ItemInfo" >> "mass");
        if (_vestMass > 0) then {
            _vestWarmth = (_vestMass / 6) min 15;
        };
    };
};

if (_headgear isNotEqualTo "") then {
    if (isClass _config && {isNumber (_config >> _headgear >> "insulation")}) then {
        _headgearWarmth = getNumber (_config >> _headgear >> "insulation");
    } else {
        private _headgearMass = getNumber (configFile >> "CfgWeapons" >> _headgear >> "ItemInfo" >> "mass");
        if (_headgearMass > 0) then {
            _headgearWarmth = (_headgearMass / 8) min 4;
            if ((((toLower _headgear) find "watchcap" > -1) || ((toLower _headgear) find "ushanka" > -1) || ((toLower _headgear) find "bala" > -1) || ((toLower _headgear) find "shem" > -1))) then {
                _headgearWarmth = (_headgearWarmth * 1.5) min 7;
            };
        };
    };
};

if (_facewear isNotEqualTo "") then {
    if (isClass _config && {isNumber (_config >> _facewear >> "insulation")}) then {
        _facewearWarmth = getNumber (_config >> _facewear >> "insulation");
    } else {
        private _facewearMass = getNumber (configFile >> "CfgGlasses" >> _facewear >> "ItemInfo" >> "mass");
        if (_facewearMass > 0) then {
            _facewearWarmth = (_facewearMass / 10) min 2;
            if ((((toLower _facewear) find "bala" > -1) || ((toLower _facewear) find "shem" > -1))) then {
                _facewearWarmth = (_facewearWarmth * 1.5) min 3;
            };
        };
    };
};

private _warmth = (_uniformWarmth + _vestWarmth + _headgearWarmth + _facewearWarmth) min 50;

private _text = format ["Uniform: %1  Vest: %2  Headwear: %3  Facewear: %4", round _uniformWarmth, round _vestWarmth, round _headgearWarmth, round _facewearWarmth];

[_warmth, [_uniformWarmth, _vestWarmth, _headgearWarmth, _facewearWarmth], _text]
