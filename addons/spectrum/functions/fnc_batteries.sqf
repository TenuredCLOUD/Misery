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
    private _detectorInventory = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "Remove the antenna attachment from your spectrum device before adding batteries..."];
    [QEGVAR(common,tileText), _detectorInventory] call CBA_fnc_localEvent;
};

if (_light isNotEqualTo "") exitWith {
    private _detectorInventory = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "Remove the light attachment from your spectrum device before adding batteries..."];
    [QEGVAR(common,tileText), _detectorInventory] call CBA_fnc_localEvent;
};

if  ([QCLASS(lithiumBattery)] call EFUNC(common,countItem) < 2) exitWith {
    private _noBattery = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "You don't have enough lithium batteries... (2 needed)"];
    [QEGVAR(common,tileText), _noBattery] call CBA_fnc_localEvent;
};

if !([["hgun_esd_01_dummy_F"]] call EFUNC(common,hasItem)) exitWith {
    private _noDetector = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "You don't have a spectrum device that needs batteries..."];
    [QEGVAR(common,tileText), _noDetector] call CBA_fnc_localEvent;
};

{
    for "_i" from 1 to 2 do {[player, _x] call CBA_fnc_removeItem};
} forEach [QCLASS(lithiumBattery)];

private _batteryAdded = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "You add x2 lithium batteries to your spectrum device"];
[QEGVAR(common,tileText), _batteryAdded] call CBA_fnc_localEvent;

private _detector = handgunWeapon player;
player removeWeapon _detector;
// add newspectrum device
player addWeapon "hgun_esd_01_F";
