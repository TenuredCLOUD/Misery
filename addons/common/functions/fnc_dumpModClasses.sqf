#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Classname RPT Dump
 * Matches prefix to config search and dumps all filtered classes to RPT log for easy copying
 *
 * Arguments:
 * 0: ConfigType <STRING>
 * 1: Prefix <STRING>
 * 2: Filter <NUMBER>
 *
 * Return Value:
 * 0: None
 *
 * Examples:
 * Facewear - ["CfgGlasses", "CUP_", -3] call misery_common_fnc_dumpModClasses;
 * Magazines - ["CfgMagazines", "CUP_", -2] call misery_common_fnc_dumpModClasses;
 * Backpacks - ["CfgVehicles", "CUP_", -1] call misery_common_fnc_dumpModClasses;
 * No filter - ["CfgVehicles", "CUP_"] call misery_common_fnc_dumpModClasses;
 * Primaries - ["CfgWeapons", "CUP_", 1] call misery_common_fnc_dumpModClasses;
 * Handguns - ["CfgWeapons", "CUP_", 2] call misery_common_fnc_dumpModClasses;
 * Launchers - ["CfgWeapons", "CUP_", 4] call misery_common_fnc_dumpModClasses;
 * Vests - ["CfgWeapons", "CUP_", 701] call misery_common_fnc_dumpModClasses;
 * Uniforms - ["CfgWeapons", "CUP_", 801] call misery_common_fnc_dumpModClasses;
 * Helmets - ["CfgWeapons", "CUP_", 605] call misery_common_fnc_dumpModClasses;
 * NVGs - ["CfgWeapons", "CUP_", 616] call misery_common_fnc_dumpModClasses;
 * Radios/GPS - ["CfgWeapons", "CUP_", 901] call misery_common_fnc_dumpModClasses;
 * Muzzles - ["CfgWeapons", "CUP_muzzle_", 101] call misery_common_fnc_dumpModClasses;
 * Optics - ["CfgWeapons", "CUP_", 201] call misery_common_fnc_dumpModClasses;
 * Flashlights - ["CfgWeapons", "CUP_", 301] call misery_common_fnc_dumpModClasses;
 * Bipods - ["CfgWeapons", "CUP_", 602] call misery_common_fnc_dumpModClasses;
 * Binocs - ["CfgWeapons", "CUP_", 4096] call misery_common_fnc_dumpModClasses;
*/

params ["_configType", "_prefix", ["_numericFilter", 0]];
diag_log format ["--- START DUMP: %1 (Type ID: %2) ---", _configType, _numericFilter];

private _classes = (configFile >> _configType) call BIS_fnc_returnChildren;

{
    private _className = configName _x;
    if ((_className select [0, count _prefix]) isEqualTo _prefix && {getNumber (_x >> "scope") isEqualTo 2}) then {

        private _isMatch = false;

        // Dump all with prefix (no filter)
        if (_numericFilter isEqualTo 0) then {
            _isMatch = true;
        } else {
            // Use -1 specifically for Backpacks
            if (_configType isEqualTo "CfgVehicles" && _numericFilter isEqualTo -1) then {
                if (getNumber (_x >> "isBackpack") isEqualTo 1) then { _isMatch = true; };
            };

            // Use -2 specifically for Magazines
            if (_configType isEqualTo "CfgMagazines" && _numericFilter isEqualTo -2) then {
                _isMatch = true;
            };

            // Use -3 specifically for Facewear
            if (_configType isEqualTo "CfgGlasses" && _numericFilter isEqualTo -3) then {
                _isMatch = true;
            };

            // Standard ItemInfo and Weapon types
            if (_configType isEqualTo "CfgWeapons") then {
                if (getNumber (_x >> "ItemInfo" >> "type") isEqualTo _numericFilter) then {
                    _isMatch = true;
                };

                if (getNumber (_x >> "type") isEqualTo _numericFilter) then {
                    _isMatch = true;
                };

                // Look for the Under-barrel class
                if (_numericFilter isEqualTo 602) then {
                    if ("bipod" in (toLower _className)) then {
                        _isMatch = true;
                    };
                };
            };
        };

        if (_isMatch) then {
            diag_log _className;
        };
    };
} forEach _classes;

diag_log format ["--- END DUMP: %1 ---", _configType];

systemChat format ["%1 Export complete.", _prefix];
