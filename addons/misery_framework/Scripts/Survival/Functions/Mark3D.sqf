private["_pos","_m","_type","_o"];
_pos=_this select 0;
_m=_this select 1;
_type="VR_3DSelector_01_default_F";
if(_m=="YELLOW")then{_type="VR_3DSelector_01_incomplete_F"};
if(_m=="RED")then{_type="VR_3DSelector_01_exit_F"};
_o=_type createVehicle _pos;
_o setPosATL _pos;
_o