#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Serialize container cargo
 *
 * Arguments:
 * 0: Container <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_gear_cache_fnc_serializeCache;
 *
*/

params ["_container"];

private _cargoMap = createHashMap;

_cargoMap set ["weapons", getWeaponCargo _container];
_cargoMap set ["magazines", getMagazineCargo _container];
_cargoMap set ["items", getItemCargo _container];
_cargoMap set ["backpacks", getBackpackCargo _container];

_cargoMap set ["containerClass", typeOf _container];

_cargoMap set ["containerPos", getPosATL _container];

_cargoMap set ["containerVector", [vectorDir _container, vectorUp _container]];

_cargoMap set ["digDuration", 10 + (maxLoad _container / 100)];

_cargoMap
