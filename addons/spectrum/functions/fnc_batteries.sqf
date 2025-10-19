#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Spectrum device batteries
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_spectrum_fnc_batteries
 *
*/

[player] call EFUNC(common,handgunAttachments) params ["_muzzle", "_light"];

if (_muzzle isNotEqualTo "") exitWith {
    [QEGVAR(common,tileText), "Remove the antenna attachment from your spectrum device before adding batteries..."] call CBA_fnc_localEvent;
};

if (_light isNotEqualTo "") exitWith {
    [QEGVAR(common,tileText), "Remove the light attachment from your spectrum device before adding batteries..."] call CBA_fnc_localEvent;
};

if  ([QCLASS(lithiumBattery)] call EFUNC(common,countItem) < 2) exitWith {
    [QEGVAR(common,tileText), "You don't have enough lithium batteries... (2 needed)"] call CBA_fnc_localEvent;
};

if !([["hgun_esd_01_dummy_F"]] call EFUNC(common,hasItem)) exitWith {
    [QEGVAR(common,tileText), "You don't have a spectrum device that needs batteries..."] call CBA_fnc_localEvent;
};

{
    for "_i" from 1 to 2 do {[player, _x] call CBA_fnc_removeItem};
} forEach [QCLASS(lithiumBattery)];

[QEGVAR(common,tileText), "You add x2 lithium batteries to your spectrum device"] call CBA_fnc_localEvent;

private _detector = handgunWeapon player;
player removeWeapon _detector;
// add newspectrum device
player addWeapon "hgun_esd_01_F";
