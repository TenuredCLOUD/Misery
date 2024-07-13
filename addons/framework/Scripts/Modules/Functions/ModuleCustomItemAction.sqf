/*
Misery Module startup function (Cusotm item interactions inventory)
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;

_this execVM "\z\misery\addons\framework\scripts\Inventory\AddCustomItemAction.sqf";