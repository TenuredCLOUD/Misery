 /* -----------------------------------
Misery Module startup function (Rad Zone)
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
	
	private _EXECTARGETS = []; 

if (isServer) then { 
    _EXECTARGETS = [0, -2] select isDedicated;
};
	[[_module, _units], "Misery\Scripts\Modules\RadZone\RadZone.sqf"] remoteExec ["execVM", _EXECTARGETS, true];
};

}, [_module,_units,_activated]] call CBA_fnc_waitUntilAndExecute;
TRUE

