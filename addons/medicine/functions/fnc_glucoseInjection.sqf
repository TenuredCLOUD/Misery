#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Glucose injection usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_glucoseInjection;
 *
*/

fnc_glucose = {

params ["_c", "_text"];

if (!hasInterface || {!alive player}) exitWith {};
if (_c isEqualTo 0) exitWith {titleText [_text, "PLAIN DOWN"];}; //exit loop
player setVariable [QEGVAR(survival,hunger), (_MHunger + 5)];
_c = _c - 1;

[{ _this call fnc_glucose;}, [_c, _text], 10] call CBA_fnc_waitAndExecute;
};

if (!hasInterface || {!alive player}) exitWith {};

private _MHunger = player getVariable [QEGVAR(survival,hunger), MACRO_PLAYER_DEFAULTS_HIGH];

titleText ["You inject the Glucose solution...", "PLAIN DOWN"];

player removeItem QCLASS(glucose);
private _c = 10;
[{ _this call fnc_glucose;}, [_c, "The Glucose injection has worn off..."], 10] call CBA_fnc_waitAndExecute;
