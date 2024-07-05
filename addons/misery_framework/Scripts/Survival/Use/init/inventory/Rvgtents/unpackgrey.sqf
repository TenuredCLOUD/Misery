closeDialog 602;
sleep 1;
_dir = getDir player;
_location = [player, 3, _dir] call BIS_fnc_relPos;
_O = lineIntersects [_location, getPosASL player, player];
if (_O) exitWith {hintSilent "You need more space to build this."};
player playActionNow "medicStartRightSide";
sleep 4;
player removeMagazine _this; //removes current tent 
_tent = createVehicle ["Camping_Tent", /*ASLToATL*/ _location, [], 0, "CAN_COLLIDE"];
_tent setDir _dir;
_tent setVectorUP (surfaceNormal [(getPosATL _tent) select 0, (getPosATL _tent) select 1]);
[_tent, [("<t color=""#ffc600"">" + ("Pack Tent") + "</t>"), "Misery\Scripts\Survival\Use\init\inventory\Rvgtents\packgrey.sqf",[_tent], 1, false, true, "", "vehicle _this == _this"]] remoteExec ["addAction", 0, true];
player playActionNow "medicStop";

