/*
Refuel at pump check
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private ["_refillatpump","_target"];

_refillatpump=FALSE;

_target = cursorTarget;

if ((_target isKindOf "LandVehicle" || _target isKindOf "Ship") && (player distance _target < 5) && ("Misery_AutoBatt" in items player)) then {
	
	_refillatpump = TRUE;

	if (_refillatpump)exitwith{};
};
		_refillatpump //return