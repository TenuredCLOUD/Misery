_bedroll = (_this select 3) select 0;
_caller = _this select 1;

if (!isNil "loot_to_clean" && {_bedroll in loot_to_clean}) then {
	loot_to_clean = loot_to_clean - [_bedroll];
};

_bedroll remoteExec ["removeAllActions", 0, false];
_pos = getPosATL _bedroll;
sleep 1;
_caller playActionNow "medicStartRightSide";
sleep 4;
deleteVehicle _bedroll;
_lootholder = createVehicle ["GroundWeaponHolder", _Pos, [], 0, "CAN_COLLIDE"];
_lootholder addMagazineCargoGlobal ["rvg_sleepingBag_Blue", 1];
_caller playActionNow "medicStop";