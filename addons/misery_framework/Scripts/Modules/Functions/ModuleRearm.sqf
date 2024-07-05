 /* -----------------------------------
Misery Module startup function (Rearm zone)
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
	//Haleks target defines:
	_targets = 0;
	if !(hasInterface) then {
		_targets = -2;
	};
	[[_module, _units], "Misery\Scripts\Modules\Rearm\Rearm.sqf"] remoteExec ["execVM", _targets, true];
};

}, [_module,_units,_activated]] call CBA_fnc_waitUntilAndExecute;
TRUE

