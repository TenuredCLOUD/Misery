
private ["_fuelgear"];

_fuelgear =FALSE;

_Check_items = items player;

if ("Misery_EmptyDiesel" in _Check_items && "Misery_AutoBatt" in _Check_items || "Misery_EmptyPetrol" in _Check_items && "Misery_AutoBatt" in _Check_items)  then {
	
	_fuelgear = TRUE;

	if (_fuelgear)exitwith{};
};
		_fuelgear //return