
private ["_found"];    

_found=FALSE;  

_Check_items = items player;  
if (vehicle player == player) then {     
	
	if (count (nearestObjects [player, 
				["Land_fs_feed_F",
				"Land_FuelStation_Feed_F",
				"Land_Ind_TankSmall2",
				"Land_Ind_TankSmall2_EP1",
				"Land_A_FuelStation_Feed",
				"Land_fuelstation",
				"Land_Ind_FuelStation_Feed_EP1"], 1.5, true, true]) > 0) then {      
		_found = TRUE;};      
		
		if (_found)exitwith{};
		
		};  
		_found