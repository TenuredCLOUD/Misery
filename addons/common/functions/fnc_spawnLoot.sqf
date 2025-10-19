#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Spawns loot at given position, each loot array should be formatted like so: [["classname", amount], ["otherclassname", amount]]
 *
 * Arguments:
 * 0: Position <POSITION>
 * 1: Loot Array <ARRAY>
 *    0: Weapon Cargo <ARRAY of ARRAYS>
 *    1: Magazine Cargo <ARRAY of ARRAYS>
 *    2: Item Cargo <ARRAY of ARRAYS>
 *    3: Backpack Cargo <ARRAY of ARRAYS>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_position, [["arifle_mx_f", 1]], [["30Rnd_65x39_caseless_mag", 2]], [["itemGPS", 1]]] call misery_common_fnc_spawnLoot
*/

params ["_position", ["_weaponCargo", []], ["_magazineCargo", []], ["_itemCargo", []], ["_backpackCargo", []]];

if (!isServer) exitWith {};

// Raise height to prevent loot under buildings.
if (_position select 2 < 2) then {
    _position set [2, 1];
};

private _groundHolder = createVehicle ["WeaponHolderSimulated", _position, [], 0, "CAN_COLLIDE"];
removeFromRemainsCollector [_groundHolder];

if (_weaponCargo isNotEqualTo []) then {
    {
        _x params ["_classname", "_amount"];
        _groundHolder addWeaponCargoGlobal [_className, _amount];
    } forEach _weaponCargo;
};

if (_magazineCargo isNotEqualTo []) then {
    {
        _x params ["_classname", "_amount"];
        _groundHolder addMagazineCargoGlobal [_className, _amount];
    } forEach _magazineCargo;
};

if (_itemCargo isNotEqualTo []) then {
    {
        _x params ["_classname", "_amount"];
        _groundHolder addItemCargoGlobal [_className, _amount];
    } forEach _itemCargo;
};

if (_backpackCargo isNotEqualTo []) then {
    {
        _x params ["_classname", "_amount"];
        _groundHolder addBackpackCargoGlobal [_className, _amount];
    } forEach _backpackCargo;
};
