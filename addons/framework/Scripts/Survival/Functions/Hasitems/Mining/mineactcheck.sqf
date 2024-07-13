
private ["_found"];    

_found=FALSE;  

private _Check_items = items player;  
if (vehicle player == player && "Misery_Pickaxe" in _Check_items) then {        
		_found = TRUE;

		if (_found)exitwith{};
};
		
		_found //return