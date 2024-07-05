private _object=_this;
private _object2=objNull;
private _pos=getPosASL _object;
private _height=.5;
private _terrain=FALSE;
if(_object isKindOf"StaticWeapon")then{_height=2};
_pos=[_pos select 0,_pos select 1,(_pos select 2)+_height];
private _pos2=[_pos select 0,_pos select 1,(_pos select 2)-10];
//private _out=lineIntersectsSurfaces[_pos,_pos2,_object,objNull,TRUE,1,"VIEW","GEOM",TRUE];
private _out=lineIntersectsSurfaces[_pos,_pos2,_object,player,TRUE,1,"VIEW","GEOM",TRUE];
//systemChat str (_out select 0);
_pos2=(_out select 0)select 0;
_pos2=[_pos2 select 0,_pos2 select 1,(_pos2 select 2)];//+.01
_object2=(_out select 0)select 2;
if(isNull((_out select 0)select 2))then{_terrain=TRUE};
if(_object2==player)then{_object2=objNull};
if(isNull _object2)then{_object2=_object};
[_pos2,_object2,_terrain]