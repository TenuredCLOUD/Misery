private ["_foundVeh","_target"];

_foundVeh=FALSE;

_target = cursorTarget;

if (_target isKindOf "Helicopter" && player distance _target < 5) then {
	
	_foundVeh = TRUE;

	if (_foundVeh)exitwith{};
};
		_foundVeh //return