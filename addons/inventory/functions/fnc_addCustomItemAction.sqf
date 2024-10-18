#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Parser for custom item usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_inventory_fnc_addCustomItemAction
 *
*/

private["_module","_className","_script"];
_module=_this select 0;
_className=_module getVariable "Misery_className";
_script=_module getVariable "Misery_script";
if(_className=="")exitWith{};
if(_script=="")exitWith{};
waitUntil{!isNil "MiseryActionsItemCustom"};
MiseryActionsItemCustom pushBack[_className,_script];
