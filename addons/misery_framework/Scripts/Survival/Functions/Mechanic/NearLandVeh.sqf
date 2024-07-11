/*
Nearland veh no tanks check
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private ["_foundVeh","_target"];

_foundVeh=FALSE;

_target = cursorTarget;

if ( !(_target isKindOf "Tank") && _target isKindOf "LandVehicle" && player distance _target < 5) then {
	
	_foundVeh = TRUE;

	if (_foundVeh)exitwith{};
};
		_foundVeh //return