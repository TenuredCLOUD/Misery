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
    [QEGVAR(common,tileText), "You don't have enough 9v batteries... (2 needed)"] call CBA_fnc_localEvent;
};

if !([["ChemicalDetector_01_black_F"]] call EFUNC(common,hasItem)) exitWith {
    [QEGVAR(common,tileText), "You don't have a detector that needs batteries..."] call CBA_fnc_localEvent;
};

{
    for "_i" from 1 to 2 do {[player, _x] call CBA_fnc_removeItem};
} forEach [QCLASS(9vBattery)];

[QEGVAR(common,tileText), "You add x2 9v batteries to your detector"] call CBA_fnc_localEvent;

[player, "ChemicalDetector_01_black_F", "ChemicalDetector_01_watch_F"] call EFUNC(common,itemSwap);

