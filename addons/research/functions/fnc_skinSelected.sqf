#include "..\script_component.hpp"
/*
Misery skinning compat for WBK IMS Compat
Designed specifically for Misery mod
by TenuredCLOUD
*/

//Will choose which skinning method to start based on nearby dead corpse / animal:

if (call FUNC(IsdeadZed)) then {
[] execVM "\z\misery\addons\research\functions\fnc_skinzombie.sqf";
};
