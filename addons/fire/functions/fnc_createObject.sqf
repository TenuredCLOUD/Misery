#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Handles new fire creation
 *
 * Arguments:
 * 0: Fuel source <STRING>
 * 1: Fuel type <STRING>
 * 2: Note Box <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fire_fnc_createObject
 */

params ["_fuel", "_fuelType", "_noteBox"];

private _burnTimeLeft = if (_fuel isEqualTo "") then {30} else {[2700, 5400] select (["small", "big"] find _fuelType)};

if (_fuel isNotEqualTo "") then {
    [player, _fuel] call CBA_fnc_removeItem;
};

private _pos = player getRelPos [1.5, 0];
private _fireClass = ["FirePlace_burning_F", "Campfire_burning_F"] select (_fuelType isEqualTo "big");
private _object = createVehicle [_fireClass, _pos, [], 0, "CAN_COLLIDE"];
_pos = [_pos select 0, _pos select 1, ((getPosATL player) select 2) + 1];
_object setPos _pos;
_pos = (_object call EFUNC(common,surfacePos)) select 0;
_object setPosASL _pos;
_object setDir (getDir player);

GVAR(activeFires) pushBack [_object, _fuelType, _burnTimeLeft];

publicVariable QGVAR(activeFires);

_noteBox ctrlSetText "Fire crafted successfully!";
