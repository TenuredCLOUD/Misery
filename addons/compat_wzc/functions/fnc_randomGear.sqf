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

private _clothes = [GVAR(clothingMilCached), GVAR(clothingCivCached)] select ([GVAR(clothingChance)] call EFUNC(common,rollChance));

private _headgear = [GVAR(headgearMilCached), GVAR(headgearCivCached)] select (_clothes isEqualTo GVAR(clothingCivCached));

private _facewear = [GVAR(facewearMilCached), GVAR(facewearCivCached)] select (_clothes isEqualTo GVAR(clothingCivCached));

private _vests = [GVAR(vestMilCached), GVAR(vestCivCached)] select (_clothes isEqualTo GVAR(clothingCivCached));

private _backpacks = [GVAR(bagMilCached), GVAR(bagCivCached)] select (_clothes isEqualTo GVAR(clothingCivCached));

private _items = [GVAR(itemsMilCached), GVAR(itemsCivCached)] select (_clothes isEqualTo GVAR(clothingCivCached));

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
        for "_i" from 1 to 2 do {
            _unit addItem (selectRandom _items);
        };
    };
};

if (_type isEqualTo 6) then {
    [_unit, selectRandom GVAR(weaponsCached), 1, 0] call BIS_fnc_addWeapon;
};

