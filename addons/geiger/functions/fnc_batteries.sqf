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

if ([[QCLASS(lithiumBattery)]] call EFUNC(common,hasItem)) then {

player removeItem QCLASS(geiger_NoBattery);

titleText ["You add a Lithium battery to your Geiger", "PLAIN DOWN"];

player removeItem QCLASS(lithiumBattery);

player addItem QCLASS(geiger_On);

playSound3D [QPATHTOEF(audio,sounds\Geigerenable\GeigerON.ogg), player, false, getPosASL player, 4, 1, 10];

//If bootup successful:

if (isNil {player getVariable "GeigerON"}) then {
player setVariable ["GeigerON", true];
};

} else {

titleText ["You don't have any lithium batteries...", "PLAIN DOWN"];

};
