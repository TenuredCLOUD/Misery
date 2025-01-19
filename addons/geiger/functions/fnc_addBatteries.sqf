#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Geiger battery adder
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_geiger_fnc_batteries
 *
*/

if !([[QCLASS(lithiumBattery)]] call EFUNC(common,hasItem)) exitWith {
    titleText ["You don't have any lithium batteries..", "PLAIN DOWN"];
};

if !([[QCLASS(geiger_NoBattery)]] call EFUNC(common,hasItem)) exitWith {
    titleText ["You don't have a dead geiger..", "PLAIN DOWN"];
};

player removeItem QCLASS(lithiumBattery);
[[QCLASS(geiger_NoBattery)], [QCLASS(geiger_On)]] call EFUNC(common,switchMagazine);

titleText ["You add a Lithium battery to your Geiger", "PLAIN DOWN"];

playSound QEGVAR(audio,sound_geigerOn);

call FUNC(readings);
