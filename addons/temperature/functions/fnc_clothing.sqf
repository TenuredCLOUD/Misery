#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, Drongo
 * Clothing warmth / insulation factors
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_temperature_fnc_clothing;
 *
 * Public: No
*/

// Calculate warmth of clothing (based on mass of uniform, vest and headgear)
// Coverage of uniform, vest, headgear, goggles (often balaclavas)
private _uniform = getNumber (configFile >> "CfgWeapons" >> (uniform player) >> "ItemInfo" >> "mass");
// Reduce _vest by armour value?
private _vest = getNumber (configFile >> "CfgWeapons" >> (vest player) >> "ItemInfo" >> "mass");
_vest = round(_vest / 2);
private _headgear = getNumber (configFile >> "CfgWeapons" >> (headgear player) >> "ItemInfo" >> "mass");
_headgear = round(_headgear / 3);
private _facewear = getNumber (configFile >> "CfgGlasses" >> (goggles player) >> "ItemInfo" >> "mass");

// Extra warmth for Ghillies and Gorkas, wetsuits:
if (((toLower(uniform player)) find "ghillie") >- 1) then {_uniform = _uniform * 3};
if (((toLower(uniform player)) find "gorka") > -1) then {_uniform = _uniform * 3 };
if (((toLower(uniform player)) find "wetsuit") >- 1) then {_uniform = _uniform * 2};

// Extra warmth for ushankas, balaclavas, beanies, and shemags: (+calc if facewear / helmet has no value)
if (((toLower(headgear player)) find "watchcap") >- 1) then {
    if (_headgear < 6 || _headgear isEqualTo 0) then {
_headgear = ((6) * 3);
} else {
_headgear = _headgear * 3;
    };
};

if (((toLower(headgear player)) find "ushanka") >- 1) then {
    if (_headgear < 6 || _headgear isEqualTo 0) then {
_headgear = ((6) * 3);
} else {
_headgear = _headgear * 3;
    };
};

if (((toLower(headgear player)) find "bala") >- 1) then {
    if (_headgear < 6 || _headgear isEqualTo 0) then {
_headgear = ((6) * 3);
} else {
_headgear = _headgear * 3;
    };
};

if (((toLower(headgear player)) find "shem") >- 1) then {
    if (_headgear < 6 || _headgear isEqualTo 0) then {
_headgear = ((6) * 3);
} else {
_headgear = _headgear * 3;
    };
};

if (((toLower(goggles player)) find "bala") >- 1) then {
    if (_facewear < 6 || _facewear isEqualTo 0) then {
_facewear = ((6) * 3);
} else {
_facewear = _facewear * 3;
    };
};

if (((toLower(goggles player)) find "shem") >- 1) then {
    if (_facewear < 6 || _facewear isEqualTo 0) then {
_facewear = ((6) * 3);
} else {
_facewear = _facewear * 3;
    };
};

private _warmth = (_uniform + _vest + _headgear + _facewear);

//Ceil to round up in case clothing mass is very low integer value example: 1 * 3 = 3 /10 = 0.3 ceil = 1;

_warmth = ceil(_warmth / 10);
_uniform = round(_uniform / 10);
_vest = round(_vest / 10);
_headgear = ceil(_headgear / 10);
_facewear = ceil(_facewear / 10);
private _text = format ["Uniform: %1  Vest: %2  Headwear: %3  Facewear: %4", _uniform, _vest, _headgear, _facewear];

[_warmth, [_uniform, _vest, _headgear, _facewear], _text]
