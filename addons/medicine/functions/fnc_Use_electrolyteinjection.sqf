#include "\z\misery\addons\main\script_macros.hpp"

/*
Misery Electrolyte injection usage
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

fnc_electrolyte = {

params ["_c", "_text"];

if (!hasInterface || {!alive player}) exitWith {};
if (_c == 0) exitwith {titleText [_text, "PLAIN DOWN"];}; //exit loop 
player setVariable ["MiseryThirst", (_MThirst + 5)];
_c = _c - 1;

[{ _this call fnc_electrolyte;}, [_c, _text], 10] call CBA_fnc_waitAndExecute;  
};

if (!hasInterface || {!alive player}) exitWith {};

private _MThirst = player getVariable ["MiseryThirst", MIS_THIRST];

titleText ["You inject the Electrolyte solution...", "PLAIN DOWN"];

player removeitem "Misery_electrolyte";
private _c = 10;
[{ _this call fnc_electrolyte;}, [_c, "The Electrolyte injection has worn off..."], 10] call CBA_fnc_waitAndExecute;

