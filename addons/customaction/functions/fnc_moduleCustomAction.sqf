/*
Misery Module startup function (Custom action Menu GUI)
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
[_this] call Misery_Inventory_fnc_AddCustomAction;