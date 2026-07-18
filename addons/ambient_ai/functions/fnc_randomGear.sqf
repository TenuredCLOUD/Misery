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
private _randomammo = [1, GVAR(ammoCount)] call BIS_fnc_randomInt;

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
        if (GVAR(primaryWeaponsCached) isNotEqualTo []) then {
            [_unit, selectRandom GVAR(primaryWeaponsCached), 0] call BIS_fnc_addWeapon;
        };
        if (GVAR(secondaryWeaponsCached) isNotEqualTo []) then {
            [_unit, selectRandom GVAR(secondaryWeaponsCached), 0] call BIS_fnc_addWeapon;
        };
        if (GVAR(launcherWeaponsCached) isNotEqualTo []) then {
            [_unit, selectRandom GVAR(launcherWeaponsCached), 0] call BIS_fnc_addWeapon;
        };
    };
    case 1: {
        if (GVAR(primaryWeaponsCached) isNotEqualTo []) then {
            [_unit, selectRandom GVAR(primaryWeaponsCached), 0] call BIS_fnc_addWeapon;
        };
    };
    case 2: {
        if (GVAR(secondaryWeaponsCached) isNotEqualTo []) then {
            [_unit, selectRandom GVAR(secondaryWeaponsCached), 0] call BIS_fnc_addWeapon;
        };
    };
    case 3: {
        if (GVAR(primaryWeaponsCached) isNotEqualTo []) then {
            [_unit, selectRandom GVAR(primaryWeaponsCached), 0] call BIS_fnc_addWeapon;
        };
        if (GVAR(secondaryWeaponsCached) isNotEqualTo []) then {
            [_unit, selectRandom GVAR(secondaryWeaponsCached), 0] call BIS_fnc_addWeapon;
        };
    };
    case 4: {
        if (GVAR(primaryWeaponsCached) isNotEqualTo []) then {
            [_unit, selectRandom GVAR(primaryWeaponsCached), 0] call BIS_fnc_addWeapon;
        };
        if (GVAR(launcherWeaponsCached) isNotEqualTo []) then {
            [_unit, selectRandom GVAR(launcherWeaponsCached), 0] call BIS_fnc_addWeapon;
        };
    };
    case 5: {
        if (GVAR(secondaryWeaponsCached) isNotEqualTo []) then {
            [_unit, selectRandom GVAR(secondaryWeaponsCached), 0] call BIS_fnc_addWeapon;
        };
        if (GVAR(launcherWeaponsCached) isNotEqualTo []) then {
            [_unit, selectRandom GVAR(launcherWeaponsCached), 0] call BIS_fnc_addWeapon;
        };
    };
};

if (GVAR(uniformCached) isNotEqualTo []) then {_unit forceAddUniform selectRandom GVAR(uniformCached)};

if (_randomvestloadout isEqualTo 1) then {
    if (GVAR(vestCached) isNotEqualTo []) then {_unit addVest selectRandom GVAR(vestCached)};
};

if (_randombackpackloadout isEqualTo 1) then {
    if (GVAR(backpackCached) isNotEqualTo []) then {_unit addBackpack selectRandom GVAR(backpackCached)};
};

if (_randomNVGloadout isEqualTo 1) then {
    if (GVAR(nvgsCached) isNotEqualTo []) then {_unit linkItem selectRandom GVAR(nvgsCached)};
};

if (_randomFacewearloadout isEqualTo 1) then {
    if (GVAR(facewearCached) isNotEqualTo []) then {_unit addGoggles selectRandom GVAR(facewearCached)};
};

if (_randomHeadgearloadout isEqualTo 1) then {
    if (GVAR(headgearCached) isNotEqualTo []) then {_unit addHeadgear selectRandom GVAR(headgearCached)};
};

if ((_unit ammo (primaryWeapon _unit)) isEqualTo 0) then {
    private _magazinearrayP = getArray (configFile >> "CfgWeapons" >> primaryWeapon _unit >> "magazines");
    if (_magazinearrayP isNotEqualTo []) then {
        _magP = _magazinearrayP select 0;
        for "_j" from 1 to _randomammo do {
            _unit addMagazine _magP;
        };
    };
};

if ((_unit ammo (handgunWeapon _unit)) isEqualTo 0) then {
    private _magazinearrayH = getArray (configFile >> "CfgWeapons" >> handgunWeapon _unit >> "magazines");
    if (_magazinearrayH isNotEqualTo []) then {
        _magH = _magazinearrayH select 0;
        for "_j" from 1 to _randomammo do {
            _unit addMagazine _magH;
        };
    };
};

if ((_unit ammo (secondaryWeapon _unit)) isEqualTo 0) then {
    private _magazinearrayS = getArray (configFile >> "CfgWeapons" >> secondaryWeapon _unit >> "magazines");
    if (_magazinearrayS isNotEqualTo []) then {
        _magS = _magazinearrayS select 0;
        for "_j" from 1 to _randomammo do {
            _unit addMagazine _magS;
        };
    };
};

if (GVAR(itemsCached) isNotEqualTo []) then {
    for "_i" from 1 to 2 do {_unit addItem (selectRandom GVAR(itemsCached));};
};

reload _unit;

_unit setSkill ["aimingAccuracy", GVAR(accuracy)];
_unit setSkill ["aimingShake", GVAR(shake)];
_unit setSkill ["aimingSpeed", GVAR(speed)];
