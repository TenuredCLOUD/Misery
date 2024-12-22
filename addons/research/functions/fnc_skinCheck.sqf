#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * skinning compat for WBK IMS Compat
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_research_fnc_skinCheck;
 *
*/

//Will choose which skinning method to start based on nearby dead corpse / animal:

if (call FUNC(IsdeadZed)) then {
[] call FUNC(skin);
};
