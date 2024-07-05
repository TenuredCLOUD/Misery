/* -----------------------------------
Misery Fill canteen from Jerrycan (dirty)
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

if (alive player) then {

private _random = [1, 10] call BIS_fnc_randomInt;	

if !("rvg_canteenEmpty" in magazines player) exitwith {titleText ["You don't have a canteen...", "PLAIN DOWN"]};

////---------------------------------------------------Keep water
  if (_random > 5) exitwith {

player removeMagazine "rvg_canteenEmpty";
player addMagazine "rvg_canteen";

  titleText ["You refilled your canteen", "PLAIN DOWN"];

};

//---------------------------------------------------dumped jerrycan
if (_random == 5) exitwith {

titleText ["You filled your canteen, but spilled your Jerrycan in the process...", "PLAIN DOWN"];

player removeitem 'Misery_WaterJerryFD'; 
player additem 'Misery_WaterJerryE';
	
	sleep 0.5;

player removeMagazine "rvg_canteenEmpty";
player addMagazine "rvg_canteen";

};

////---------------------------------------------------Keep water
if (_random < 5) exitwith {

player removeMagazine "rvg_canteenEmpty";
player addMagazine "rvg_canteen";

titleText ["You refilled your canteen", "PLAIN DOWN"];

};
	};