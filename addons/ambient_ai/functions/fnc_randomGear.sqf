#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Ambient AI gear processor
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_ambient_ai_fnc_randomGear;
 *
 * Public: No
*/

params ["_unit"];

private _randomweaploadout = [0, 5] call BIS_fnc_randomInt;
private _randomvestloadout = [1, 2] call BIS_fnc_randomInt;
private _randombackpackloadout = [1, 2] call BIS_fnc_randomInt;
private _randomNVGloadout = [1, 2] call BIS_fnc_randomInt;
private _randomFacewearloadout = [1, 2] call BIS_fnc_randomInt;
private _randomHeadgearloadout = [1, 2] call BIS_fnc_randomInt;
private _randomammocount = [1, GVAR(ammoCount)] call BIS_fnc_randomInt;

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

switch (_randomweaploadout) do {
    case 0: {
        if (count GVAR(primaryWeapons) > 0) then {
            [_unit, selectRandom GVAR(primaryWeapons), 0] call BIS_fnc_addWeapon;
        };
        if (count GVAR(secondaryWeapons) > 0) then {
            [_unit, selectRandom GVAR(secondaryWeapons), 0] call BIS_fnc_addWeapon;
        };
        if (count GVAR(launcherWeapons) > 0) then {
            [_unit, selectRandom GVAR(launcherWeapons), 0] call BIS_fnc_addWeapon;
        };
    };
    case 1: {
        if (count GVAR(primaryWeapons) > 0) then {
            [_unit, selectRandom GVAR(primaryWeapons), 0] call BIS_fnc_addWeapon;
        };
    };
    case 2: {
        if (count GVAR(secondaryWeapons) > 0) then {
            [_unit, selectRandom GVAR(secondaryWeapons), 0] call BIS_fnc_addWeapon;
        };
    };
    case 3: {
        if (count GVAR(primaryWeapons) > 0) then {
            [_unit, selectRandom GVAR(primaryWeapons), 0] call BIS_fnc_addWeapon;
        };
        if (count GVAR(secondaryWeapons) > 0) then {
            [_unit, selectRandom GVAR(secondaryWeapons), 0] call BIS_fnc_addWeapon;
        };
    };
    case 4: {
        if (count GVAR(primaryWeapons) > 0) then {
            [_unit, selectRandom GVAR(primaryWeapons), 0] call BIS_fnc_addWeapon;
        };
        if (count GVAR(launcherWeapons) > 0) then {
            [_unit, selectRandom GVAR(launcherWeapons), 0] call BIS_fnc_addWeapon;
        };
    };
    case 5: {
        if (count GVAR(secondaryWeapons) > 0) then {
            [_unit, selectRandom GVAR(secondaryWeapons), 0] call BIS_fnc_addWeapon;
        };
        if (count GVAR(launcherWeapons) > 0) then {
            [_unit, selectRandom GVAR(launcherWeapons), 0] call BIS_fnc_addWeapon;
        };
    };
};

if (count GVAR(uniform) > 0) then {_unit forceAddUniform selectRandom GVAR(uniform)};

if (_randomvestloadout isEqualTo 1) then {
    if (count GVAR(vest) > 0) then {_unit addVest selectRandom GVAR(vest)};
};

if (_randombackpackloadout isEqualTo 1) then {
    if (count GVAR(backpack) > 0) then {_unit addBackpack selectRandom GVAR(backpack)};
};

if (_randomNVGloadout isEqualTo 1) then {
    if (count GVAR(nvgs) > 0) then {_unit linkItem selectRandom GVAR(nvgs)};
};

if (_randomFacewearloadout isEqualTo 1) then {
    if (count GVAR(facewear) > 0) then {_unit addGoggles selectRandom GVAR(facewear)};
};

if (_randomHeadgearloadout isEqualTo 1) then {
    if (count GVAR(headgear) > 0) then {_unit addHeadgear selectRandom GVAR(headgear)};
};

if ((_unit ammo (primaryWeapon _unit)) isEqualTo 0) then {
    private _magazinearrayP = getArray (configFile >> "CfgWeapons" >> primaryWeapon _unit >> "magazines");
    if (_magazinearrayP isNotEqualTo []) then {
        _magP = _magazinearrayP select 0;
        for "_j" from 1 to _randomammocount do {
            _unit addMagazine _magP;
        };
    };
};

if ((_unit ammo (handgunWeapon _unit)) isEqualTo 0) then {
    private _magazinearrayH = getArray (configFile >> "CfgWeapons" >> handgunWeapon _unit >> "magazines");
    if (_magazinearrayH isNotEqualTo []) then {
        _magH = _magazinearrayH select 0;
        for "_j" from 1 to _randomammocount do {
            _unit addMagazine _magH;
        };
    };
};

if ((_unit ammo (secondaryWeapon _unit)) isEqualTo 0) then {
    private _magazinearrayS = getArray (configFile >> "CfgWeapons" >> secondaryWeapon _unit >> "magazines");
    if (_magazinearrayS isNotEqualTo []) then {
        _magS = _magazinearrayS select 0;
        for "_j" from 1 to _randomammocount do {
            _unit addMagazine _magS;
        };
    };
};

if (count GVAR(items) > 0) then {
    for "_i" from 1 to 2 do {_unit addItem (selectRandom GVAR(items));};
};

reload _unit;

_unit setSkill ["aimingAccuracy", GVAR(accuracy)];
_unit setSkill ["aimingShake", GVAR(shake)];
_unit setSkill ["aimingSpeed", GVAR(speed)];
