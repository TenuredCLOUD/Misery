closeDialog 602;
sleep 1;
_dir = getDir player;
_location = [player, 2, _dir] call BIS_fnc_relPos;
_O = lineIntersects [_location, getPosASL player, player];//posASL!!!
if (_O) exitWith {hintsilent "You need more space to build this."};
player playActionNow "medicStartRightSide";
sleep 4;
player removeMagazine _this; //removes current sleeping bag 
_bedroll = createVehicle ["Land_Sleeping_bag_blue_F", /*ASLToATL*/ _location, [], 0, "CAN_COLLIDE"];
_bedroll setPosATL [getPosATL _bedroll select 0, getPosATL _bedroll select 1, getPosATL player select 2];
_bedroll setDir _dir;
_bedroll setVectorUP (surfaceNormal [(getPosATL _bedroll) select 0, (getPosATL _bedroll) select 1]);
[_bedroll, [("<t color=""#ffc600"">" + ("Pack Sleeping Bag") + "</t>"), "Misery\Scripts\Survival\Use\init\inventory\Rvgtents\fold.sqf",[_bedroll], 1, false, true, "", "vehicle _this == _this"]] remoteExec ["addAction", 0, true];
player playActionNow "medicStop";
if !(isNil "loot_to_clean") then {0 = loot_to_clean pushBack _bedroll};
