#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Chemical detector batteries
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_chemical_fnc_batteries
 *
*/

if  ([QCLASS(9vBattery)] call EFUNC(common,countItem) < 2) exitWith {
    private _noBattery = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "You don't have enough 9v batteries... (2 needed)"];
    [QEGVAR(common,tileText), _noBattery] call CBA_fnc_localEvent;
};

if !([["ChemicalDetector_01_black_F"]] call EFUNC(common,hasItem)) exitWith {
    private _noDetector = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "You don't have a detector that needs batteries..."];
    [QEGVAR(common,tileText), _noDetector] call CBA_fnc_localEvent;
};

{
    for "_i" from 1 to 2 do {[player, _x] call CBA_fnc_removeItem};
} forEach [QCLASS(9vBattery)];

private _batteryAdded = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "You add x2 9v batteries to your detector"];
[QEGVAR(common,tileText), _batteryAdded] call CBA_fnc_localEvent;

[player, "ChemicalDetector_01_black_F", "ChemicalDetector_01_watch_F"] call EFUNC(common,itemSwap);

