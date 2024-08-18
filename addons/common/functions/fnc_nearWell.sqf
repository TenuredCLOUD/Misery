#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, Drongo
 * Near well check 
 *
 * Arguments:
 * 0: NONE
 *
 * Return Value:
 * 0: NONE
 *
 * Example:
 * [] call misery_common_fnc_nearWell;
 *
*/

private["_found","_type","_rDir"];
_found=false;
_type="";
_rDir=0;
{
_rDir=(player getRelDir _x);
if((_rDir>270)OR(_rDir<90))then{
    _type=toLower format["%1",_x];
    {
    if((_type find _x)>-1)exitWith{_found=true};
    }forEach MiseryWaterSources;
};
if(_found)exitWith{};
}forEach(nearestObjects[player,[],2.5]);

_found //return val (BOOL)
