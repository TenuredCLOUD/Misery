#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Electrolyte injection usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_electrolyteInjection;
 *
*/

fnc_electrolyte = {

params ["_c", "_text"];

if (!hasInterface || {!alive player}) exitWith {};
if (_c == 0) exitWith {titleText [_text, "PLAIN DOWN"];}; //exit loop
player setVariable [QCLASS(thirst), (_MThirst + 5)];
_c = _c - 1;

[{ _this call fnc_electrolyte;}, [_c, _text], 10] call CBA_fnc_waitAndExecute;
};

if (!hasInterface || {!alive player}) exitWith {};

private _MThirst = player getVariable [QCLASS(thirst), MACRO_PLAYER_THIRST];

titleText ["You inject the Electrolyte solution...", "PLAIN DOWN"];

player removeItem QCLASS(electrolyte);
private _c = 10;
[{ _this call fnc_electrolyte;}, [_c, "The Electrolyte injection has worn off..."], 10] call CBA_fnc_waitAndExecute;

