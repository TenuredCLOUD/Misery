#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Headlamp batteries
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_headlamp_fnc_batteries
 *
*/

if ([[QCLASS(9vBattery)]] call EFUNC(common,hasItem)) then {

player removeItem QCLASS(headlamp_NoBattery);

titleText ["You add a 9v battery to your Headlamp", "PLAIN DOWN"];

player removeItem QCLASS(9vBattery);

player addMagazine QCLASS(headlamp_Off);

} else {
titleText ["You don't have any 9v batteries...", "PLAIN DOWN"];
};
