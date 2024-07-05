
private ["_fuelgearJ"];

_fuelgearJ =FALSE;

_Check_items = items player;

if ("Misery_EmptyJet" in _Check_items && "Misery_AutoBatt" in _Check_items)  then {
	
	_fuelgearJ = TRUE;

	if (_fuelgearJ)exitwith{};
};
		_fuelgearJ //return