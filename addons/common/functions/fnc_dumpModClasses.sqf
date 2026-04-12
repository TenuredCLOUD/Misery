#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Classname RPT Dump
 * Matches prefix to config search and dumps all classes to RPT log for easy copying
 *
 * Arguments:
 * 0: ConfigType <STRING>
 * 1: Prefix <STRING>
 *
 * Return Value:
 * 0: None
 *
 * Examples:
 * ["CfgVehicles", "CUP_"] call misery_common_fnc_dumpModClasses;
 * ["CfgWeapons", "CUP_"] call misery_common_fnc_dumpModClasses;
 * ["CfgMagazines", "CUP_"] call misery_common_fnc_dumpModClasses;
 *
*/

params ["_configType", "_prefix"];
diag_log format ["--- START DUMP: %1 ---", _configType];
private _classes = (configFile >> _configType) call BIS_fnc_returnChildren;

{
    private _className = configName _x;
    // Check if it starts with prefix and is "public" (scope 2)
    if ((_className select [0, count _prefix]) isEqualTo _prefix && {getNumber (_x >> "scope") isEqualTo 2}) then {
        diag_log _className;
    };
} forEach _classes;

diag_log format ["--- END DUMP: %1 ---", _configType];

systemChat "Export Complete. Check your RPT log.";
