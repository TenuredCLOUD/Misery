#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Supply drop crate loot generator
 *
 * Arguments:
 * 0: Ammo Box <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_supply_drop_fnc_populateCrate;
 *
 * Public: No
*/

params ["_ammoBox"];

if (GVAR(weapons) isNotEqualTo []) then {
    for "_i" from 1 to GVAR(itemCount) do {
        private _selectedWeapon = selectRandom GVAR(weapons);
        _ammoBox addWeaponCargoGlobal [_selectedWeapon, 1];

        switch (GVAR(ammoTier)) do {
            case 0: {
                private _compatibleMags = getArray (configFile >> "CfgWeapons" >> _selectedWeapon >> "magazines");
                if (_compatibleMags isNotEqualTo []) then {
                    for "_j" from 1 to GVAR(itemCount) do {
                        _ammoBox addMagazineCargoGlobal [_compatibleMags select 0, 1];
                    };
                };
            };
            case 1: {
                private _compatibleMags = getArray (configFile >> "CfgWeapons" >> _selectedWeapon >> "magazines");
                if (_compatibleMags isNotEqualTo []) then {
                    for "_j" from 1 to GVAR(itemCount) do {
                        _ammoBox addMagazineCargoGlobal [selectRandom _compatibleMags, 1];
                    };
                };
            };
            case 2: {};
        };

        switch (GVAR(attachmentTier)) do {
            case 0: {
                private _compatibleAttachments = compatibleItems _selectedWeapon;
                if (_compatibleAttachments isNotEqualTo []) then {
                    for "_k" from 1 to GVAR(itemCount) do {
                        _ammoBox addItemCargoGlobal [_compatibleAttachments select 0, 1];
                    };
                };
            };
            case 1: {
                private _compatibleAttachments = compatibleItems _selectedWeapon;
                if (_compatibleAttachments isNotEqualTo []) then {
                    for "_k" from 1 to GVAR(itemCount) do {
                        _ammoBox addItemCargoGlobal [selectRandom _compatibleAttachments, 1];
                    };
                };
            };
            case 2: {};
        };
    };
};

if (GVAR(items) isNotEqualTo []) then {
    for "_i" from 1 to GVAR(itemCount) do {
        _ammoBox addItemCargoGlobal [selectRandom GVAR(items), 1];
    };
};

if (GVAR(uniform) isNotEqualTo []) then {
    for "_i" from 1 to GVAR(itemCount) do {
        _ammoBox addItemCargoGlobal [selectRandom GVAR(uniform), 1];
    };
};

if (GVAR(vest) isNotEqualTo []) then {
    for "_i" from 1 to GVAR(itemCount) do {
        _ammoBox addItemCargoGlobal [selectRandom GVAR(vest), 1];
    };
};

if (GVAR(backpack) isNotEqualTo []) then {
    for "_i" from 1 to GVAR(itemCount) do {
        _ammoBox addBackpackCargoGlobal [selectRandom GVAR(backpack), 1];
    };
};
