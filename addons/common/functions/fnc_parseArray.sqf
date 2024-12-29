#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, Drongo
 * Basically parseSimpleArray but works whether there are brackets on the array or not. Designed for arrays of strings
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_common_fnc_parseArray;
 *
*/

private["_string","_array"];
_string="";if((typeName _this)=="STRING")then{_string=_this}else{_string=str _this};
//_array=[];
//{if((typeName _x)=="STRING")then{_array pushBack _x}else{_array pushBack(str _x)}}forEach(_string splitString",");
//_string=_this;
if(_string=="")exitWith{[]};
if!(((_string splitString "")select 0)=="[")then{_string=format["[%1]",_string]};
(parseSimpleArray _string)

/*
 * I have absolutely no fucking idea what is going on with this function. But it hurts my soul to look at.
 * Hemtt also does not like it.
*/
