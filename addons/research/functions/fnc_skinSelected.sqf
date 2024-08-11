/*
Misery skinning compat for WBK IMS Compat 
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

#include "\z\misery\addons\main\script_macros.hpp"

//Will choose which skinning method to start based on nearby dead corpse / animal:

if (call FUNC(IsdeadZed)) then {
[] execVM "\z\misery\addons\research\functions\fnc_skinzombie.sqf";
};