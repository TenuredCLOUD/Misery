/* -----------------------------------
Misery Fill water bottle from Jerrycan (dirty)
Designed specifically for Misery mod 
by TenuredCLOUD 
*/


if (alive player) then {
	
private _random = [1, 10] call BIS_fnc_randomInt;	

if !("rvg_plasticBottleEmpty" in magazines player) exitwith {titleText ["You don't have a bottle...", "PLAIN DOWN"]};

////---------------------------------------------------Keep water
  if (_random > 5) exitwith {

player removeMagazine "rvg_plasticBottleEmpty";
player addMagazine "rvg_plasticBottle";

  titleText ["You refilled your bottle", "PLAIN DOWN"];

};

//---------------------------------------------------dumped jerrycan
if (_random == 5) exitwith {

titleText ["You filled your bottle, but spilled your Jerrycan in the process...", "PLAIN DOWN"];

player removeitem 'Misery_WaterJerryFD'; 
player additem 'Misery_WaterJerryE';
	
	sleep 0.5;

player removeMagazine "rvg_plasticBottleEmpty";
player addMagazine "rvg_plasticBottle";

};

////---------------------------------------------------Keep water
if (_random < 5) exitwith {

player removeMagazine "rvg_plasticBottleEmpty";
player addMagazine "rvg_plasticBottle";

titleText ["You refilled your bottle", "PLAIN DOWN"];

};
	};