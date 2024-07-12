/*
Custom action for GUI parser
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private["_module","_units","_description","_script","_waitTime"];
_module=_this select 0;
_units=_this select 1;
_description=_module getVariable "Misery_description";
_script=_module getVariable "Misery_script";
_waitTime=_module getVariable "Misery_waitTime";
if(_description=="")exitWith{};
if(_script=="")exitWith{};
waitUntil{!isNil"MiseryActionsCustom"};
sleep _waitTime;
if((count _units)>0)exitWith{
	if(player in _units)then{MiseryActionsCustom pushBack[_description,_script]};
};
MiseryActionsCustom pushBack[_description,_script];
