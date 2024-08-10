
private ["_deadzed"];

_deadzed=FALSE;

private _target = cursortarget;

if ((_target iskindof "zombie") && (damage _target) >= 1) then {
	
	_deadzed = TRUE;

	if (_deadzed)exitwith{};
};
		_deadzed //return