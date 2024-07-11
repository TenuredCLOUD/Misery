/*
Refuel at Jetfuel pump check
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private ["_refillatpump","_target"];

_refillatpump=FALSE;

_target = cursorTarget;

if ((_target isKindOf "Helicopter" || _target isKindOf "Plane") && (player distance _target < 15) && ("Misery_AutoBatt" in items player)) then {
	
	_refillatpump = TRUE;

	if (_refillatpump)exitwith{};
};
		_refillatpump //return