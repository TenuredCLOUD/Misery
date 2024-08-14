private["_posIn","_crateType","_safe","_pos"];
_posIn=_this select 0;
_crateType=_this select 1;
if((count _posIn)==0)exitWith{[]};
_safe=true;
_pos=_posIn;
if!(_pos call Misery_misc_fnc_IsInsideloot)then{_safe=false};
if!(_safe)then{if(_pos call Misery_fnc_IsInGeometry)then{_safe=false}};
if!(_safe)then{_pos=_pos findEmptyPosition[0,50,_crateType]};
if((count _pos)==0)then{_pos=[_posIn select 0,_posIn select 1,0]};//1
_pos
