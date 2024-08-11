/*
Parser for custom item usage 
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private["_module","_className","_script"];
_module=_this select 0;
_className=_module getVariable "Misery_className";
_script=_module getVariable "Misery_script";
if(_className=="")exitWith{};
if(_script=="")exitWith{};
waitUntil{!isNil "MiseryActionsItemCustom"};
MiseryActionsItemCustom pushBack[_className,_script];
