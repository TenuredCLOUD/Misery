#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * POI Crate Loot Generator
 *
 * Arguments:
 * 0: Ammo Box <OBJECT>
 * 1: Weapon Array <ARRAY>
 * 2: Weapon Mag Array <STRING>
 * 3: Weapon Attachment Array <STRING>
 * 4: Item Array <ARRAY>
 * 5: Uniform Array <ARRAY>
 * 6: Vest Array <ARRAY>
 * 7: Backpack Array <ARRAY>
 * 8: Max Allowed Items <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_poi_fnc_populateCrate;
 *
 * Public: No
*/

params ["_ammoBox", "_crateWeaponArray", "_crateWeaponMagArray", "_crateWeaponAttchArray", "_crateItemArray", "_crateUniformArray", "_crateVestArray", "_crateBackpackArray", "_maxAllowedCrateItems"];

if (!isNil "_crateWeaponArray" && {count _crateWeaponArray > 0}) then {
    for "_i" from 1 to _maxAllowedCrateItems do {
        private _selectedWeapon = selectRandom _crateWeaponArray;
        _ammoBox addWeaponCargoGlobal [_selectedWeapon, 1];

        switch (_crateWeaponMagArray) do {
            case "BASIC": {
                private _compatibleMags = getArray (configFile >> "CfgWeapons" >> _selectedWeapon >> "magazines");
                if (count _compatibleMags > 0) then {
                    for "_j" from 1 to _maxAllowedCrateItems do {
                        _ammoBox addMagazineCargoGlobal [_compatibleMags select 0, 1];
                    };
                };
            };
            case "ALL": {
                private _compatibleMags = getArray (configFile >> "CfgWeapons" >> _selectedWeapon >> "magazines");
                if (count _compatibleMags > 0) then {
                    for "_j" from 1 to _maxAllowedCrateItems do {
                        _ammoBox addMagazineCargoGlobal [selectRandom _compatibleMags, 1];
                    };
                };
            };
            case "NONE": {};
        };

        switch (_crateWeaponAttchArray) do {
            case "BASIC": {
                private _compatibleAttachments = compatibleItems _selectedWeapon;
                if (count _compatibleAttachments > 0) then {
                    for "_k" from 1 to _maxAllowedCrateItems do {
                        _ammoBox addItemCargoGlobal [_compatibleAttachments select 0, 1];
                    };
                };
            };
            case "ALL": {
                private _compatibleAttachments = compatibleItems _selectedWeapon;
                if (count _compatibleAttachments > 0) then {
                    for "_k" from 1 to _maxAllowedCrateItems do {
                        _ammoBox addItemCargoGlobal [selectRandom _compatibleAttachments, 1];
                    };
                };
            };
            case "NONE": {};
        };
    };
};

if (!isNil "_crateItemArray" && {count _crateItemArray > 0}) then {
    for "_i" from 1 to _maxAllowedCrateItems do {
        _ammoBox addItemCargoGlobal [selectRandom _crateItemArray, 1];
    };
};

if (!isNil "_crateUniformArray" && {count _crateUniformArray > 0}) then {
    for "_i" from 1 to _maxAllowedCrateItems do {
        _ammoBox addItemCargoGlobal [selectRandom _crateUniformArray, 1];
    };
};

if (!isNil "_crateVestArray" && {count _crateVestArray > 0}) then {
    for "_i" from 1 to _maxAllowedCrateItems do {
        _ammoBox addItemCargoGlobal [selectRandom _crateVestArray, 1];
    };
};

if (!isNil "_crateBackpackArray" && {count _crateBackpackArray > 0}) then {
    for "_i" from 1 to _maxAllowedCrateItems do {
        _ammoBox addBackpackCargoGlobal [selectRandom _crateBackpackArray, 1];
    };
};
