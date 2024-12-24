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

if ([["Misery_lithiumbattery"]] call EFUNC(common,hasItem)) then {

player removeItem "Misery_personalgeigernobattery";

titleText ["You add a Lithium battery to your Geiger", "PLAIN DOWN"];

player removeItem "Misery_lithiumbattery";

player addItem "Misery_personalgeiger";

playSound3D [QPATHTOEF(audio,sounds\Geigerenable\GeigerON.ogg), player, false, getPosASL player, 4, 1, 10];

//If bootup successful:

if (isNil {player getVariable "GeigerON"}) then {
player setVariable ["GeigerON", true];
};

} else {

titleText ["You don't have any lithium batteries...", "PLAIN DOWN"];

};
