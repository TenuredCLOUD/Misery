_tent = (_this select 3) select 0;
_caller = _this select 1;
if (count weaponCargo _tent > 0 || count magazineCargo _tent > 0 || count itemCargo _tent > 0) exitWith {
	hintsilent "You must empty the tent first!"; 
};

if (!isNil "loot_to_clean" && {_tent in loot_to_clean}) then {
	loot_to_clean = loot_to_clean - [_tent];
};

_tent remoteExec ["removeAllActions", 0, false];
_pos = getPosATL _tent;
sleep 1;
_caller playActionNow "medicStartRightSide";
sleep 4;
deleteVehicle _tent;
_lootholder = createVehicle ["GroundWeaponHolder", _Pos, [], 0, "CAN_COLLIDE"];
_lootholder addMagazineCargoGlobal ["rvg_foldedTent_grey", 1];
_caller playActionNow "medicStop";
