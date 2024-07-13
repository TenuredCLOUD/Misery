private["_pos","_pos2","_out"];
_pos=ATLtoASL _this;
_pos2=[_pos select 0,_pos select 1,((_pos select 2)+1)];
_out=lineIntersectsWith[_pos,_pos2];
if((_out select 0) isKindOf "Building")exitWith{TRUE};
FALSE