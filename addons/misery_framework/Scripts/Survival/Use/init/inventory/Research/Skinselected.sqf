/* -----------------------------------
Misery skinning compat for WBK IMS Compat 
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

//Will choose which skinning method to start based on nearby dead corpse / animal:

if (call Misery_fnc_IsdeadZed) then {
[] execVM "Misery\Scripts\Survival\Use\init\inventory\Research\Skinzombie.sqf";
}else{
[] execVM "\ravage\actions\gut.sqf";
};