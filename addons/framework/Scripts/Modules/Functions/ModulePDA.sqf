/*
Misery Module startup function (PDA alert zones)
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private _module=_this select 0;
private _units=_this select 1;
private _activated=_this select 2;

waitUntil {sleep 1; !isNil "MiseryReady"};

if (_activated) then {
	//Haleks target defines:
	_targets = 0;
	if !(hasInterface) then {
		_targets = -2;
	};
	[[_module, _units], "\z\misery\addons\framework\scripts\Modules\PDA\PDAalertzone.sqf"] remoteExec ["execVM ", _targets, true];
};



