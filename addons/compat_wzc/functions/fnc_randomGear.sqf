#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Gear randomiser for zombies
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Type <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_compat_wzc_fnc_randomGear;
 *
*/

params ["_unit", "_type"];

private _clothes = [GVAR(clothingMil), GVAR(clothingCiv)] select ([GVAR(clothingChance)] call EFUNC(common,rollChance));

private _headgear = [GVAR(headgearMil), GVAR(headgearCiv)] select (_clothes isEqualTo GVAR(clothingCiv));

private _facewear = [GVAR(facewearMil), GVAR(facewearCiv)] select (_clothes isEqualTo GVAR(clothingCiv));

private _vests = [GVAR(vestMil), GVAR(vestCiv)] select (_clothes isEqualTo GVAR(clothingCiv));

private _backpacks = [GVAR(bagMil), GVAR(bagCiv)] select (_clothes isEqualTo GVAR(clothingCiv));

private _items = [GVAR(itemsMil), GVAR(itemsCiv)] select (_clothes isEqualTo GVAR(clothingCiv));

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

_unit forceAddUniform (selectRandom _clothes);

if ([GVAR(headgearChance)] call EFUNC(common,rollChance)) then {
    _unit addHeadgear (selectRandom _headgear);
};

if ([GVAR(facewearChance)] call EFUNC(common,rollChance)) then {
    _unit addGoggles (selectRandom _facewear);
};

if ([GVAR(vestChance)] call EFUNC(common,rollChance)) then {
    _unit addVest (selectRandom _vests);
};

if ([GVAR(bagChance)] call EFUNC(common,rollChance)) then {
    _unit addBackpack (selectRandom _backpacks);
};

if ([GVAR(itemsChance)] call EFUNC(common,rollChance)) then {
    if (count _items > 0) then {
        for "_i" from 1 to selectRandom [1, 2, 3, 4, 5] do {
            _unit addItem (selectRandom _items);
        };
    };
};

if (_type isEqualTo 6) then {
    [_unit, selectRandom GVAR(weapons), 1, 0] call BIS_fnc_addWeapon;
};

