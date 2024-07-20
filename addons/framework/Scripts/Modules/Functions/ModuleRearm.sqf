/*
Misery Module startup function (Rearm zone)
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private _module=_this select 0;
private _units=_this select 1;
private _activated=_this select 2;

[{!isNil "MiseryReady"},
{

params ["_module","_units","_activated"];

if (_activated) then {
	
	[[_module, _units], "\z\misery\addons\framework\scripts\Modules\Rearm\Rearm.sqf"] remoteExec ["execVM ", [0, -2] select isDedicated, true];
};

}, [_module,_units,_activated]] call CBA_fnc_waitUntilAndExecute;
TRUE

