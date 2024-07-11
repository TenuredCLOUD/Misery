/*
Misery Glucose injection usage
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

#include "\z\misery\addons\misery_framework\Scripts\Misery_PreParser.hpp"

fnc_glucose = {

params ["_c", "_text"];

if (!hasInterface || {!alive player}) exitWith {};
if (_c == 0) exitwith {titleText [_text, "PLAIN DOWN"];}; //exit loop 
player setVariable ["MiseryHunger", (_MHunger + 5)];
_c = _c - 1;

[{ _this call fnc_glucose;}, [_c, _text], 10] call CBA_fnc_waitAndExecute;  
};

if (!hasInterface || {!alive player}) exitWith {};

private _MHunger = player getVariable ["MiseryHunger", MIS_HUNGER];

titleText ["You inject the Glucose solution...", "PLAIN DOWN"];

player removeitem "Misery_glucose";
private _c = 10;
[{ _this call fnc_glucose;}, [_c, "The Glucose injection has worn off..."], 10] call CBA_fnc_waitAndExecute;


