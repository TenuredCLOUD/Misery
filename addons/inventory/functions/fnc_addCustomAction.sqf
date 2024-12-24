#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Custom action for GUI parser
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_inventory_fnc_addCustomAction
 *
*/

private["_module","_units","_description","_script","_waitTime"];
_module=_this select 0;
_units=_this select 1;
_description=_module getVariable "Misery_description";
_script=_module getVariable "Misery_script";
_waitTime=_module getVariable "Misery_waitTime";
if(_description=="")exitWith{};
if(_script=="")exitWith{};
if((count _units)>0)exitWith{
    if(player in _units)then{EGVAR(actions,guiCustomActions) pushBack[_description,_script]};
};
EGVAR(actions,guiCustomActions) pushBack[_description,_script];
