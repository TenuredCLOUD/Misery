#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Deserialize container cargo
 *
 * Arguments:
 * 0: Container <OBJECT>
 * 1: Container hash <HASHMAP>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_gear_cache_fnc_deserializeCache;
 *
*/

params ["_container", "_cargoMap"];

clearWeaponCargoGlobal _container;
clearMagazineCargoGlobal _container;
clearItemCargoGlobal _container;
clearBackpackCargoGlobal _container;

// Restore Weapons
(_cargoMap getOrDefault ["weapons", [[], []]]) params ["_classes", "_counts"];

{
    _container addWeaponCargoGlobal [_x, _counts select _forEachIndex];
} forEach _classes;

// Restore Magazines
(_cargoMap getOrDefault ["magazines", [[], []]]) params ["_classes", "_counts"];

{
    _container addMagazineCargoGlobal [_x, _counts select _forEachIndex];
} forEach _classes;

// Restore Items
(_cargoMap getOrDefault ["items", [[], []]]) params ["_classes", "_counts"];

{
    _container addItemCargoGlobal [_x, _counts select _forEachIndex];
} forEach _classes;

// Restore Backpacks
(_cargoMap getOrDefault ["backpacks", [[], []]]) params ["_classes", "_counts"];

{
    _container addBackpackCargoGlobal [_x, _counts select _forEachIndex];
} forEach _classes;
