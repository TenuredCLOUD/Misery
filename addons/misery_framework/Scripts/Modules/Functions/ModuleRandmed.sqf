 /* -----------------------------------
Misery Module startup function (Medical randomizer)
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

private _module=_this select 0;
private _units=_this select 1;
private _activated=_this select 2;

[{!isNil "MiseryReady"},
{

params ["_module","_units","_activated"];

if (_activated) then {
[_module,_units] execVM "Misery\Scripts\Modules\Gear\Randommeds.sqf";
};

}, [_module,_units,_activated]] call CBA_fnc_waitUntilAndExecute;
TRUE

